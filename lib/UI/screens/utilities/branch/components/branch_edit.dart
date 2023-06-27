import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/branch/addbranch/addbranch.dart';
import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import 'package:webtool_rep/UI/utils/model2.dart';
import '../../branch/branch.dart';



class BranchEditFunction extends StatefulWidget {
  String? code1;
  String? desc1;
  String? date1;
  BranchEditFunction({Key? key, this.code1, this.date1, this.desc1})
      : super(key: key);

  @override
  State<BranchEditFunction> createState() => _BranchEditFunctionState();
}

class _BranchEditFunctionState extends State<BranchEditFunction> {
  String descText1 = '';
  String code1 = '';
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<Branch_U>(context, listen: false);
    void close() {
      Navigator.pop(context);
      Navigator.pop(context,
          MaterialPageRoute(
            builder: (context) =>  HomePage(),
          ));
    }

    Future<void> wait() async {
      shared.BranchLog.clear();
      shared.Branch_data.clear();
      Branch_Parse branch = Branch_Parse();
      var res = await branch.profile24();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0].toJson().length);
        setState(() {
          shared.BranchLog.add(Branch_Api.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.Branch_data.add(Branch_Log.fromJson(i.toJson()));
        }
      }
      for (var i in shared.Branch_data) {
        print(i.toJson());
      }
    }

    return Form(
      key: _formKey1,
      child: AlertDialog(
        actions: <Widget>[
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.code1!,
            decoration: InputDecoration(
                labelText: 'Code',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              setState(() {
                code1 = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: widget.desc1!,
            decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(borderSide: BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                descText1 = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.date1,
            decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            // onSaved: (value) {
            //   widget.date = value!;
            // },
          ),
          SizedBox(height: 10),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Update'),
            onPressed: () async {
              print(widget.code1);
              print(descText1);
              if (_formKey1.currentState!.validate()) {
                _formKey1.currentState!.save();
                //Navigator.of(dashboardContext!).pop(false);
                try {
                  const String apiUrl =
                      'https://sit-api-janus.fortress-asya.com:1234/edit_branch';
                  final Map<String, dynamic> data = {
                    "get_branch_code": widget.code1,
                    "get_branch_desc": descText1,
                    "get_branch_id": widget.code1
                    // Add more fields as needed
                  };

                  final http.Response response = await http.post(
                    Uri.parse(apiUrl),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(data),
                  );
                  print(
                      "-------->>>>>>>>>>${jsonDecode(response.body).length}");
                  if (response.statusCode == 200) {
                    print(
                        "-------->>>>>>>>>>${jsonDecode(response.body).length}");
                    // Data was successfully updated
                    print('Restore Successful');
                    setState(() {
                      shared.isLoaded = false;
                    });
                    await wait();
                    setState(() {
                      home.onTaps = () {
                        setState(() {
                          home.header = "Branch";
                          home.title = "Change Password";
                          home.homewidget = [const Changepassword()];
                        });
                      };
                      home.onPress = () {
                        setState(() {
                          home.onPress = () {
                            setState(() {
                              home.addicon = Icons.add_outlined;
                              home.icon = Icons.people_outline;
                              home.addicon = Icons.add_outlined;
                              home.uploadbutton = "";
                              home.subuploadbutton = "";
                              home.addbutton = "New Branch";
                              home.subaddbutton = "Add New Branch";
                              home.header = "Utilities";
                              home.title = "Branch";
                              home.homewidget = [const Branch()];
                            });
                          };
                          home.icon = Icons.add_outlined;
                          home.addicon = Icons.save_outlined;
                          home.header = "Utilities  >  Create / Edit";
                          home.addbutton = "Save";
                          home.subaddbutton = "Save Branch";
                          home.title = "Create / Edit";
                          home.homewidget = [const Addbranch()];
                        });
                      };
                      home.addicon = Icons.add_outlined;
                      home.icon = Icons.people_outline;
                      home.addicon = Icons.add_outlined;
                      home.uploadbutton = "";
                      home.subuploadbutton = "";
                      home.addbutton = "New Branch";
                      home.subaddbutton = "Add Branch";
                      home.header = "Utilities";
                      home.title = "Branch";
                      home.homewidget = [const Branch()];
                    });
                    close();
                  } else {
                    print(
                        "-------->>>>>>>>>>${jsonDecode(response.body).length}");
                    // Failed to update data
                    print('Failed to update data');
                    Navigator.of(context).pop(false);
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
