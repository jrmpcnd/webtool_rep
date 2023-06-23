import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/monitoring/transactionforconfirmation/getter_setter.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/date_picker.dart';
import 'package:webtool_rep/UI/widgets/elevatedbutton_get_insti.dart';
import 'package:webtool_rep/UI/widgets/elevatedbuttonpopup_get_center.dart';
import 'package:webtool_rep/UI/widgets/elevatedbuttonpopup_get_unit.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Listofagent extends StatefulWidget {
  const Listofagent({Key? key}) : super(key: key);

  @override
  State<Listofagent> createState() => _ListofagentState();
}

class _ListofagentState extends State<Listofagent> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Prov8>(context, listen: false);
    shared.list_agent.clear();
    ListAgentParse httpParse = ListAgentParse();
    var res = await httpParse.profile8();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.list_agent.add(List_Agent.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.list_agent_data.add(Data8.fromJson(i.toJson()));
      }
    }
    for (var i in shared.list_agent_data) {
      print(i.toJson());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov8>(context);
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
                  height: 300.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  DatePickerScreen( startDateController: startDate,
                                      endDateController: endDate),
                                ],
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                hintText: 'CID',
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
                            ),
                          ),
                          verticalSpaceTiny,
                          elevatedbuttonpopupInsti(
                              label: "Insti", width: 400.0),
                          verticalSpaceTiny,
                          elevatedbuttonpopup(label: "branch", width: 400.0),
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
                                    try {
                                      if (controller.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.list_agent_data.clear();
                                        for (var i
                                        in shared.list_agent[0].data!) {
                                          // print(i.toJson());
                                          // print(i.userLogin?.toLowerCase().contains(
                                          //     controller4.text.toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.cCid!.toLowerCase().contains(
                                                controller.text
                                                    .toLowerCase()) &&
                                                i.cMobileNo!
                                                    .toLowerCase()
                                                    .contains(controller1.text
                                                    .toLowerCase())) {
                                              debugPrint(i.cMobileNo);
                                              setState(() {
                                                shared.list_agent_data.add(
                                                    Data8.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .list_agent_data.isNotEmpty) {
                                                Future.delayed(
                                                  Duration(seconds: 1),
                                                      () {
                                                    setState(() {
                                                      isLoaded = true;
                                                    });
                                                  },
                                                );
                                              }
                                            }
                                          }
                                        }
                                      }
                                      if (controller1.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.list_agent_data.clear();
                                        for (var i
                                        in shared.list_agent[0].data!) {
                                          // print(i.toJson());
                                          // print(i.userLogin?.toLowerCase().contains(
                                          //     controller4.text.toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.cMobileNo!
                                                .toLowerCase()
                                                .contains(controller1.text
                                                .toLowerCase()) &&
                                                i.cCid!.toLowerCase().contains(
                                                    controller.text
                                                        .toLowerCase())) {
                                              debugPrint(i.cMobileNo);
                                              setState(() {
                                                shared.list_agent_data.add(
                                                    Data8.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .list_agent_data.isNotEmpty) {
                                                Future.delayed(
                                                  Duration(seconds: 1),
                                                      () {
                                                    setState(() {
                                                      isLoaded = true;
                                                    });
                                                  },
                                                );
                                              }
                                            }
                                          }
                                        }
                                      }
                                      // final enteredDate = DateTime.parse(
                                      //     GetDate.getStartDate());
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      shared.list_agent_data.clear();
                                      print(GetDate.getStartDate2());
                                      final transactionDate = DateTime.parse(
                                          GetDate.getStartDate2());
                                      print(transactionDate);
                                      for (var i
                                      in shared.list_agent[0].data!) {
                                        if (i.toJson().isNotEmpty) {
                                          if (i.cDateAndTime != '') {
                                            final transactionsDate = DateTime
                                                .parse(
                                                i.cDateAndTime.toString()
                                                    .replaceAll('T', ' ')
                                                    .replaceAll('Z', ''));
                                            print(transactionsDate);
                                            if (transactionDate.year ==
                                                transactionsDate.year &&
                                                transactionDate.month ==
                                                    transactionsDate.month &&
                                                transactionDate.day ==
                                                    transactionsDate.day) {
                                              setState(() {
                                                shared.list_agent_data.add(
                                                    Data8.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .list_agent_data.isNotEmpty) {
                                                Future.delayed(
                                                    Duration(seconds: 1), () {
                                                  setState(() {
                                                    isLoaded = true;
                                                  });
                                                });
                                              }
                                            }
                                          }
                                        }
                                      }
                                      debugPrint(shared.list_agent_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      print(e.toString());
                                      print(shared.list_agent_data.length);
                                      shared.list_agent_data.clear();
                                      isLoaded = true;
                                    }
                                    print(shared.list_agent_data);
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
                                  onPressed: () {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    controller.clear();
                                    controller1.clear();
                                    controller2.clear();
                                    controller3.clear();
                                    shared.list_agent_data.clear();
                                    setState(() {
                                      shared.list_agent_data
                                          .addAll(shared.list_agent[0].data!);
                                      Future.delayed(
                                        Duration(seconds: 1),
                                            () {
                                          setState(() {
                                            isLoaded = true;
                                          });
                                        },
                                      );
                                    });
                                  },
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
                              SizedBox(
                                height: 35.0,
                                width: 400,
                                child: TextFormField(
                                  style: kTextStyle,
                                  decoration: const InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(fontSize: 12.0),
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    hintStyle:
                                    TextStyle(color: kSecondaryColor2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: kBlackColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: kBlackColor),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.go,
                                  controller: controller1,
                                ),
                              ),
                              verticalSpaceTiny,
                             elevatedbuttonpopupunit(label: "Center",width: 400.0),
                              verticalSpaceTiny,
                              elevatedbuttonpopupcenter(label: "Unit", width: 400.0),
                              verticalSpaceMedium,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Container(
                        width: double.infinity,
                        padding: kEdgeInsetsVerticalNormal,
                        child: PaginatedDataTable(
                          key: key,
                          arrowHeadColor: kWhiteColor,
                          columns: [
                            DataColumn(
                                label: Text('Date & Time Enable Agent Feature',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Enable By',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('CID', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Full Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Mobile No',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Institution',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                Text('Branch', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                Text('Unit', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                Text('Center', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.list_agent_data.isNotEmpty
                              ? data
                              : data2
                              : data3,
                          rowsPerPage: 8,
                          showFirstLastButtons: true,
                          header:
                          Text('List of Role', style: kXLargeBoldTextStyle),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov8 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.list_agent_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.list_agent_data[index].cDateAndTime.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].iUserName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cCid.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cFullname.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cMobileNo.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].aInstDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cBranchDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cUnitDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cCenterDesc.toString())))
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
      DataCell(SizedBox(child: Text('Loading Please wait!'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
    ]);
  }
}
