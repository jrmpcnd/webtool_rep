import 'package:flutter/material.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Rolemanagement extends StatefulWidget {
  const Rolemanagement({Key? key}) : super(key: key);

  @override
  State<Rolemanagement> createState() => _RolemanagementState();
}

class _RolemanagementState extends State<Rolemanagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: kEdgeInsetsAllNormal,
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
                  height: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textfield(
                            hintext: "Role Name",
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: [
                              SizedBox(
                                width: 100.0,
                                height: 35.0,
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Search',
                                    style: kSmallRegularTextStyle,
                                  ),
                                ),
                              ),
                              horizontalSpaceTiny,
                              SizedBox(
                                width: 100.0,
                                height: 35.0,
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kSecondaryColor2)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.refresh,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Reset',
                                    style: kSmallRegularTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
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
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_month, color: kBlackColor),
                        Text('List of Roles', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
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
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Table(
                    children: [
                      TableRow(children: [
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('User Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Given Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Middle Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Last Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Branch', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Role', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Status', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Action', style: kSmallBoldTextStyle),
                          ]),
                        ),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            'Sample 1',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Samplel',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            'Sample 2',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      ]),
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
