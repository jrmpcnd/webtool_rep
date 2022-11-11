import 'package:flutter/material.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';

class Remittancedashboard extends StatefulWidget {
  const Remittancedashboard({Key? key}) : super(key: key);

  @override
  State<Remittancedashboard> createState() => _RemittancedashboardState();
}

class _RemittancedashboardState extends State<Remittancedashboard> {
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
                  height: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 190.0,
                            width: 180.0,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kOrangeColor1,
                                alignment: Alignment.center,
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "PENDING",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kWhiteColor),
                                  ),
                                  const Icon(Icons.remove_circle_outline,
                                      color: kWhiteColor, size: 30.0),
                                  Text("45",
                                      style: kBodyTextStyleDashboardLarge
                                          .copyWith(color: kWhiteColor)),
                                  verticalSpaceTiny,
                                  Text(
                                    "DETAILS",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kWhiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
                          SizedBox(
                            height: 190.0,
                            width: 180.0,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kTertiaryColor4,
                                alignment: Alignment.center,
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "SENT",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: KLightGreenColor),
                                  ),
                                  const Icon(Icons.send_outlined,
                                      size: 30.0, color: KLightGreenColor),
                                  Text(
                                    "152",
                                    style: kBodyTextStyleDashboardLarge
                                        .copyWith(color: KLightGreenColor),
                                  ),
                                  verticalSpaceTiny,
                                  Text(
                                    "DETAILS",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: KLightGreenColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
                          SizedBox(
                            height: 190.0,
                            width: 180.0,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kTertiaryColor4,
                                alignment: Alignment.center,
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "CLAIMED",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kTertiaryColor),
                                  ),
                                  const Icon(
                                    Icons.inbox_outlined,
                                    size: 30.0,
                                    color: kTertiaryColor,
                                  ),
                                  Text(
                                    "59",
                                    style: kBodyTextStyleDashboardLarge
                                        .copyWith(color: kTertiaryColor),
                                  ),
                                  verticalSpaceTiny,
                                  Text(
                                    "DETAILS",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kTertiaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
                          SizedBox(
                            height: 190.0,
                            width: 180.0,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kTertiaryColor4,
                                alignment: Alignment.center,
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "CANCELLED",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kPrimaryColor),
                                  ),
                                  const Icon(Icons.cancel_outlined,
                                      size: 30.0, color: kPrimaryColor),
                                  Text(
                                    "48",
                                    style: kBodyTextStyleDashboardLarge
                                        .copyWith(color: kPrimaryColor),
                                  ),
                                  verticalSpaceTiny,
                                  Text(
                                    "DETAILS",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kPrimaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
                          SizedBox(
                            height: 190.0,
                            width: 180.0,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kTertiaryColor4,
                                alignment: Alignment.center,
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "TOTAL",
                                    style: kBodyTextStyleDashboard.copyWith(
                                        color: kDarkGreenColor),
                                  ),
                                  Text("259",
                                      style: kBodyTextStyleDashboardLarge
                                          .copyWith(color: kDarkGreenColor)),
                                ],
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
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
