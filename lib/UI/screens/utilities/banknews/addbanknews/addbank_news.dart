import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:web_date_picker/web_date_picker.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/textfield.dart';

class Addbanknews extends StatefulWidget {
  const Addbanknews({Key? key}) : super(key: key);

  @override
  State<Addbanknews> createState() => _AddbanknewsState();
}

class _AddbanknewsState extends State<Addbanknews> {
  bool value = false;
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
                        const Icon(Icons.lan_outlined, color: kBlackColor),
                        Text('Bank News', style: kTinyBoldTextStyle),
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  width: 450.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Topic :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
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
                          verticalSpaceTiny,
                          Text("Period :", style: kHeading2TextStyle),
                          Row(
                            children: [
                              WebDatePicker(
                                width: 150.0,
                                hinttext: "Start Period",
                                onChange: (value) {},
                              ),
                              horizontalSpaceLarges,
                              WebDatePicker(
                                width: 150.0,
                                hinttext: "End Period",
                                onChange: (value) {},
                              ),
                            ],
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
                        children: [
                          const Icon(Icons.lan_outlined, color: kBlackColor),
                          Text('Role - Menus', style: kTinyBoldTextStyle),
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
                    child: Padding(
                      padding: kEdgeInsetsAllNormal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            backgroundColor: kTertiaryColor5,
                            collapsedBackgroundColor: kTertiaryColor5,
                            title: Row(
                              children: [
                                Text("Dashboard", style: kHeading2TextStyle),
                                const SizedBox(width: 100.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: const BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Administration",
                                    style: kHeading2TextStyle),
                                const SizedBox(width: 70.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Enrollment", style: kHeading2TextStyle),
                                const SizedBox(width: 103.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Monitoring", style: kHeading2TextStyle),
                                const SizedBox(width: 103.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Utilities", style: kHeading2TextStyle),
                                const SizedBox(width: 132.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Customer Service",
                                    style: kHeading2TextStyle),
                                const SizedBox(width: 48.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Report", style: kHeading2TextStyle),
                                const SizedBox(width: 137.0),
                                Checkbox(
                                  checkColor: kWhiteColor,
                                  side: BorderSide(color: kBlackColor),
                                  activeColor: KLightGreenColor,
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("VIEW", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            leading: Icon(Icons.add_box),
                            iconColor: kDarkGreenColor,
                            collapsedIconColor: kBlackColor,
                            title: Row(
                              children: [
                                Text("Scheduler", style: kHeading2TextStyle),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Register Client',
                                        style: kHeading2TextStyle),
                                    horizontalSpaceLarge,
                                    Checkbox(
                                      checkColor: kWhiteColor,
                                      side: BorderSide(color: kBlackColor),
                                      activeColor: KLightGreenColor,
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                    Text("VIEW", style: kHeading2TextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
