import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/banklist/addbanklist/addbank_list.dart';
import 'package:webtool_rep/UI/screens/utilities/banklist/bank_list.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/addunit/addunit.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/unit.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';

import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';

import 'package:webtool_rep/UI/utils/model2.dart';

import '../../../../../core/providers/data_provider.dart';

class BankEditFunction extends StatefulWidget {
  String? code;
  String? name;
  String? short;
  String? bic;
  BankEditFunction({Key? key, this.code, this.short, this.name, this.bic})
      : super(key: key);

  @override
  State<BankEditFunction> createState() => _BankEditFunctionState();
}

class _BankEditFunctionState extends State<BankEditFunction> {
  String code = '';
  String descText = '';
  String descText1 = '';
  String descText2 = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<Prov19>(context, listen: false);
    void close() {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }

    void pop() {
      Navigator.pop(context);
    }

    Future<void> wait() async {
      shared.list.clear();
      shared.list_data.clear();
      Bank_ListParse unit = Bank_ListParse();
      var res = await unit.profile19();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0].toJson().length);
        setState(() {
          shared.list.add(Bank_List.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.list_data.add(Data19.fromJson(i.toJson()));
        }
      }
      for (var i in shared.list_data) {
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
                labelText: 'Bank Code',
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
            initialValue: widget.name!,
            decoration: InputDecoration(
                labelText: 'Bank Name',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              setState(() {
                descText = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: widget.short,
            decoration: InputDecoration(
                labelText: 'Short Name',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              descText1 = value!;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: widget.bic,
            decoration: InputDecoration(
                labelText: 'BIC',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              descText2 = value!;
            },
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
                      'https://sit-api-janus.fortress-asya.com:1234/edit_banklist';
                  final Map<String, dynamic> data = {
                    "get_banklist_id": widget.code,
                    "get_bank_code": widget.code,
                    "get_bank_name": descText,
                    "get_short_name": descText1,
                    "get_bank_bic": descText2
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
                          home.header = "Bank List";
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
                              home.subaddbutton = "Add New Bank List";
                              home.header = "Utilities";
                              home.title = "Bank List";
                              home.homewidget = [const Banklist()];
                            });
                          };
                          home.icon = Icons.add_outlined;
                          home.addicon = Icons.save_outlined;
                          home.header = "Utilities  >  Create / Edit";
                          home.addbutton = "Save";
                          home.subaddbutton = "Save Bank List";
                          home.title = "Create / Edit";
                          home.homewidget = [const Addbanklist()];
                        });
                      };
                      home.addicon = Icons.add_outlined;
                      home.icon = Icons.people_outline;
                      home.addicon = Icons.add_outlined;
                      home.uploadbutton = "";
                      home.subuploadbutton = "";
                      home.addbutton = "New Bank List";
                      home.subaddbutton = "Add Bank List";
                      home.header = "Utilities";
                      home.title = "Bank List";
                      home.homewidget = [const Banklist()];
                    });
                    close();
                  } else {
                    print(
                        "-------->>>>>>>>>>${jsonDecode(response.body).length}");
                    // Failed to update data
                    print('Failed to update data');
                    pop();
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
