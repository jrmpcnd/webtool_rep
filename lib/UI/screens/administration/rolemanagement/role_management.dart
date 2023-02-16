import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/constant.dart';
import 'package:webtool_rep/UI/utils/edge_insect.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import 'package:webtool_rep/UI/utils/text_styles.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';

class Rolemanagement extends StatefulWidget {
  const Rolemanagement({Key? key}) : super(key: key);

  @override
  State<Rolemanagement> createState() => _RolemanagementState();
}

class _RolemanagementState extends State<Rolemanagement> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Prov>(context, listen: false);
    shared.inqq.clear();
    HttpParse httpParse = HttpParse();
    var res = await httpParse.profile();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.inqq.add(SavedAccounts.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.inqqq.add(Data.fromJson(i.toJson()));
      }
    }
    for (var i in shared.inqqq) {
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
    final shared = Provider.of<Prov>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    try {
                      if (controller.text.isNotEmpty) {
                        shared.inqqq.clear();
                        for (var i in shared.inqq[0].data!) {
                          print(i.toJson());
                          print(i.role_name
                              ?.toLowerCase()
                              .contains(controller.text.toLowerCase()));
                          if (i.toJson().isNotEmpty) {
                            if (i.role_name!
                                    .toLowerCase()
                                    .contains(controller.text.toLowerCase()) ||
                                i.role_desc!
                                    .toLowerCase()
                                    .contains(controller.text.toLowerCase())) {
                              debugPrint(i.role_name);
                              setState(() {
                                shared.inqqq.add(Data(
                                    role_name: i.role_name,
                                    role_desc: i.role_desc,
                                    role_id: i.role_id));
                              });
                              if (shared.inqqq.isNotEmpty) {
                                setState(() {
                                  isLoaded = true;
                                });
                              }
                            }
                          }
                        }
                      } else if (controller.text == '') {
                        shared.inqqq.clear();
                        setState(() {
                          shared.inqqq.addAll(shared.inqq[0].data!);
                        });
                      }
                      debugPrint(shared.inqqq[0].toJson().toString());
                    } catch (e) {
                      shared.inqqq.clear();
                    }
                  },
                  onEditingComplete: () async {
                    setState(() {
                      isLoaded = false;
                    });
                    try {
                      if (controller.text.isNotEmpty) {
                        shared.inqqq.clear();
                        for (var i in shared.inqq[0].data!) {
                          print(i.toJson());
                          print(i.role_name
                              ?.toLowerCase()
                              .contains(controller.text.toLowerCase()));
                          if (i.toJson().isNotEmpty) {
                            if (i.role_name!
                                    .toLowerCase()
                                    .contains(controller.text.toLowerCase()) ||
                                i.role_desc!
                                    .toLowerCase()
                                    .contains(controller.text.toLowerCase())) {
                              debugPrint(i.role_name);
                              setState(() {
                                key.currentState?.pageTo(0);
                                shared.inqqq.add(Data(
                                    role_name: i.role_name,
                                    role_desc: i.role_desc,
                                    role_id: i.role_id));
                              });
                              if (shared.inqqq.isNotEmpty) {
                                setState(() {
                                  isLoaded = true;
                                });
                              }
                            }
                          }
                        }
                      } else if (controller.text == '') {
                        shared.inqqq.clear();
                        setState(() {
                          shared.inqqq.addAll(shared.inqq[0].data!);
                        });
                      }
                      debugPrint(shared.inqqq[0].toJson().toString());
                    } catch (e) {
                      shared.inqqq.clear();
                    }
                  },
                ),
              ),
            ],
          ),
          Container(
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: PaginatedDataTable(
                key: key,
                arrowHeadColor: kWhiteColor,
                columns: [
                  DataColumn(
                      label: Text('Role Name', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Role Desc', style: kLargeBoldTextStyle))
                ],
                source: shared.inqqq.isNotEmpty ? data : data2,
                rowsPerPage: 8,
                showFirstLastButtons: true,
                header: Text('List of Role', style: kXLargeBoldTextStyle),
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
  Prov shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.inqqq.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 500, child: Text(shared.inqqq[index].role_name.toString()))),
      DataCell(SizedBox(
          width: 500, child: Text(shared.inqqq[index].role_desc.toString())))
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
      DataCell(SizedBox(child: Text('')))
    ]);
  }
}
