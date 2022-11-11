import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addstructure extends StatefulWidget {
  const Addstructure({Key? key}) : super(key: key);

  @override
  State<Addstructure> createState() => _AddstructureState();
}

class _AddstructureState extends State<Addstructure> {
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
                        Text('Fee Structure', style: kTinyBoldTextStyle),
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
                  height: 600.0,
                  width: 500.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Client Type :", style: kHeading2TextStyle),
                          dropdowns(dropdown: "--Client Type--"),
                          verticalSpaceTiny,
                          Text("Transaction Type :", style: kHeading2TextStyle),
                          dropdowns(dropdown: "--Transaction Type--"),
                          Text("Range :", style: kHeading2TextStyle),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              textfield(
                                keyboardtype: TextInputType.number,
                                inputformatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 100,
                                hintext: "Min.",
                              ),
                              horizontalSpaceSmall,
                              textfield(
                                keyboardtype: TextInputType.number,
                                inputformatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 100,
                                hintext: "Max.",
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Text("Total Charge :", style: kHeading2TextStyle),
                          textfield(
                            mousecursor: SystemMouseCursors.forbidden,
                            readonly: true,
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Agent Income :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Bank Income :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Agent Target's Income :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("AP Bancney Instapay :",
                              style: kHeading2TextStyle),
                          textfield(
                            mousecursor: SystemMouseCursors.forbidden,
                            readonly: true,
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
