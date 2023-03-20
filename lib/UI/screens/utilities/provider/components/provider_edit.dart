import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/banklist/addbanklist/addbank_list.dart';
import 'package:webtool_rep/UI/screens/utilities/banklist/bank_list.dart';
import 'package:webtool_rep/UI/screens/utilities/provider/addprovider/addprovider.dart';
import 'package:webtool_rep/UI/screens/utilities/provider/providers.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/addunit/addunit.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/unit.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';

import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';

import 'package:webtool_rep/UI/utils/model2.dart';

import '../../../../../core/providers/data_provider.dart';

class ProviderEditFunction extends StatefulWidget {
  String? prov_id;
  String? prov_name;
  String? prov_desc;
  String? prov_alias;
  String? prov_status;
  ProviderEditFunction(
      {Key? key,
      this.prov_id,
      this.prov_desc,
      this.prov_name,
      this.prov_alias,
      this.prov_status})
      : super(key: key);

  @override
  State<ProviderEditFunction> createState() => _ProviderEditFunctionState();
}

class _ProviderEditFunctionState extends State<ProviderEditFunction> {
  String prov_id = '';
  String descText = '';
  String descText1 = '';
  String descText2 = '';
  String descText3 = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<Providers_U>(context, listen: false);
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
      shared.ProvidersLog.clear();
      shared.Providers_data.clear();
      Provider_Parse unit = Provider_Parse();
      var res = await unit.profile26();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0].toJson().length);
        setState(() {
          shared.ProvidersLog.add(Providers_Api.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.Providers_data.add(Providers_Log.fromJson(i.toJson()));
        }
      }
      for (var i in shared.Providers_data) {
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
            initialValue: widget.prov_id!,
            decoration: InputDecoration(
                labelText: 'Provider ID',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              setState(() {
                prov_id = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: widget.prov_name!,
            decoration: InputDecoration(
                labelText: 'Provider Name',
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
            initialValue: widget.prov_desc,
            decoration: InputDecoration(
                labelText: 'Provider Description',
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
            initialValue: widget.prov_alias,
            decoration: InputDecoration(
                labelText: 'Provider Alias',
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
          // TextFormField(
          //   initialValue: widget.prov_status,
          //   decoration: InputDecoration(
          //       labelText: 'Status',
          //       border: OutlineInputBorder(borderSide: BorderSide())),
          //   // validator: (value) {
          //   //   if (value == null || value.isEmpty) {
          //   //     return 'Please enter a name';
          //   //   }
          //   //   return null;
          //   // },
          //   onSaved: (value) {
          //     descText3 = value!;
          //   },
          // ),
          // SizedBox(height: 10),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Update'),
            onPressed: () async {
              print(widget.prov_id);
              print(descText);
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                //Navigator.of(dashboardContext!).pop(false);
                try {
                  const String apiUrl =
                      'https://sit-api-janus.fortress-asya.com:1234/edit_provider';
                  final Map<String, dynamic> data = {
                    "get_provider_id": widget.prov_id,
                    "get_provider_name": descText,
                    "get_description": descText1,
                    "get_provider_alias": descText2,
                    "get_last_updated_by": 0,
                    "get_status": 0
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
                              home.addbutton = "New Provider";
                              home.subaddbutton = "Add New Provider";
                              home.header = "Utilities";
                              home.title = "Provider";
                              home.homewidget = [const Providers()];
                            });
                          };
                          home.icon = Icons.add_outlined;
                          home.addicon = Icons.save_outlined;
                          home.header = "Utilities  >  Create / Edit";
                          home.addbutton = "Save";
                          home.subaddbutton = "Save Provider";
                          home.title = "Create / Edit";
                          home.homewidget = [const Addproviders()];
                        });
                      };
                      home.addicon = Icons.add_outlined;
                      home.icon = Icons.people_outline;
                      home.addicon = Icons.add_outlined;
                      home.uploadbutton = "";
                      home.subuploadbutton = "";
                      home.addbutton = "New Provider";
                      home.subaddbutton = "Add Provider";
                      home.header = "Utilities";
                      home.title = "Provider";
                      home.homewidget = [const Providers()];
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
