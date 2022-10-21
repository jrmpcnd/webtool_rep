import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/textfield.dart';

class Addcsrdashboard extends StatefulWidget {
  const Addcsrdashboard({Key? key}) : super(key: key);

  @override
  State<Addcsrdashboard> createState() => _AddcsrdashboardState();
}

class _AddcsrdashboardState extends State<Addcsrdashboard> {
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
                        Text('Client Information', style: kTinyBoldTextStyle),
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
                  height: 680.0,
                  width: 450.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CID :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Type of Client :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Family Name :", style: kHeading2TextStyle),
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
                          Text("Mobile Number. :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Branch :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Unit :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          Text("Center Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          Text("Birthday :", style: kHeading2TextStyle),
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
                          const Icon(Icons.call_outlined, color: kBlackColor),
                          Text(' Detail Information',
                              style: kTinyBoldTextStyle),
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
                    height: 900.0,
                    width: 650.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Given Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Middle Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Last Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Email", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Mobile no.", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("User Status", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Concurrent User Status",
                                style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Given Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Middle Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Last Name", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Email", style: kHeading2TextStyle),
                            textfield(
                              hintext: "",
                            ),
                            verticalSpaceTiny,
                            Text("Concurrent User Status",
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
            ],
          ),
        ],
      ),
    );
  }
}
