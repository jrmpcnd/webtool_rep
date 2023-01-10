import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/functions.dart';
import 'package:webtool_rep/UI/widgets/dropdown.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/tables.dart';
import '../../../widgets/textfield.dart';

class Usermanagement extends StatefulWidget {
  const Usermanagement({Key? key}) : super(key: key);

  @override
  State<Usermanagement> createState() => _UsermanagementState();
}

class _UsermanagementState extends State<Usermanagement> {
  TextEditingController branchname_controller = TextEditingController();
  TextEditingController fname_controller = TextEditingController();
  TextEditingController lname_controller = TextEditingController();
  TextEditingController mname_controller = TextEditingController();
  TextEditingController stat_controller = TextEditingController();
  TextEditingController uname_controller = TextEditingController();

  @override
  void initState() {
    Usermanagement_Function.user(user_login: '');
    super.initState();
  }

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
                  height: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textfield(
                            hintext: "First Name",
                            controller: fname_controller,
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Middle Name",
                            controller: mname_controller,
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Last Name",
                            controller: lname_controller,
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
                                  onPressed: () {
                                    Usermanagement_Function.user(
                                        fname: fname_controller.text,
                                        mname: mname_controller.text,
                                        lname: lname_controller.text,
                                        user_login: uname_controller.text);
                                  },
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
                      horizontalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textfield(
                                hintext: "User Name",
                                controller: uname_controller,
                              ),
                              verticalSpaceTiny,
                              elevatedbuttonpopup(
                                  label: "Branch", width: 400.0),
                              verticalSpaceTiny,
                              dropdowns(
                                dropdown: "--User Status--",
                                items: [
                                  DropdownMenuItem(
                                      onTap: () {},
                                      value: "",
                                      child: Text("--Select Status--")),
                                  DropdownMenuItem(
                                      onTap: () {},
                                      value: "Active",
                                      child: Text("Active")),
                                  DropdownMenuItem(
                                      onTap: () {},
                                      value: "Inactive",
                                      child: Text("Inactive")),
                                  DropdownMenuItem(
                                      onTap: () {},
                                      value: "Lock",
                                      child: Text("Lock")),
                                ],
                              ),
                              verticalSpaceMedium,
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
                        Text('List of Users', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                const Tables(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
