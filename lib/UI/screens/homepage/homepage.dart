import 'package:flutter/material.dart';
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
  String title1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        if (Responsive.isDesktop(context))
          Container(
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
                      title: "dashboard",
                      child: [
                        Listtile(
                          color: Colors.black,
                          title: "rerer",
                          onTap: () {
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
        Column(
          children: [
            Contains(
              child: [Text(title1)],
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
