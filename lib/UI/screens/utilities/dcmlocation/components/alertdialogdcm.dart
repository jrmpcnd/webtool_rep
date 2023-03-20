import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/dcmlocation/adddcmlocation/add_dcmlocation.dart';
import 'package:webtool_rep/UI/screens/utilities/dcmlocation/dcm_location.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/addunit/addunit.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/unit.dart';

import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';

import 'package:webtool_rep/UI/utils/model2.dart';

class AlertEditFunction extends StatefulWidget {
  String? atmAddress;
  String? atmCity;
  String? atmDescription;
  String? atmId;
  String? atmLatitude;
  String? atmLongitude;
  String? instDesc;
  AlertEditFunction({Key? key, this.atmDescription,this.atmCity,this.atmAddress,this.instDesc,this.atmId,this.atmLongitude,this.atmLatitude})
      : super(key: key);

  @override
  State<AlertEditFunction> createState() => _AlertEditFunctionState();
}

class _AlertEditFunctionState extends State<AlertEditFunction> {

  String provID = "";
  String provatmCity = "";
  String provatmDescription = "";
  String provatmAddress = "";
  String provatmLatitude = "";
  String provatmLongitude = "";
  String provinstDesc = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<AtmLocation>(context, listen: false);
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
      shared.AtmLocation_Log.clear();
      shared.AtmLocation_data.clear();
      Unit_Parse unit = Unit_Parse();
      var res = await unit.profile25();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0].toJson().length);
        setState(() {
          shared.AtmLocation_Log.add(Atm_Loc_Api.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.AtmLocation_data.add(Atm_Loc_Log.fromJson(i.toJson()));
        }
      }
      for (var i in shared.AtmLocation_data) {
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
            initialValue: widget.atmId!,
            decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              setState(() {
                provID = value!;
              });
            },
          ), TextFormField(
            initialValue: widget.instDesc!,
            decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(borderSide: BorderSide())),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter a name';
            //   }
            //   return null;
            // },
            onSaved: (value) {
              setState(() {
                provatmDescription = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: widget.atmAddress!,
            decoration: InputDecoration(
                labelText: 'Street / Brgy *',
                border: OutlineInputBorder(borderSide: BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                provatmAddress = value!;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.atmCity,
            decoration: InputDecoration(
                labelText: 'City / Province *',
                border: OutlineInputBorder(borderSide: BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
             provatmCity = value!;
            },
          ),
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.atmLongitude,
            decoration: InputDecoration(
                labelText: 'Longitude',
                border: OutlineInputBorder(borderSide: BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              provatmLongitude = value!;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            mouseCursor: SystemMouseCursors.forbidden,
            readOnly: true,
            initialValue: widget.atmLatitude,
            decoration: InputDecoration(
                labelText: 'Latitude',
                border: OutlineInputBorder(borderSide: BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
             provatmLatitude = value!;
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

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                //Navigator.of(dashboardContext!).pop(false);
                try {
                  const String apiUrl =
                      'https://sit-api-janus.fortress-asya.com:1234/edit_unit';
                  final Map<String, dynamic> data = {
                    "get_atm_address": provatmAddress.toString(),
                    "get_atm_city": provatmCity.toString(),
                    "get_atm_description": provatmDescription.toString(),
                    "get_atm_id": provID.toString(),
                    "get_atm_latitude": provatmLatitude.toString(),
                    "get_atm_longitude": provatmLongitude.toString(),
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
                          home.header = "DCM Location";
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
                              home.addbutton = "New DCM Location";
                              home.subaddbutton = "Add New DCM Location";
                              home.header = "Utilities";
                              home.title = "DCM Location";
                              home.homewidget = [const Dcmlocation()];
                            });
                          };
                          home.icon = Icons.add_outlined;
                          home.addicon = Icons.save_outlined;
                          home.header = "Utilities  >  Create / Edit";
                          home.addbutton = "Save";
                          home.subaddbutton = "Save DCM Location";
                          home.title = "Create / Edit";
                          home.homewidget = [const Adddcmlocation()];
                        });
                      };
                      home.addicon = Icons.add_outlined;
                      home.icon = Icons.people_outline;
                      home.addicon = Icons.add_outlined;
                      home.uploadbutton = "";
                      home.subuploadbutton = "";
                      home.addbutton = "New DCM Location";
                      home.subaddbutton = "Add New DCM Location";
                      home.header = "Utilities";
                      home.title = "DCM Location";
                      home.homewidget = [const Dcmlocation()];
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
