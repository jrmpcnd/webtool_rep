import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import '../../../utils/api.dart';
import '../../../utils/api2.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model2.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';


class Hierarchy extends StatefulWidget {
  const Hierarchy({Key? key}) : super(key: key);

  @override
  State<Hierarchy> createState() => _HierarchyState();
}

class _HierarchyState extends State<Hierarchy> {
  List<String> res = [];
  List<String> res2 = [];
  List<String> res5 = [];

  List<String> res4 = [];


  String init = '';
  String init2 = '';
  String init4 = '';
  String init5 = '';



  TextEditingController controller = TextEditingController();
  Hierarchy_Institution_Api dropdownInsti = Hierarchy_Institution_Api();
  Hierarchy_Unit_Api dropdownUnit = Hierarchy_Unit_Api();
  Hierarchy_Branch_Api dropdownBranch = Hierarchy_Branch_Api();
  Hierarchy_Center_Api dropdownCenter = Hierarchy_Center_Api();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<H_Prov>(context, listen: false);
    shared.Hierarchy.clear();
    HierarchyParse_Api HierarchyParse = HierarchyParse_Api();
    var res = await HierarchyParse.profile3();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      setState(() {
        shared.Hierarchy.add(Hierarchy_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.Hierarchy_data.add(H_SaveAccount.fromJson(i.toJson()));

      }
    }
    for (var i in shared.Hierarchy_data) {
      print(i.toJson());
    }
  }
  @override
  void initState() {
    wait();
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
    List<dynamic> blist = await dropdownBranch.getUserstatus()  ;
    for(var i in blist){
      setState(() {
        res5.add(i['branch_desc']);
      });
    }
    setState(() {
      init5 = res5[2];
    });
    print("safgsdgsdgsdfgde $res5");
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

  }



  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<H_Prov>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
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
                              // DropdownButton(value: init5,items: res5.map((i) {return DropdownMenuItem(value: i,child: Text(i, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                              //   setState(() {
                              //     init5 = value.toString();
                              //   });
                              // },),

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
                verticalSpaceMedium,
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ],
                  ),
                  Column(children: [ Container(
                    width: 500,
                    child: TextFormField(
                      style: TextStyle(color: kBlackColor),
                      decoration: const InputDecoration(
                        hintText: 'Institution, Unit, Branch, Center',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 12.0),
                        contentPadding: EdgeInsets.only(left: 10.0),
                        hintStyle: TextStyle(color: kSecondaryColor2),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kBlackColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kBlackColor),
                        ),
                      ),
                      textInputAction: TextInputAction.go,
                      controller: controller,
                      onChanged: (value) {
                        setState(() {
                          isLoaded = false;
                        });
                        //
                        try {
                          if (controller.text.isNotEmpty) {
                            shared.Hierarchy_data.clear();
                            // debugPrint(shared.Hierarchy[0].data.toString());
                            for (var i in shared.Hierarchy[0].data!) {
                              print(i.toJson());
                              // print(i.branchCode
                              //     ?.toLowerCase()
                              //     .contains(controller.text.toLowerCase()));
                              if (i.toJson().isNotEmpty) {
                                if (i.branchDesc!
                                    .toLowerCase()
                                    .contains(controller.text.toLowerCase()) ||
                                    i.unitCode!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase())   ||
                                    i.unitDesc!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase())    ||
                                    i.centerCode!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase())  ||
                                    i.centerDesc!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase()) ||
                                i.branchCode!.toLowerCase().contains(controller.text.toLowerCase())

                                ) {
                                  print(i.toJson());
                                  //debugPrint(i.branchCode);
                                  setState(() {
                                    shared.Hierarchy_data.add(H_SaveAccount.fromJson(i.toJson()
                                    ));
                                  });
                                  if (shared.Hierarchy_data.isNotEmpty) {
                                    setState(() {
                                      isLoaded = true;
                                    });
                                  }
                                }
                              }
                            }
                          } else if (controller.text == '') {
                            shared.Hierarchy_data.clear();
                            setState(() {
                              shared.Hierarchy_data.addAll(shared.Hierarchy[0].data!);
                              isLoaded = true;
                            });
                          }
                          debugPrint(shared.Hierarchy_data[0].toJson().toString());
                        } catch (e) {
                          shared.Hierarchy_data.clear();
                          isLoaded = true;
                        }
                      },
                      onEditingComplete: () async {
                        setState(() {
                          isLoaded = false;
                        });
                        try {
                          if (controller.text.isNotEmpty) {
                            shared.Hierarchy_data.clear();
                            for (var i in shared.Hierarchy[0].data!) {

                              print(i.branchCode
                                  ?.toLowerCase()
                                  .contains(controller.text.toLowerCase()));
                              if (i.toJson().isNotEmpty) {
                                if (i.branchDesc!
                                    .toLowerCase()
                                    .contains(controller.text.toLowerCase()) ||
                                    i.unitCode!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase())   ||
                                    i.unitDesc!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase())    ||
                                    i.centerCode!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase())  ||
                                    i.centerDesc!
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase()) ||
                                    i.branchCode!.toLowerCase().contains(controller.text.toLowerCase())


                                ) {

                                  debugPrint (i.branchCode);
                                  setState(() {
                                    key.currentState?.pageTo(0);
                                    shared.Hierarchy_data.add(H_SaveAccount.fromJson(i.toJson()
                                    ));

                                  });
                                  if (shared.Hierarchy_data.isNotEmpty) {
                                    setState(() {
                                      isLoaded = true;
                                    });
                                  }
                                }
                              }
                            }
                          } else if (controller.text == '') {
                            shared.Hierarchy_data.clear();
                            setState(() {
                              shared.Hierarchy_data.addAll(shared.Hierarchy[0].data!);
                            });
                          }
                          debugPrint(shared.Hierarchy_data[0].toJson().toString());
                        } catch (e) {
                          shared.Hierarchy_data.clear();
                        }
                      },
                    ),
                  ),Container(
                    width: double.infinity,
                    padding: kEdgeInsetsVerticalNormal,
                    child: PaginatedDataTable(
                      key: key,
                      arrowHeadColor: kWhiteColor,
                      columns: [
                        DataColumn(
                            label: Text('Branch Code', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Branch Name', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Unit Code', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Unit Name', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Center Code', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Center Name', style: kLargeBoldTextStyle)),
                      ],
                      source: isLoaded ? shared.Hierarchy_data.isNotEmpty ? data : data2 : data3,
                      rowsPerPage: 8,
                      showFirstLastButtons: true,
                      header: Text('List of Role', style: kXLargeBoldTextStyle),
                    ),
                  ),],),


                ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class MyData extends DataTableSource {
  H_Prov shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Hierarchy_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100, child: Text(shared.Hierarchy_data[index].branchCode.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Hierarchy_data[index].branchDesc.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.Hierarchy_data[index].unitCode.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.Hierarchy_data[index].unitDesc.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Hierarchy_data[index].centerCode.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Hierarchy_data[index].centerDesc.toString()))),

    ]);
  }
}

class MyData2 extends DataTableSource {
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => 1;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(
          SizedBox(child: Text('No Data Found, Please Enter Valid Keyword'))),
      DataCell(SizedBox(child: Text(''))),
      DataCell(SizedBox(child: Text(''))),
      DataCell(SizedBox(child: Text(''))),
      DataCell(SizedBox(child: Text(''))),
      DataCell(SizedBox(child: Text(''))),
    ]);
  }
}

class MyData3 extends DataTableSource {
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => 1;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(
          SizedBox(child: Text('Loading, please wait'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

    ]);
  }
}