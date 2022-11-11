import 'package:flutter/material.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addusers extends StatefulWidget {
  const Addusers({Key? key}) : super(key: key);

  @override
  State<Addusers> createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  String _groupValue = '';

  void checkRadio(String value) {
    setState(() {
      _groupValue = value;
    });
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  height: 30.0,
                  width: 450.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.person_outline, color: kBlackColor),
                        Text('Account Details', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                verticalSpaceTiny,
                Container(
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  height: 550.0,
                  width: 450.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Given Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Middle Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Last Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Email :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Mobile no. :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("User Status :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Concurrent User Status :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
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
                            offset: Offset(0, 3)),
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                    height: 30.0,
                    width: 650.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.lan_outlined, color: kBlackColor),
                          Text('Granted Roles', style: kTinyBoldTextStyle),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  Container(
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
                    width: 650.0,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                              width: 650.0,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: kEdgeInsetsAllNormal,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Text("Accounting",
                                                style: kTextStyle),
                                            leading: Radio(
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                value: 'Accounting',
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text(
                                                "konek2CARD Team Member",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'konek2CARD Team Member',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("Cashier",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Cashier',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("MobColl Support",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'MobColl Support',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text(
                                                "Mobile Collection User",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Mobile Collection User',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("Merchant Manager",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Merchant Manager',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("Area Manager",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Area Manager',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("testing",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'testing',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title:
                                                Text("Test", style: kTextStyle),
                                            leading: Radio(
                                                value: 'Test',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("App Admin TEST ALY",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'App Admin TEST ALY',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("Web App Admin",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Web App Admin',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("TestMel",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'TestMel',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text(
                                                "konek2CARD Team Member SME",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value:
                                                    'konek2CARD Team Member SME',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title:
                                                Text("CSR", style: kTextStyle),
                                            leading: Radio(
                                                value: 'CSR',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title:
                                                Text("test", style: kTextStyle),
                                            leading: Radio(
                                                value: 'test',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("SME Web Admin",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'SME Web Admin',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("Test123",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Test123',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("View Only Role",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'View Only Role',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("View Only",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'View Only',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                          ListTile(
                                            title: Text("Developer",
                                                style: kTextStyle),
                                            leading: Radio(
                                                value: 'Developer',
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        kBlackColor),
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  checkRadio(value as String);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
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
                            offset: Offset(0, 3)),
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                    height: 30.0,
                    width: 650.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.lan_outlined, color: kBlackColor),
                          Text('Structure', style: kTinyBoldTextStyle),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                        width: 650.0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: kEdgeInsetsAllNormal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Institution", style: kTextStyle),
                                        horizontalSpaceMedium,
                                        dropdowns(
                                            dropdown: "--CARD Bank Inc.--"),
                                      ],
                                    ),
                                    verticalSpaceSmall,
                                    Row(
                                      children: [
                                        Text("Branch", style: kTextStyle),
                                        horizontalSpaceSLarge,
                                        dropdowns(dropdown: "--Non Selected--"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
