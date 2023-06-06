import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addpartner extends StatefulWidget {
  const Addpartner({Key? key}) : super(key: key);

  @override
  State<Addpartner> createState() => _AddpartnerState();
}

class _AddpartnerState extends State<Addpartner> {
  List<String> res = [];
  List<String> res1 = [];
  String init = '';
  String init1 = '';
  Partner_Api dropdownFunction = Partner_Api();
  PartnerMRI_Api dropdownMRIfunction = PartnerMRI_Api();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
    getList();
    getMRI();
  }
  getList() async {
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_p_status_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  getMRI() async {
    List<dynamic> dlist = await dropdownMRIfunction.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res1.add(i['get_partner_mri_dropdown']);
      });
    }
    setState(() {
      init1 = res1[0];
    });
    print("safgsdgsdgsdfgde $res1");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsAllNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  height: 30.0,
                  width: 500.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lan_outlined, color: kBlackColor),
                        Text('Create Partner', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                verticalSpaceTiny,
                Container(
                  padding: kEdgeInsetsAllLarge,
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  width: 500.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Partner ID :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Partner Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Partner Desc :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Partner Account :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Partner API URL :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Merchant Payment Callback URL :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Merchant Id Prefix :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("MRI Group :", style: kHeading2TextStyle),
                          DropdownButton(
                            value: init1,
                            items: res1.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e,
                                    style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                init1 = value.toString();
                              });
                            },
                          ),                          verticalSpaceTiny,
                          DropdownButton(
                            value: init,
                            items: res.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e,
                                    style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                init = value.toString();
                              });
                            },
                          ),
                          verticalSpaceXTiny,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
