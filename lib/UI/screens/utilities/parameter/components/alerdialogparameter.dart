import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/dcmlocation/adddcmlocation/add_dcmlocation.dart';
import 'package:webtool_rep/UI/screens/utilities/dcmlocation/dcm_location.dart';
import 'package:webtool_rep/UI/screens/utilities/parameter/addparameter/add_parameter.dart';
import 'package:webtool_rep/UI/screens/utilities/parameter/parameter.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import '../../../../../core/providers/data_provider.dart';
import '../../../../utils/api.dart';



class AlertEditFunction extends StatefulWidget {
  String? paramId;
  String? appType;
  String? paramName;
  String? paramValue;
  String? paramDesc;
  AlertEditFunction({Key? key, this.appType,this.paramDesc,this.paramName,this.paramValue,this.paramId})
      : super(key: key);

  @override
  State<AlertEditFunction> createState() => _AlertEditFunctionState();
}

class _AlertEditFunctionState extends State<AlertEditFunction> {
  List<String> res = [];
  String init = '';
  Parameter_Api dropdowneFunction = Parameter_Api();


  String provparamId = "";
  String provappType = "";
  String provparamName = "";
  String provparamValue = "";
  String provparamDesc = "";
  final _formKey = GlobalKey<FormState>();
  getEdit() async {
    List<dynamic> dlist = await dropdowneFunction.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_pc_parametertype_dropdown']);
      });
      if (widget.appType!.toString().toLowerCase().contains('core')) {
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase()
            .contains('core')) {
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
      if (widget.appType!.toString().toLowerCase().contains('web')) {
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase()
            .contains('web')) {
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
      if (widget.appType!.toString().toLowerCase().contains('system')){
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase() == 'customer'){
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
      if (widget.appType!.toString().toLowerCase().contains('interlink')){
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase()
            .contains('interlink')){
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
      if (widget.appType!.toString().toLowerCase().contains('socket')){
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase()
            .contains('socket')){
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
      if (widget.appType!.toString().toLowerCase().contains('col')){
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase()
            .contains('collection')){
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
      if (widget.appType!.toString().toLowerCase().contains('param')){
        if (i['get_pc_parametertype_dropdown'].toString()
            .toLowerCase()
            .contains('parameter')){
          setState(() {
            init = i['get_pc_parametertype_dropdown'];
          });
        }
      }
    }
    print("=====>>>apptype: ${widget.appType}");

    print("safgsdgsdgsdfgde $res");
  }
  @override
  void initState() {
    super.initState();
    getEdit();
  }

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<Prov13>(context, listen: false);
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
      shared.prov.clear();
      shared.prov_data.clear();
      Unit_Parse unit = Unit_Parse();
      var res = await unit.profile25();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0].toJson().length);
        setState(() {
          shared.prov.add(Prov_Config.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.prov_data.add(Data13.fromJson(i.toJson()));
        }
      }
      for (var i in shared.prov_data) {
        print(i.toJson());
      }
    }

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 120),
        child: AlertDialog(
          content: Column(children: [
            SizedBox(
              child: DropdownButton(
                value: init,
                items: res.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child:
                    Text(e, ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    init = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              mouseCursor: SystemMouseCursors.forbidden,
              readOnly: true,
              initialValue: widget.paramId!,
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
                  provparamId = value!;
                });
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              initialValue: widget.paramDesc!,
              decoration: InputDecoration(
                  labelText: 'Parameter Type *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter a name';
              //   }
              //   return null;
              // },
              onSaved: (value) {
                setState(() {
                  provparamDesc = value!;
                });
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              initialValue: widget.paramName!,
              decoration: InputDecoration(
                  labelText: 'Parameter Name *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  provparamName = value!;
                });
              },
            ),
            SizedBox(height: 15),
            TextFormField(

              initialValue: widget.paramValue,
              decoration: InputDecoration(
                  labelText: 'CParameter Value *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                provparamValue = value!;
              },
            ),
            SizedBox(height: 15,),
            TextFormField(
              initialValue: widget.paramDesc,
              decoration: InputDecoration(
                  labelText: 'Description *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                provparamDesc = value!;
              },
            ),
          ]),
          actions: <Widget>[
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
                      // "get_atm_address": provatmAddress.toString(),
                      // "get_atm_city": provatmCity.toString(),
                      // "get_atm_description": provatmDescription.toString(),
                      // "get_atm_id": provID.toString(),
                      // "get_atm_latitude": provatmLatitude.toString(),
                      // "get_atm_longitude": provatmLongitude.toString(),
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
                            home.header = "Parameter";
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
                                home.addbutton = "New Parameter";
                                home.subaddbutton = "Add New Parameter";
                                home.header = "Utilities";
                                home.title = "Parameter";
                                home.homewidget = [const Parameters()];
                              });
                            };
                            home.icon = Icons.add_outlined;
                            home.addicon = Icons.save_outlined;
                            home.header = "Utilities  >  Create / Edit";
                            home.addbutton = "Save";
                            home.subaddbutton = "Save Parameter";
                            home.title = "Create / Edit";
                            home.homewidget = [const Addparameters()];
                          });
                        };
                        home.addicon = Icons.add_outlined;
                        home.icon = Icons.people_outline;
                        home.addicon = Icons.add_outlined;
                        home.uploadbutton = "";
                        home.subuploadbutton = "";
                        home.addbutton = "New Parameter";
                        home.subaddbutton = "Add New Parameter";
                        home.header = "Utilities";
                        home.title = "Parameter";
                        home.homewidget = [const Parameters()];
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
      ),
    );
  }
}
