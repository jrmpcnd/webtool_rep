import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/textfield.dart';

class Addhierarchy extends StatefulWidget {
  const Addhierarchy({Key? key}) : super(key: key);

  @override
  State<Addhierarchy> createState() => _AddhierarchyState();
}

class _AddhierarchyState extends State<Addhierarchy> {
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
                  width: 600.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lan_outlined, color: kBlackColor),
                        Text('Hierarchy', style: kTinyBoldTextStyle),
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
                  height: 450.0,
                  width: 600.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Branch Code :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Branch Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          Text("Unit Code :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Unit Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Center Code :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Center Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
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
