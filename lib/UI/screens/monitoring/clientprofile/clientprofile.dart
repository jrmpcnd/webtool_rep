import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/cardprovider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../widgets/textfield.dart';

class Clientprofile extends StatefulWidget {
  const Clientprofile({Key? key}) : super(key: key);

  @override
  State<Clientprofile> createState() => _ClientprofileState();
}

class _ClientprofileState extends State<Clientprofile> {
  TextEditingController clientnameController = TextEditingController();
  var vis = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;

  void toggleSwitch1(bool value) {
    if (isSwitched1 == false) {
      setState(() {
        isSwitched1 = true;
      });
    } else {
      setState(() {
        isSwitched1 = false;
      });
    }
  }

  void toggleSwitch2(bool value) {
    if (isSwitched2 == false) {
      setState(() {
        isSwitched2 = true;
      });
    } else {
      setState(() {
        isSwitched2 = false;
      });
    }
  }

  void toggleSwitch3(bool value) {
    if (isSwitched3 == false) {
      setState(() {
        isSwitched3 = true;
      });
    } else {
      setState(() {
        isSwitched3 = false;
      });
    }
  }

  void toggleSwitch4(bool value) {
    if (isSwitched4 == false) {
      setState(() {
        isSwitched4 = true;
      });
    } else {
      setState(() {
        isSwitched4 = false;
      });
    }
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  height: 250.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textfield(
                            hintext: "Customer I.D.",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            controller: clientnameController,
                            hintext: "User Name",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Mobile No.",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Full Name",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Birthday",
                          ),
                        ],
                      ),
                      horizontalSpaceLarges,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 35.0,
                                width: 300.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeColor1),
                                  child: const Text('Devices'),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                              ),
                              verticalSpaceTiny,
                              SizedBox(
                                height: 35.0,
                                width: 300.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeColor1),
                                  child: const Text('Reset Password'),
                                  onPressed: () {
                                    var clientname = Provider.of<Cardprovider>(
                                        context,
                                        listen: false);
                                    if (clientnameController.text ==
                                        clientname.clientname.toString()) {
                                      setState(() {
                                        print('debug');
                                        vis = !vis;
                                        print(vis);
                                      });
                                    }
                                  },
                                ),
                              ),
                              verticalSpaceTiny,
                              SizedBox(
                                height: 35.0,
                                width: 300.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeColor1),
                                  child: const Text('Change Mobile Number'),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                              ),
                              verticalSpaceTiny,
                              SizedBox(
                                height: 35.0,
                                width: 300.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kTertiaryColor),
                                  child: const Text('Unrestricted'),
                                  onPressed: () {
                                    setState(() {});
                                  },
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
                Visibility(
                  visible: vis,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [KLightGreenColor, kDarkGreenColor]),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
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
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'CARD INC . |',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          const Text(
                            'AGENT:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Transform.scale(
                            scale: 1,
                            child: Switch(
                              onChanged: toggleSwitch1,
                              value: isSwitched1,
                              activeColor: Colors.green,
                              activeTrackColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red,
                            ),
                          ),
                          SizedBox(width: 200),
                          const Text(
                            'ENABLE:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Transform.scale(
                            scale: 1,
                            child: Switch(
                              onChanged: toggleSwitch2,
                              value: isSwitched2,
                              activeColor: Colors.green,
                              activeTrackColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red,
                            ),
                          ),
                          SizedBox(width: 200),
                          const Text(
                            'MERCHANT:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Transform.scale(
                            scale: 1,
                            child: Switch(
                              onChanged: toggleSwitch3,
                              value: isSwitched3,
                              activeColor: Colors.green,
                              activeTrackColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmallest,
                Visibility(
                  visible: vis,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [KLightGreenColor, kDarkGreenColor]),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    width: 500.0,
                    height: 220.0,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'MICROSAVINGS ACCOUNT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Text(
                            '1012-0000-31200565',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.white,
                          ),
                          Row(
                            children: const [
                              Text(
                                'BRANCH: Laguna 2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                              horizontalSpaceSmallest,
                              Text(
                                'UNIT: undefined',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                              horizontalSpaceSmallest,
                              Text(
                                'CENTER: undefined',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Row(
                            children: const [
                              Text(
                                'TYPE: 1872',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                              SizedBox(width: 50),
                              Text(
                                'CLASSIFICATION: 1884',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'ENABLE:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              verticalSpaceTiny,
                              Transform.scale(
                                scale: 1,
                                child: Switch(
                                  onChanged: toggleSwitch4,
                                  value: isSwitched4,
                                  activeColor: Colors.green,
                                  activeTrackColor: Colors.green,
                                  inactiveThumbColor: Colors.red,
                                  inactiveTrackColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
