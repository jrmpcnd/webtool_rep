import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addparameters extends StatefulWidget {
  const Addparameters({Key? key}) : super(key: key);

  @override
  State<Addparameters> createState() => _AddparametersState();
}

class _AddparametersState extends State<Addparameters> {
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
                        Text('Parameter', style: kTinyBoldTextStyle),
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
                          Text("Parameter Type :", style: kHeading2TextStyle),
                          dropdowns(dropdown: "--Parameter Type--"),
                          verticalSpaceTiny,
                          Text("Parameter Name :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Parameter Value :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "Parameter Value",
                          ),
                          verticalSpaceTiny,
                          Text("Description :", style: kHeading2TextStyle),
                          AutoSizeWidget(
                            initialWidth: 400,
                            initialHeight: 150,
                            maxWidth: 400,
                            maxHeight: 200,
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            showIcon: true,
                            child: const TextField(
                              style: TextStyle(color: kBlackColor),
                              maxLines: 3 * 120,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                focusColor: kBlackColor,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 15),
                                hintText: "Enter text here",
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                            ),
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
