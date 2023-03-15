import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/utilities/feestructure/addstructure/add_structure.dart';
import 'package:webtool_rep/UI/screens/utilities/feestructure/free_structure.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import '../../../../../core/providers/Provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import '../../../../utils/model.dart';
class AlertEditFunction extends StatefulWidget {
  String? feeId;
  String? transType;
  String? range;
  String? totalCharge;
  String? agentIncome;
  String? bankIncome;
  String? agentTargetIncome;
  String? bancnetIncome;
  AlertEditFunction({Key? key, this.feeId,this.transType,this.range,this.totalCharge,this.agentIncome,this.bankIncome,this.agentTargetIncome,this.bancnetIncome}) : super(key: key);

  @override
  State<AlertEditFunction> createState() => _AlertEditFunctionState();
}

class _AlertEditFunctionState extends State<AlertEditFunction> {
  List<String> res = [];
  String init = '';
  String transType = '';
  FeeStructure_Api dropdownFunction = FeeStructure_Api();
  String rangeText = '';
  String feeId = '';
  String totalCharge = '';
  String agentIncome = "";
  String bankIncome = "";
  String agentTargetIncome = "";
  final _formKey = GlobalKey<FormState>();

  getList() async {
    print("==>>${widget.transType}");
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for (var i in dlist) {
      print(i['get_fs_transaction_dropdown'].toString().toLowerCase().contains(widget.transType!.toLowerCase().replaceAll("_", " ")));
      print(widget.transType!.toString() == "CIP");
      setState(() {
        res.add(i['get_fs_transaction_dropdown']);
      });
      if( widget.transType!.toString() == "AIP") {
        if (i['get_fs_transaction_dropdown'].toString() == "Agent Assisted Payment") {
          setState(() {
            init = i['get_fs_transaction_dropdown'];
          });
        }
      }
      if( widget.transType!.toString() == "CIP") {
        if (i['get_fs_transaction_dropdown'].toString() == "Client Initiated Payment") {
          setState(() {
            init = i['get_fs_transaction_dropdown'];
          });
        }
      }
      if(i['get_fs_transaction_dropdown'].toString().toLowerCase().contains(widget.transType!.toLowerCase().replaceAll("_", " "))){
        setState(() {
          init = i['get_fs_transaction_dropdown'];
        });
      }
    }

    print("safgsdgsdgsdfgde $res");
  }
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
    getList();
  }

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomePageProvider>(context, listen: false);
    final shared = Provider.of<Prov12>(context, listen: false);
    void close(){
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }
    Future<void> wait() async {
      shared.fee.clear();
      shared.fee_data.clear();
      Unit_Parse unit = Unit_Parse();
      var res = await unit.profile25();
      if (res.data!.isNotEmpty) {
        print(res.data!.length);
        print(res.data![0]
            .toJson()
            .length);
        setState(() {
          shared.fee.add(Fee_Structure.fromJson(res.toJson()));
          shared.isLoaded = true;
        });
        for (var i in res.data!) {
          shared.fee.add(Fee_Structure.fromJson(i.toJson()));
        }
      }
      for (var i in shared.fee_data) {
        print(i.toJson());
      }
    }
    return Form(
      key: _formKey,
      child: Container(

        height: 200,
        width: 200,
        child: Padding(padding: EdgeInsets.all(10),child: AlertDialog(
          actions: <Widget>[
            Column(children: [
              SizedBox(

                child: DropdownButton(
                  value: init,
                  items: res.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child:
                      Text(e, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      init = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              Row(children: [
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    initialValue: widget.range!,
                    decoration: InputDecoration(
                        labelText: 'Range',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        rangeText = value!;
                      });
                    },
                  ),
                ),

              ],),
              SizedBox(height: 20,),
              TextFormField(
                mouseCursor: SystemMouseCursors.forbidden,
                readOnly: true,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp(r"^[\d+-.]+$")),],
                initialValue: widget.totalCharge!,
                decoration: InputDecoration(
                    labelText: 'Total Charge',
                    border: OutlineInputBorder(borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    totalCharge = value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp(r"^[\d+-.]+$")),],
                initialValue: widget.agentIncome!,
                decoration: InputDecoration(
                    labelText: 'Agent Income',
                    border: OutlineInputBorder(borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    agentIncome = value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp(r"^[\d+-.]+$")),],
                initialValue: widget.bankIncome!,
                decoration: InputDecoration(
                    labelText: 'Bank Income',
                    border: OutlineInputBorder(borderSide: BorderSide())),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a name';
                //   }
                //   return null;
                // },
                onSaved: (value) {
                  setState(() {
                    bankIncome = value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp(r"^[\d+-.]+$")),],
                mouseCursor: SystemMouseCursors.forbidden,
                readOnly: true,
                initialValue: widget.agentTargetIncome!,
                decoration: InputDecoration(
                    labelText: 'Agent Targets Income',
                    border: OutlineInputBorder(borderSide: BorderSide())),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a name';
                //   }
                //   return null;
                // },
                onSaved: (value) {
                  setState(() {
                    agentTargetIncome = value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                mouseCursor: SystemMouseCursors.forbidden,
                readOnly: true,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp(r"^[\d+-.]+$")),],
                initialValue: widget.bancnetIncome!,
                decoration: InputDecoration(
                    labelText: 'AP Bancnet Instapay',
                    border: OutlineInputBorder(borderSide: BorderSide())),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a name';
                //   }
                //   return null;
                // },
                onSaved: (value) {
                  setState(() {
                    feeId = value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20,),
              TextButton(
                child: Text('Update'),
                onPressed: () async {
                  print(widget.feeId);
                  print(rangeText);
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //Navigator.of(dashboardContext!).pop(false);
                    try {
                      const String apiUrl =
                          'https://sit-api-janus.fortress-asya.com:1234/edit_unit';
                      final Map<String, dynamic> data = {
                        "Range": widget.range,
                        "agent_income": widget.agentIncome,
                        "agent_target_income": widget.agentTargetIncome,
                        "bancnet_income": widget.bancnetIncome,
                        "bank_income": widget.bankIncome,
                        "fee_id": widget.feeId,
                        "total_charge": widget.totalCharge,
                        "trans_type": widget.transType,
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
                              home.header = "Fee Structure";
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
                                  home.addbutton = "New Fee Structure";
                                  home.subaddbutton = "Add New Fee Structure";
                                  home.header = "Utilities";
                                  home.title = "Fee Structure";
                                  home.homewidget = [const Feestructure()];
                                });
                              };
                              home.icon = Icons.add_outlined;
                              home.addicon = Icons.save_outlined;
                              home.header = "Utilities  >  Create / Edit";
                              home.addbutton = "Save";
                              home.subaddbutton = "Save Fee Structure";
                              home.title = "Create / Edit";
                              home.homewidget = [const Addstructure()];
                            });
                          };
                          home.addicon = Icons.add_outlined;
                          home.icon = Icons.people_outline;
                          home.addicon = Icons.add_outlined;
                          home.uploadbutton = "";
                          home.subuploadbutton = "";
                          home.addbutton = "New Fee Structure";
                          home.subaddbutton = "Add New Fee Structure";
                          home.header = "Utilities";
                          home.title = "Fee Structure";
                          home.homewidget = [const Feestructure()];
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
            ],),
          ],
        ),),
      )
    );
  }
}