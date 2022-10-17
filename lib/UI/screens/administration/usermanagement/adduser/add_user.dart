import 'package:flutter/material.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/textfield.dart';

class Addusers extends StatefulWidget {
  const Addusers({Key? key}) : super(key: key);

  @override
  State<Addusers> createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Row(
        children: [
          Expanded(
            child: Column(
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  height: 600.0,
                  width: 550.0,
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
                    height: 600.0,
                    width: 550.0,
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
