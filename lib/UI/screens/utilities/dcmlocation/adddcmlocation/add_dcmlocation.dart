import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webtool_rep/core/getter_setter.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Adddcmlocation extends StatefulWidget {
  const Adddcmlocation({Key? key}) : super(key: key);

  @override
  State<Adddcmlocation> createState() => _AdddcmlocationState();
}

class _AdddcmlocationState extends State<Adddcmlocation> {
  TextEditingController dcmd = TextEditingController();
  TextEditingController dcmstreet = TextEditingController();
  TextEditingController dcmprovince = TextEditingController();
  TextEditingController dcmlongitude = TextEditingController();
  TextEditingController dcmlatitude = TextEditingController();

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
                        const Icon(Icons.location_on_outlined,
                            color: kBlackColor),
                        Text('DCM Location', style: kTinyBoldTextStyle),
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
                          Text("Description :", style: kHeading2TextStyle),
                          AutoSizeWidget(
                            initialWidth: 400,
                            initialHeight: 150,
                            maxWidth: 400,
                            maxHeight: 200,
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            showIcon: true,
                            child:  TextField(
                              controller: dcmd,
                              onChanged: (data){
                                SaveData.setdcmd(data);
                              },
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
                          verticalSpaceTiny,
                          Text("Street / Brgy :", style: kHeading2TextStyle),
                          textfield(
                            controller: dcmstreet,
                            onChange: (data){
                             SaveData.setstreet(data);
                            },
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("City / Province :", style: kHeading2TextStyle),
                          textfield(
                            controller: dcmprovince,
                            onChange: (data){
                              SaveData.setdcmprovince(data);
                            },
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Longitude :", style: kHeading2TextStyle),
                          textfield(
                            controller: dcmlongitude,
                            onChange: (data){
                              SaveData.setlongitude(data);
                            },
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Latitude :", style: kHeading2TextStyle),
                          textfield(
                            controller: dcmlatitude,
                            onChange: (data){
                              SaveData.setlatitude(data);
                            },
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
