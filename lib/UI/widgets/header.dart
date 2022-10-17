import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/widgets/uploadbutton.dart';
import '../utils/constant.dart';
import '../utils/edge_insect.dart';
import '../utils/responsive.dart';
import '../utils/spacing.dart';
import '../utils/text_styles.dart';
import 'addbutton.dart';

class Header extends StatefulWidget {
  IconData? icon;
  IconData? addicon;
  String? title = "";
  String? header = "";
  String? addbutton = "";
  String? subaddbutton = "";
  String? uploadbutton = "";
  String? subuploadbutton = "";
  VoidCallback? onPress;
  Header({
    Key? key,
    this.icon,
    this.title,
    this.header,
    this.addicon,
    this.addbutton,
    this.subaddbutton,
    this.uploadbutton,
    this.subuploadbutton,
    this.onPress,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.50;
    return Column(
      children: [
        Row(
          children: [
            if (!Responsive.isDesktop(context)) horizontalSpaceTiny,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                const SizedBox(width: 5),
                Text(
                  '>',
                  style: kHeading3TextStyle,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.header!,
                  style: kHeading3TextStyle,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 50.0,
              width: 50.0,
              child: InkWell(
                onTap: () {},
                child: PopupMenuButton(
                  tooltip: 'Profile Menu',
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/admin.png'),
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.lock),
                        title: Text('Change Password'),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                        // onTap: () {
                        //   AlertDialog alert = const AlertDialog(
                        //     title: Text('Are you sure you want to Logout?'),
                        //   );
                        //   showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return alert;
                        //     },
                        //   );
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            verticalSpaceSmall,
            Container(
              padding: kEdgeInsetsHorizontalNormal,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBlackColor,
              ),
              height: height * 0.20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            widget.icon!,
                            size: 28.0,
                          ),
                          horizontalSpaceSmall,
                          Text(
                            widget.title!,
                            style: kHeading1TextStyle.copyWith(
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      widget.uploadbutton! != "" ||
                              widget.subuploadbutton! != ""
                          ? Uploadbutton(
                              uploadbutton: widget.uploadbutton,
                              subuploadbutton: widget.subuploadbutton,
                            )
                          : Container(),
                      horizontalSpaceSmall,
                      widget.addbutton! != "" ||
                              widget.subaddbutton! != "" ||
                              widget.onPress != null ||
                              widget.addicon != null
                          ? Addbutton(
                              subaddbutton: widget.subaddbutton,
                              addbutton: widget.addbutton,
                              onPress: widget.onPress,
                              addicon: widget.addicon,
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
