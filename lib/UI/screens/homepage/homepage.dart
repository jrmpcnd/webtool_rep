import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/screens/registerclient/registerclient.dart';
import 'package:webtool_rep/UI/widgets/header.dart';
import '../../../UI/utils/constant.dart';
import '../../../UI/widgets/contains.dart';
import '../../../UI/widgets/listTile.dart';
import '../../../UI/widgets/sidemenu.dart';
import '../../utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> homewidget = [];
  String title = "Dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            SizedBox(
              width: 250.0,
              child: Drawer(
                  backgroundColor: kTertiaryColor5,
                  child: ListView(
                    children: [
                      DrawerHeader(
                        child: Row(
                          children: const [
                            Expanded(
                              child: Image(
                                height: 100.0,
                                width: 100.0,
                                image: AssetImage("assets/icons/kplus.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Sidemenu(
                        icon: Icons.access_time_filled_rounded,
                        title: "Dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.people,
                            title: "Register Client",
                            onTap: () {
                              setState(() {
                                title = "Register Client";
                                homewidget = [const Registerclient()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.people,
                            title: "Active Client",
                            onTap: () {
                              setState(() {
                                title = "Active Client";
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.people,
                            title: "Client Transaction",
                            onTap: () {
                              setState(() {
                                title = "Client Transaction";
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.people,
                            title: "eLoad Transaction",
                            onTap: () {
                              setState(() {
                                title = "eLoad Transaction";
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.people,
                            title: "Bank Transaction",
                            onTap: () {
                              setState(() {
                                title = "Bank Transaction";
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.confirmation_num_sharp,
                        title: "Profile",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rare",
                            onTap: () {
                              // setState(() {
                              //   title1 = "hey";
                              // });
                            },
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          ),
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          ),
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.abc_rounded,
                        title: "dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          ),
                          Listtile(
                            color: Colors.black,
                            title: "rerer",
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Header(title: title),
                  SingleChildScrollView(
                    child: Contains(
                      child: homewidget,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
