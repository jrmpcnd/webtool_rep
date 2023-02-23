import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/textfield.dart';

class Typeofconcern extends StatefulWidget {
  const Typeofconcern({Key? key}) : super(key: key);

  @override
  State<Typeofconcern> createState() => _TypeofconcernState();
}

class _TypeofconcernState extends State<Typeofconcern> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared2 = Provider.of<Prov10>(context, listen: false);
    shared2.concern.clear();
    Type_ConcernParse httpParse2 = Type_ConcernParse();
    var res2 = await httpParse2.profile10();
    if (res2.data!.isNotEmpty) {
      print(res2.data!.length);
      print(res2.data![0].toJson().length);
      setState(() {
        shared2.concern.add(Type_of_Concern.fromJson(res2.toJson()));
        isLoaded = true;
      });
      for (var i in res2.data!) {
        setState(() {});
        shared2.concern_data.add(Data10.fromJson(i.toJson()));
      }
    }
    for (var i in shared2.concern_data) {
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
    final shared = Provider.of<Prov10>(context);
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
                    shared.concern_data.clear();
                    for (var i in shared.concern[0].data!) {
                      print(i.toJson());
                      print(i.concernName
                          ?.toLowerCase()
                          .contains(controller.text.toLowerCase()));
                      if (i.toJson().isNotEmpty) {
                        if (i.concernTime!
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                            i.concernLevel!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())








                        ) {
                          debugPrint(i.concernName);
                          setState(() {
                            shared.concern_data.add(Data10.fromJson(i.toJson()));
                          });
                          if (shared.concern_data.isNotEmpty) {
                            setState(() {
                              isLoaded = true;
                            });
                          }
                        }
                      }
                    }
                  } else if (controller.text == '') {
                      shared.concern_data.clear();
                    setState(() {
                      shared.concern_data.addAll(shared.concern[0].data!);
                      isLoaded = true;
                    });
                  }
                  debugPrint(shared.concern_data[0].toJson().toString());
                } catch (e) {
                  shared.concern_data.clear();
                  isLoaded = true;
                }
              },
              onEditingComplete: () async {
                setState(() {
                  isLoaded = false;
                });
                try {
                  if (controller.text.isNotEmpty) {
                    shared.concern_data.clear();
                    for (var i in shared.concern[0].data!) {
                      print(i.toJson());
                      print(i.concernName
                          ?.toLowerCase()
                          .contains(controller.text.toLowerCase()));
                      if (i.toJson().isNotEmpty) {
                        if (i.concernTime!
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                            i.concernLevel!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase())


                        ) {
                          debugPrint (i.concernName);
                          setState(() {
                            key.currentState?.pageTo(0);
                            shared.concern_data.add(Data10.fromJson(i.toJson()
                            ));

                          });
                          if (shared.concern_data .isNotEmpty) {
                            setState(() {
                              isLoaded = true;
                            });
                          }
                        }
                      }
                    }
                  } else if (controller.text == '') {
                    shared.concern_data.clear();
                    setState(() {
                      shared.concern_data.addAll(shared.concern[0].data!);
                    });
                  }
                  debugPrint(shared.concern_data[0].toJson().toString());
                } catch (e) {
                  shared.concern_data.clear();
                }
              },
            ),
          ),
          Container(
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: PaginatedDataTable(
                key: key,
                dataRowHeight: 50,
                arrowHeadColor: kWhiteColor,
                columns: [
                  DataColumn(
                      label: Text('Concern', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Turn Around Time(In Minutes)',
                          style: kLargeBoldTextStyle)),
                  DataColumn(
                      label:
                          Text('Complexity Level', style: kLargeBoldTextStyle))
                ],
                source: isLoaded
                    ? shared.concern_data.isNotEmpty
                        ? data
                        : data2
                    : data3,
                rowsPerPage: 8,
                showFirstLastButtons: true,
                header:
                    Text('Type Of Concern List', style: kXLargeBoldTextStyle),
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
  Prov10 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.concern_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.concern_data[index].concernName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.concern_data[index].concernTime.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.concern_data[index].concernLevel.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
