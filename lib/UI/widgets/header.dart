import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import '../utils/constant.dart';
import '../utils/edge_insect.dart';
import '../utils/responsive.dart';
import '../utils/spacing.dart';
import '../utils/text_styles.dart';

class Header extends StatefulWidget {
  String? title = "";
  Header({Key? key, this.title}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    bool tappedYes = false;
    final height = MediaQuery.of(context).size.height * 0.40;
    return Column(
      children: [
        Row(
          children: [
            if (!Responsive.isDesktop(context)) horizontalSpaceTiny,
            // IconButton(
            //   icon: const Icon(
            //     Icons.menu,
            //     color: kBlackColor,
            //   ),
            //   onPressed: viewModel.controlMenu,
            // ),
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
                  "Dashboard",
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
                        leading: Icon(Icons.lock_outline),
                        title: Text('Change Password'),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.logout_outlined),
                        title: const Text('Logout'),
                        onTap: () async {
                          final action = await AlertDialogs.yesCancelDialog(
                            context,
                            'Logout?',
                            'Are you sure you want to Logout?',
                          );
                          if (action == DialogsAction.yes) {
                            setState(() => tappedYes = true);
                          } else {
                            setState(() => tappedYes = false);
                          }
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

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
              child: Text(
                'Cancel',
                style: kHeading2TextStyle.copyWith(
                  color: kWhiteColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ),
              ),
              child: Text(
                'Logout',
                style: kHeading2TextStyle.copyWith(
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogsAction.cancel;
  }
}
