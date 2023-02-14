import 'package:flutter/material.dart';
import '../../../utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';

class Hierarchy extends StatefulWidget {
  const Hierarchy({Key? key}) : super(key: key);

  @override
  State<Hierarchy> createState() => _HierarchyState();
}

class _HierarchyState extends State<Hierarchy> {
  List<String> res = [];
  List<String> res2 = [];
  List<String> res3 = [];
  List<String> res4 = [];


  String init = '';
  String init2 = '';
  String init3 = '';
  String init4 = '';



  Hierarchy_Institution_Api dropdownInsti = Hierarchy_Institution_Api();
  Hierarchy_Unit_Api dropdownUnit = Hierarchy_Unit_Api();
  Hierarchy_Branch_Api dropdownBranch = Hierarchy_Branch_Api();
  Hierarchy_Center_Api dropdownCenter = Hierarchy_Center_Api();
  @override
  void initState() {
    getList();
    getUnit();
    getBranch();
    getCenter();
  }
  getList()async{
    List<dynamic> dlist = await dropdownInsti.getUserstatus();
    for(var i in dlist){
      setState(() {
        res.add(i['insti_desc']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  getUnit()async{
    List<dynamic> dlist = await dropdownUnit.getUserstatus();
    for(var i in dlist){
      setState(() {
        res2.add(i['unit_desc']);
      });
    }
    setState(() {
      init2 = res2[0];
    });
    print("safgsdgsdgsdfgde $res2");
  }
  getBranch()async{
    List<dynamic> dlist = await dropdownBranch.getUserstatus();
    for(var i in dlist){
      setState(() {
        res3.add(i['branch_desc']);
      });
    }
    setState(() {
      init3 = res3[0];
    });
    print("safgsdgsdgsdfgde $res3");
  }
  getCenter()async{
    List<dynamic> dlist = await dropdownCenter.getUserstatus();
    for(var i in dlist){
      setState(() {
        res4.add(i['center_desc']);
      });
    }
    setState(() {
      init4 = res4[0];
    });
    print("safgsdgsdgsdfgde $res4");
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
                  height: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton(value: init,items: res.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                            setState(() {
                              init = value.toString();
                            });
                          },),

                          verticalSpaceTiny,
                          DropdownButton(value: init2,items: res2.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                            setState(() {
                              init2 = value.toString();
                            });
                          },),

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
                                  onPressed: () {},
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              DropdownButton(value: init3,items: res3.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                                setState(() {
                                  init3 = value.toString();
                                });
                              },),

                              verticalSpaceTiny,
                              DropdownButton(value: init4,items: res4.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                                setState(() {
                                  init4 = value.toString();
                                });
                              },),

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
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20.0,
                                      ),
                                      label: Text(
                                        'Delete',
                                        style: kSmallRegularTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                        Text('List of Hierarchy', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
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
                  alignment: Alignment.center,
                  child: Table(
                    children: [
                      TableRow(children: [
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('User Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Given Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Middle Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Last Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Branch', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Role', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Status', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Action', style: kSmallBoldTextStyle),
                          ]),
                        ),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            'Sample 1',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Samplel',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            'Sample 2',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      ]),
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
