import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/customerservice/typeofconcern/type_of_concern.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../../core/providers/Provider.dart';
import '../../../../../core/providers/data_provider.dart';
import '../../../../utils/api.dart';



class AlertEditFunction extends StatefulWidget {
  String? concernCode;
  String? concernDesc;
  String? concernLevel;
  String? concernName;
  String? concernTime;
  AlertEditFunction({Key? key, this.concernName,this.concernLevel,this.concernTime,this.concernCode,this.concernDesc})
      : super(key: key);

  @override
  State<AlertEditFunction> createState() => _AlertEditFunctionState();
}

class _AlertEditFunctionState extends State<AlertEditFunction> {
  List<String> res = [];
  String init = '';
  Parameter_Api dropdowneFunction = Parameter_Api();


  String provparamconcernCode = "";
  String provconcernName = "";
  String provconcernTime = "";
  String provconcernLevel = "";
  String provconcerndesc = "";

  final _formKey = GlobalKey<FormState>();

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
      final shared2 = Provider.of<Prov10>(context, listen: false);
      shared2.concern.clear();
      shared2.concern_data.clear();

      Type_ConcernParse httpParse2 = Type_ConcernParse();
      var res2 = await httpParse2.profile10();
      if (res2.data!.isNotEmpty) {
        print(res2.data!.length);
        print(res2.data![0].toJson().length);
        setState(() {
          shared2.concern.add(Type_of_Concern.fromJson(res2.toJson()));

        });
        for (var i in res2.data!) {
          setState(() {});
          shared2.concern_data.add(Data10.fromJson(i.toJson()));
        }
      }
      for (var i in shared2.concern_data) {
        print(i.toJson());
      }
    }

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 120),
        child: AlertDialog(
          content: Column(children: [
            TextFormField(
              mouseCursor: SystemMouseCursors.forbidden,
              readOnly: true,
              initialValue: widget.concernName!,
              decoration: InputDecoration(
                  labelText: 'Concern Name*',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter a name';
              //   }
              //   return null;
              // },
              onSaved: (value) {
                setState(() {
                  provconcernName = value!;
                });
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              initialValue: widget.concernDesc!,
              decoration: InputDecoration(
                  labelText: 'Concern Description *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter a name';
              //   }
              //   return null;
              // },
              onSaved: (value) {
                setState(() {
                  provconcerndesc = value!;
                });
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              initialValue: widget.concernTime!,
              decoration: InputDecoration(
                  labelText: 'Turn Around Time (In Minutes) *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  provconcernTime = value!;
                });
              },
            ),
            SizedBox(height: 15),
            TextFormField(

              initialValue: widget.concernLevel,
              decoration: InputDecoration(
                  labelText: 'Complexity Level *',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                provconcernLevel = value!;
              },
            ),
            SizedBox(height: 15,),
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
                    if(provparamconcernCode.isEmpty){
                      provparamconcernCode = widget.concernCode.toString();
                    }
                    if(provconcernName.isEmpty){
                      provconcernName = widget.concernName.toString();

                    } if(provconcernLevel.isEmpty){
                      provconcernLevel = widget.concernLevel.toString();
                    }
                    if(provconcernTime.isEmpty){
                      provconcernTime = widget.concernTime.toString();
                    } if(provconcerndesc.isEmpty){
                      provconcernTime = widget.concernDesc.toString();
                    }
                    print("-------->>>>>>>>>>1213$provconcernLevel");

                    const String apiUrl =
                        'https://sit-api-janus.fortress-asya.com:1234/edit_concerntype';
                    final Map<String, dynamic> data = {
                     "get_concern_code" : provparamconcernCode.toString(),
                     "get_concern_desc" : provconcerndesc.toString(),
                     "get_concern_level" : provconcernLevel.toString(),
                     "get_concern_name" : provconcernName.toString(),
                     "get_concern_time" : provconcernTime.toString(),
                      "get_last_updated_by": 0
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
                      print(jsonDecode(response.body));
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
                            home.header = "Client Profile";
                            home.title = "Change Password";
                            home.homewidget = [const Changepassword()];
                          });
                        };
                        home.onPress = () {};
                        home.addicon = Icons.add_outlined;
                        home.icon = Icons.list_alt_outlined;
                        home.uploadbutton = "";
                        home.subuploadbutton = "";
                        home.addbutton = "New Concern";
                        home.subaddbutton = "Add New Type Concern";
                        home.header = "Customer Service";
                        home.title = "Type of Concern";
                        home.homewidget = [const Typeofconcern()];
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
