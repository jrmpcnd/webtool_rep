import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/UI/screens/login/changePassword.dart';
import 'package:webtool_rep/UI/screens/login/components/loginapi.dart';


class Dashboard extends StatefulWidget {
  static const String route = '/Dashboardpage';
  String? user;
  String? oldpass;
  Dashboard({
    Key? key,
    this.user,
    this.oldpass,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

class _DashboardState extends State<Dashboard> {
  final _formPass = GlobalKey<FormState>();
  // TextEditingController userController = TextEditingController();
  TextEditingController oldpassController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController retypepassController = TextEditingController();
  final _scrollController = ScrollController();
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    void pop() {
      Navigator.pop(context);
    }

    Reset reset = Reset();

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
                      Text('Welcome',
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
                            // controller: oldpassController,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(300, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
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
                      http.Response response = await reset.reset(widget.user!,
                          newpassController.text, retypepassController.text);
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
                            title: Text("Reset Successfully"),
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
              SizedBox(height: 50),
              TextButton(
                child: Text("Change Password"),
                onPressed: () {
                  Navigator.of(context).pushNamed(Changepass.route);
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Changepass(
                        user: widget.user!,
                        oldpass: widget.oldpass!,
                      );
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ChatMessageWidget extends StatelessWidget {
//   const ChatMessageWidget(
//       {super.key, required this.text, required this.chatMessageType});
//
//   final String text;
//   final ChatMessageType chatMessageType;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       padding: const EdgeInsets.all(16),
//       color: chatMessageType == ChatMessageType.bot
//           ? botBackgroundColor
//           : backgroundColor,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           chatMessageType == ChatMessageType.bot
//               ? Container(
//                   margin: const EdgeInsets.only(right: 16.0),
//                   child: CircleAvatar(
//                     backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
//                     child: Image.asset(
//                       'assets/bot.png',
//                       scale: 1.5,
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                 )
//               : Container(
//                   margin: const EdgeInsets.only(right: 16.0),
//                   child: const CircleAvatar(
//                     child: Icon(
//                       Icons.person,
//                     ),
//                   ),
//                 ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Text(
//                     text,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyLarge
//                         ?.copyWith(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
