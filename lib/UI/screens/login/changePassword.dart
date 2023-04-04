import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/UI/screens/login/login_dashboard.dart';

import 'components/loginapi.dart';

class Changepass extends StatefulWidget {
  static const String route = '/Changepassword';
  String? user;
  String? oldpass;
  Changepass({
    Key? key,
    this.user,
    this.oldpass,
  }) : super(key: key);

  @override
  State<Changepass> createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {
  final _formPass = GlobalKey<FormState>();
  // TextEditingController userController = TextEditingController();
  TextEditingController oldpassController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController retypepassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void pop() {
      Navigator.pop(context);
    }

    Change change = Change();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text('Change Password',
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
                        initialValue: widget.user!,
                        mouseCursor: SystemMouseCursors.forbidden,
                        readOnly: true,
                        decoration: InputDecoration(hintText: 'Login User '),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please insert Password';
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            initialValue: widget.oldpass!,
                            obscureText: true,
                            decoration:
                            InputDecoration(hintText: 'Old Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please insert Password';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                oldpassController.text = value!;
                              });
                            },
                          ),
                          TextFormField(
                            controller: newpassController,
                            decoration:
                            InputDecoration(hintText: 'New Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please insert Password';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                newpassController.text = value!;
                              });
                            },
                          ),
                          TextFormField(
                            controller: retypepassController,
                            decoration: InputDecoration(
                                hintText: 'Retype New Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please insert Password';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                retypepassController.text = value!;
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
                      http.Response response = await change.change(
                          widget.user!,
                          widget.oldpass!,
                          newpassController.text,
                          retypepassController.text);
                      // http.Response res = await search.search(userController.text);
                      print(jsonDecode(response.body)['message']);
                      if (await jsonDecode(response.body)['message']
                          .contains('failed')) {
                        debugPrint('Reset Failed');
                      } else {
                        if (jsonDecode(response.body)['message']
                            .toString()
                            .toLowerCase()
                            .contains('Reset successfully')) {
                          pop();
                        } else {
                          pop();
                          var message = jsonDecode(response.body)['message'];
                          AlertDialog alert = AlertDialog(
                            title: Text("Change Password Successfully"),
                            content: Text(message),
                            actions: [
                              TextButton(
                                child: Text("OK"),
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
