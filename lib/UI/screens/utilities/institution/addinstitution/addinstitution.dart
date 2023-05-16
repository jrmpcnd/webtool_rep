import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/core/getter_setter.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addinstitution extends StatefulWidget {
  const Addinstitution({Key? key}) : super(key: key);

  @override
  State<Addinstitution> createState() => _AddinstitutionState();
}

class _AddinstitutionState extends State<Addinstitution> {
  TextEditingController cinsticode = TextEditingController();
  TextEditingController cinstidesc = TextEditingController();
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
                        Text('Create/Edit Institution',
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
                          Text("Institution Code :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveInsti.SetInsticode(value);
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
                              controller: cinsticode,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Description :", style: kHeading2TextStyle),
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  SaveInsti.SetInstidesc(value);
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
                              controller: cinstidesc,
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
