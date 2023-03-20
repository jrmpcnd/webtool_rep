import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/branch/addbranch/addbranch.dart';
import 'package:webtool_rep/UI/screens/utilities/center/center.dart';

import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';

import 'package:webtool_rep/UI/utils/model2.dart';

import '../../branch/branch.dart';
import '../addcenter/addcenter.dart';

class CenterEditFunction extends StatefulWidget {
  String? code;
  String? desc;
  String? date;
  CenterEditFunction({Key? key, this.code, this.date, this.desc})
      : super(key: key);

  @override
  State<CenterEditFunction> createState() => _CenterEditFunctionState();
}

class _CenterEditFunctionState extends State<CenterEditFunction> {
  String descText = '';
  String code = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<Center_U>(context, listen: false);
    void close() {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }

    Future<void> wait() async {
      shared.CenterLog.clear();
      shared.Center_data.clear();
      Center_Parse unit = Center_Parse();
      var res = await unit.profile26();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0].toJson().length);
        setState(() {
          shared.CenterLog.add(Center_Api.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.Center_data.add(Center_Log.fromJson(i.toJson()));
        }
      }
      for (var i in shared.Center_data) {
        print(i.toJson());
      }
    }

    return Form(
      key: _formKey,
      child: AlertDialog(
        actions: <Widget>[
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.code!,
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
                code = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: widget.desc!,
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
                descText = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.date,
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
              print(widget.code);
              print(descText);
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                //Navigator.of(dashboardContext!).pop(false);
                try {
                  const String apiUrl =
                      'https://sit-api-janus.fortress-asya.com:1234/edit_center';
                  final Map<String, dynamic> data = {
                    "get_center_code": widget.code,
                    "get_center_desc": descText,
                    "get_center_id": widget.code
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
                          home.header = "Unit";
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
                              home.addbutton = "New Unit";
                              home.subaddbutton = "Add New Unit";
                              home.header = "Utilities";
                              home.title = "Unit";
                              home.homewidget = [const Centers()];
                            });
                          };
                          home.icon = Icons.add_outlined;
                          home.addicon = Icons.save_outlined;
                          home.header = "Utilities  >  Create / Edit";
                          home.addbutton = "Save";
                          home.subaddbutton = "Save Unit";
                          home.title = "Create / Edit";
                          home.homewidget = [const Addcenters()];
                        });
                      };
                      home.addicon = Icons.add_outlined;
                      home.icon = Icons.people_outline;
                      home.addicon = Icons.add_outlined;
                      home.uploadbutton = "";
                      home.subuploadbutton = "";
                      home.addbutton = "New Unit";
                      home.subaddbutton = "Add Unit";
                      home.header = "Utilities";
                      home.title = "Unit";
                      home.homewidget = [const Centers()];
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
