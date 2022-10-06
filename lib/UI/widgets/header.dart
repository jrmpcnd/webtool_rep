import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/edge_insect.dart';
import '../utils/responsive.dart';
import '../utils/spacing.dart';
import '../utils/text_styles.dart';

class Header extends StatefulWidget {
  String? title = "";
  String? header = "";
  Header({Key? key, this.title, this.header}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.40;
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
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        onTap: () {
                          AlertDialog alert = const AlertDialog(
                            title: Text('Are you sure you want to Logout?'),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
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
            ),
          ],
        ),
      ],
    );
  }
}
