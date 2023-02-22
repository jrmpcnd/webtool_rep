import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import '../../../utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/textfield.dart';

class Agentdashboard extends StatefulWidget {
  const Agentdashboard({Key? key}) : super(key: key);

  @override
  State<Agentdashboard> createState() => _AgentdashboardState();
}

class _AgentdashboardState extends State<Agentdashboard> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared6 = Provider.of<Prov6>(context, listen: false);
    shared6.agent.clear();
    AgentParse httpParse = AgentParse();
    var res6 = await httpParse.profile6();
    if (res6.data!.isNotEmpty) {
      print(res6.data!.length);
      print(res6.data![0].toJson().length);
      setState(() {
        shared6.agent.add(Agent_Dashboard.fromJson(res6.toJson()));
        isLoaded = true;
      });
      for (var i in res6.data!) {
        shared6.agent_data.add(Data6.fromJson(i.toJson()));
      }
    }
    for (var i in shared6.agent_data) {
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
    final shared = Provider.of<Prov6>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Column(
        children: [
          Container(
            width: 500,
            child: TextFormField(
              style: TextStyle(color: kBlackColor),
              decoration: const InputDecoration(
                hintText: 'Search',
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
                    shared.agent_data.clear();
                    for (var i in shared.agent[0].data!) {
                      print(i.toJson());
                      print(i.branchDesc
                          ?.toLowerCase()
                          .contains(controller.text.toLowerCase()));
                      if (i.toJson().isNotEmpty) {
                        if (i.branchDesc!
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                            i.cashIn!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())   ||
                            i.cashOut!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())    ||
                            i.agentAssistedPayment!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())  ||
                            i.billPayment!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())  ||
                            i.total!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())  ||
                            i.totalIncome!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())





                        ) {
                          debugPrint(i.branchDesc);
                          setState(() {
                            shared.agent_data.add(Data6.fromJson(i.toJson()
                            ));
                          });
                          if (shared.agent_data.isNotEmpty) {
                            setState(() {
                              isLoaded = true;
                            });
                          }
                        }
                      }
                    }
                  } else if (controller.text == '') {
                    shared.agent_data.clear();
                    setState(() {
                      shared.agent_data.addAll(shared.agent[0].data!);
                      isLoaded = true;
                    });
                  }
                  debugPrint(shared.agent_data[0].toJson().toString());
                } catch (e) {
                  shared.agent_data.clear();
                  isLoaded = true;
                }
              },
              onEditingComplete: () async {
                setState(() {
                  isLoaded = false;
                });
                try {
                  if (controller.text.isNotEmpty) {
                    shared.agent_data.clear();
                    for (var i in shared.agent[0].data!) {
                      print(i.toJson());
                      print(i.branchDesc
                          ?.toLowerCase()
                          .contains(controller.text.toLowerCase()));
                      if (i.toJson().isNotEmpty) {
                        if (i.branchDesc!
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                            i.cashIn!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())   ||
                            i.cashOut!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())    ||
                            i.agentAssistedPayment!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())  ||
                            i.billPayment!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())  ||
                            i.total!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())  ||
                            i.totalIncome!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())




                        ) {
                          debugPrint (i.branchDesc);
                          setState(() {
                            key.currentState?.pageTo(0);
                            shared.agent_data.add(Data6.fromJson(i.toJson()
                            ));

                          });
                          if (shared.agent_data.isNotEmpty) {
                            setState(() {
                              isLoaded = true;
                            });
                          }
                        }
                      }
                    }
                  } else if (controller.text == '') {
                    shared.agent_data.clear();
                    setState(() {
                      shared.agent_data.addAll(shared.agent[0].data!);
                    });
                  }
                  debugPrint(shared.agent_data[0].toJson().toString());
                } catch (e) {
                  shared.agent.clear();
                }
              },
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: 500,
          //       child: TextFormField(
          //         style: TextStyle(color: kBlackColor),
          //         decoration: const InputDecoration(
          //           hintText: 'Search',
          //           border: OutlineInputBorder(),
          //           labelStyle: TextStyle(fontSize: 12.0),
          //           contentPadding: EdgeInsets.only(left: 10.0),
          //           hintStyle: TextStyle(color: kSecondaryColor2),
          //           enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: kBlackColor),
          //           ),
          //           focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: kBlackColor),
          //           ),
          //         ),
          //         textInputAction: TextInputAction.go,
          //         controller: controller,
          //         onChanged: (value) {
          //           setState(() {
          //             isLoaded = false;
          //           });
          //           //
          //           try {
          //             if (controller.text.isNotEmpty) {
          //               shared.role_data.clear();
          //               for (var i in shared.role[0].data!) {
          //                 print(i.toJson());
          //                 print(i.role_name
          //                     ?.toLowerCase()
          //                     .contains(controller.text.toLowerCase()));
          //                 if (i.toJson().isNotEmpty) {
          //                   if (i.role_name!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase()) ||
          //                       i.role_desc!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase())) {
          //                     debugPrint(i.role_name);
          //                     setState(() {
          //                       shared.role_data.add(Data(
          //                           role_name: i.role_name,
          //                           role_desc: i.role_desc,
          //                           role_id: i.role_id));
          //                     });
          //                     if (shared.role_data.isNotEmpty) {
          //                       setState(() {
          //                         isLoaded = true;
          //                       });
          //                     }
          //                   }
          //                 }
          //               }
          //             } else if (controller.text == '') {
          //               shared.role_data.clear();
          //               setState(() {
          //                 shared.role_data.addAll(shared.role[0].data!);
          //                 isLoaded = true;
          //               });
          //             }
          //             debugPrint(shared.role_data[0].toJson().toString());
          //           } catch (e) {
          //             shared.role_data.clear();
          //             isLoaded = true;
          //           }
          //         },
          //         onEditingComplete: () async {
          //           setState(() {
          //             isLoaded = false;
          //           });
          //           try {
          //             if (controller.text.isNotEmpty) {
          //               shared.role_data.clear();
          //               for (var i in shared.role[0].data!) {
          //                 print(i.toJson());
          //                 print(i.role_name
          //                     ?.toLowerCase()
          //                     .contains(controller.text.toLowerCase()));
          //                 if (i.toJson().isNotEmpty) {
          //                   if (i.role_name!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase()) ||
          //                       i.role_desc!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase())) {
          //                     debugPrint(i.role_name);
          //                     setState(() {
          //                       key.currentState?.pageTo(0);
          //                       shared.role_data.add(Data(
          //                           role_name: i.role_name,
          //                           role_desc: i.role_desc,
          //                           role_id: i.role_id));
          //                     });
          //                     if (shared.role_data.isNotEmpty) {
          //                       setState(() {
          //                         isLoaded = true;
          //                       });
          //                     }
          //                   }
          //                 }
          //               }
          //             } else if (controller.text == '') {
          //               shared.role_data.clear();
          //               setState(() {
          //                 shared.role_data.addAll(shared.role[0].data!);
          //               });
          //             }
          //             debugPrint(shared.role_data[0].toJson().toString());
          //           } catch (e) {
          //             shared.role_data.clear();
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          Container(
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: PaginatedDataTable(
                key: key,
                arrowHeadColor: kWhiteColor,
                columns: [
                  DataColumn(label: Text('Branch', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Cash In', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Cash Out', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Agent Assisted Payment',
                          style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Bills Payment', style: kLargeBoldTextStyle)),
                  DataColumn(label: Text('Total', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Total Income', style: kLargeBoldTextStyle))
                ],
                source: isLoaded
                    ? shared.agent_data.isNotEmpty
                        ? data
                        : data2
                    : data3,
                rowsPerPage: 8,
                showFirstLastButtons: true,
                header: Text('List of Branch', style: kXLargeBoldTextStyle),
              )),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => a.role_name
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(b.role_name.toString().toLowerCase()));
          //     },
          //     child: const Text('Role name ascending'),
          //   ),
          // ),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => b.role_name
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(a.role_name.toString().toLowerCase()));
          //       //print(shared.inqq.sort());
          //     },
          //     child: const Text('Role name descending'),
          //   ),
          // ),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => a.role_desc
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(b.role_desc.toString().toLowerCase()));
          //     },
          //     child: const Text('Role desc ascending'),
          //   ),
          // ),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => b.role_desc
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(a.role_desc.toString().toLowerCase()));
          //     },
          //     child: const Text('Role desc descending'),
          //   ),
          // )
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov6 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.agent_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.agent_data[index].branchDesc.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.agent_data[index].cashIn.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.agent_data[index].cashOut.toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
              Text(shared.agent_data[index].agentAssistedPayment.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.agent_data[index].billPayment.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.agent_data[index].total.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.agent_data[index].totalIncome.toString())))
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
      DataCell(SizedBox(child: Text('')))
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
    ]);
  }
}
