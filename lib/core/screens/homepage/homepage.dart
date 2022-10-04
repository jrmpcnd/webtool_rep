import 'package:flutter/material.dart';
import 'package:webtool_rep/core/screens/homepage/widgets/contains.dart';
import 'package:webtool_rep/core/screens/homepage/widgets/listTile.dart';
import 'package:webtool_rep/core/screens/homepage/widgets/sidemenu.dart';

import '../../utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Drawer(
            backgroundColor: kTertiaryColor5,
            child: ListView(
              children: [
                Sidemenu(
                  icon: Icons.access_time_filled_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                      onPressed: () {
                        setState(() {
                          title1 = "Hello";
                        });
                      },
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.confirmation_num_sharp,
                  title: "Profile",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rare",
                      onPressed: () {
                        setState(() {
                          title1 = "hey";
                        });
                      },
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    ),
                    Listtile(
                      title: "rerer",
                    ),
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
                Sidemenu(
                  icon: Icons.abc_rounded,
                  title: "dashboard",
                  child: [
                    Listtile(
                      title: "rerer",
                    ),
                    Listtile(
                      title: "rerer",
                    )
                  ],
                ),
              ],
            )),
        Column(
          children: [
            Contains(
              child: [],
            ),
            Contains(
              child: [],
            )
          ],
        )
      ],
    ));
  }
}
