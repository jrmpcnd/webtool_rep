import 'package:flutter/material.dart';
import 'package:webtool_rep/core/getter_setter.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addcommission extends StatefulWidget {
  const Addcommission({Key? key}) : super(key: key);

  @override
  State<Addcommission> createState() => _AddcommissionState();
}

class _AddcommissionState extends State<Addcommission> {
  TextEditingController ctransactiontype = TextEditingController();
  TextEditingController ccommissiontype = TextEditingController();
  TextEditingController ccustomerincome = TextEditingController();
  TextEditingController cagentincome = TextEditingController();
  TextEditingController cbankincome = TextEditingController();
  TextEditingController cbankpartnerincome = TextEditingController();
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
                        Text('Create Commission Setup',
                            style: kTinyBoldTextStyle),
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
                          Text("Transaction Type :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveCommission.SetTransactionType(value);
                                });
                              },
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                              textInputAction: TextInputAction.go,
                              controller: ctransactiontype,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Commission Type :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveCommission.SetCommisionType(value);
                                });
                              },
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                              textInputAction: TextInputAction.go,
                              controller: ccommissiontype,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Customer Income :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveCommission.SetCustomerIncome(value);
                                });
                              },
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                              textInputAction: TextInputAction.go,
                              controller: ccustomerincome,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Agent Income :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveCommission.SetAgentIncome(value);
                                });
                              },
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                              textInputAction: TextInputAction.go,
                              controller: cagentincome,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Bank Income :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveCommission.SetBankIncome(value);
                                });
                              },
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                              textInputAction: TextInputAction.go,
                              controller: cbankincome,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Bank Partner Income :",
                              style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveCommission.SetBankPartnerIncome(value);
                                });
                              },
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                              textInputAction: TextInputAction.go,
                              controller: cbankpartnerincome,
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
