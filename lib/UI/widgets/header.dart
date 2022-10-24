import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:webtool_rep/UI/screens/login/login_screen.dart';
import 'package:webtool_rep/UI/widgets/searchlist.dart';
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
  VoidCallback? onTaps;
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
    this.onTaps,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String? userSelected;
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
            SizedBox(
                height: 40.0,
                width: 300.0,
                child: TypeAheadField(
                  noItemsFoundBuilder: (context) => const SizedBox(
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'No Item Found',
                        style: TextStyle(color: kBlackColor),
                      ),
                    ),
                  ),
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                      color: Colors.white,
                      elevation: 4.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  debounceDuration: const Duration(milliseconds: 400),
                  textFieldConfiguration: TextFieldConfiguration(
                    style: const TextStyle(color: kBlackColor),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        15.0,
                      )),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: kBlackColor)),
                      hintText: userSelected ?? "Search...",
                      contentPadding: const EdgeInsets.only(top: 4, left: 10),
                      hintStyle:
                          const TextStyle(color: kBlackColor, fontSize: 14),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: kBlackColor),
                      ),
                    ),
                  ),
                  suggestionsCallback: (value) {
                    return StateService.getSuggestions(value);
                  },
                  itemBuilder: (context, String suggestion) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.search_outlined,
                          color: kBlackColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              style: const TextStyle(color: kBlackColor),
                              suggestion,
                              maxLines: 1,
                              // style: TextStyle(color: Colors.red),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    setState(() {
                      userSelected = suggestion;
                    });
                  },
                )),
            horizontalSpaceRegular,
            SizedBox(
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
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Change Password'),
                        onTap: widget.onTaps,
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
                            ),
                          );
                        },
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
