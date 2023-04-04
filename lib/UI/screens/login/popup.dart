import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:webtool_rep/UI/screens/login/components/loginapi.dart';
import 'package:webtool_rep/UI/screens/login/login_dashboard.dart';

class Pop extends StatefulWidget {
  static const String route = '/Pop_up';
  String? user;
  String? oldpass;
  Pop({
    Key? key,
    this.user,
    this.oldpass,
  }) : super(key: key);

  @override
  State<Pop> createState() => _PopState();
}

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

class _PopState extends State<Pop> {
  final _formPass = GlobalKey<FormState>();
  // TextEditingController userController = TextEditingController();
  TextEditingController oldpassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _scrollController = ScrollController();
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = false;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid"),
          content:
          Text('You need to input a new password. Confirm your email.'),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    void pop() {
      Navigator.pop(context);
    }

    Confirmation confirm = Confirmation();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: backgroundColor),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text('Initial Password',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  )),
              SizedBox(height: 100),
              Form(
                key: _formPass,
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      color: Colors.grey[400],
                      child: TextFormField(
                        // controller: userController,
                        initialValue: widget.user!,
                        mouseCursor: SystemMouseCursors.forbidden,
                        readOnly: true,
                        decoration: InputDecoration(hintText: 'Login User '),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please insert Password';
                        //   }
                        // },
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 400,
                      color: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            // controller: oldpassController,
                            initialValue: widget.oldpass!,
                            obscureText: true,
                            readOnly: true,
                            decoration:
                            InputDecoration(hintText: 'Old Password'),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please insert Password';
                            //   }
                            // },
                            onSaved: (value) {
                              setState(() {
                                oldpassController.text = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'Insert Email to Confirm'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please insert Email';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                emailController.text = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Container(
                height: 30,
                width: 300,
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () async {
                    if (_formPass.currentState!.validate()) {
                      _formPass.currentState!.save();
                      AlertDialog loading = AlertDialog(
                        title: Text("Please wait!"),
                        content: Row(children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Loading")
                        ]),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return loading;
                        },
                      );
                      http.Response response = await confirm.confirm(
                        emailController.text, widget.user!,
                        // userController.text
                      );
                      // http.Response res = await search.search(userController.text);
                      print(jsonDecode(response.body)['message']);
                      if (await jsonDecode(response.body)['message'].contains(
                          'Confirm your email or contact customer service.')) {
                        pop();
                        var message = jsonDecode(response.body)['message'];
                        AlertDialog alert = AlertDialog(
                          title: Text("Invalid ⚠️"),
                          content: Text(message),
                          actions: [
                            TextButton(
                              child: Text("OK ✅"),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Dashboard.route);
                                Navigator.pop(context);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Dashboard();
                                      },
                                    ));
                              },
                            ),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      } else {
                        if (jsonDecode(response.body)['message']
                            .toString()
                            .toLowerCase()
                            .contains('Please Check your Eamil.')) {
                          pop();
                        } else {
                          pop();
                          var message = jsonDecode(response.body)['message'];
                          AlertDialog alert = AlertDialog(
                            title: Text("Email Successfully Sent ✉️"),
                            content: Text(message),
                            actions: [
                              TextButton(
                                child: Text("OK ✅"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Dashboard.route);
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Dashboard();
                                        },
                                      ));
                                },
                              ),
                            ],
                          );
                          showDialog(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
