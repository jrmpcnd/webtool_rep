// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/popup.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/edge_insect.dart';
import 'components/loginapi.dart';

class buildCard extends StatefulWidget {
  static const String route = 'Loginpage';
  const buildCard({Key? key}) : super(key: key);

  @override
  State<buildCard> createState() => _buildCardState();
}

class _buildCardState extends State<buildCard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passController.dispose();
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    void pop() {
      Navigator.pop(context);
    }

    Logout logout = Logout();
    Login login = Login();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 1)),
          ],
        ),
        width: 430,
        height: 350,
        padding: kEdgeInsetsAllSNormal,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                Container(
                  width: 350,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: const TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(left: 30),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    controller: userController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please insert Username';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    obscureText: _isObscure,
                    autocorrect: true,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.only(left: 30),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: kSecondaryColor2,
                      ),
                      suffixIcon: IconButton(
                          color: kSecondaryColor2,
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                    ),
                    controller: passController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please insert Password';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: const Size(350, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Submit"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          AlertDialog loading = AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text(
                              "Please Wait",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            content: Row(children: const [
                              CircularProgressIndicator(
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Loading...",
                                style: TextStyle(color: Colors.black),
                              )
                            ]),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return loading;
                            },
                          );
                          http.Response response = await login.login(
                              userController.text, passController.text);
                          // http.Response res = await search.search(userController.text);
                          print(
                              "Checkpoint 1: ${jsonDecode(response.body)['message']}");
                          // print(jsonDecode(res.body)['data']['name']);
                          if (await jsonDecode(response.body)['message'].contains(
                              'You need to input a new password. Confirm your email.')) {
                            pop();
                            Navigator.of(context).pushNamed(Pop.route);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Pop(
                                  user: userController.text,
                                  oldpass: passController.text,
                                );
                              },
                            ));
                            debugPrint('Login Failed');
                          } else {
                            if (jsonDecode(response.body)['message']
                                .toString()
                                .toLowerCase()
                                .contains('successfully')) {
                              pop();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return HomePage(
                                    user: userController.text,
                                    oldpass: passController.text,
                                  );
                                },
                              ));
                            } else {
                              pop();
                              var message =
                                  jsonDecode(response.body)['message'];
                              // try {
                              //   message = jsonDecode(response.body)['message'];
                              // } catch (e) {
                              //   print(e.toString());
                              //   message = e.toString();
                              // }
                              AlertDialog alert = AlertDialog(
                                title: const Text("Invalid Login"),
                                content: Text(message),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            }
                            if (await jsonDecode(response.body)['message']
                                .contains("You're already logged in.")) {
                              AlertDialog alert = AlertDialog(
                                title: Text("Force Login?"),
                                actions: [
                                  Center(
                                    child: TextButton(
                                      child: Text("OK"),
                                      onPressed: () async {
                                        http.Response response = await logout
                                            .logout(userController.text);
                                        print(jsonDecode(
                                            response.body)['message']);
                                        if (await jsonDecode(
                                                response.body)['message']
                                            .toString()
                                            .toLowerCase()
                                            .contains("logout")) {}
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return HomePage(
                                              user: userController.text,
                                              oldpass: passController.text,
                                            );
                                          },
                                        ));
                                      },
                                    ),
                                  ),
                                ],
                              );
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            }
                          }
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
