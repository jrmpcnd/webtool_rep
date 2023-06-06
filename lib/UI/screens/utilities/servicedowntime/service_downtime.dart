import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import 'package:webtool_rep/UI/utils/model2.dart';
import 'package:webtool_rep/UI/widgets/date_picker.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import 'package:http/http.dart' as http;
import '../institution/components/instiAPI.dart';
import 'components/downtime_delete.dart';

class Servicedowntime extends StatefulWidget {
  const Servicedowntime({Key? key}) : super(key: key);

  @override
  State<Servicedowntime> createState() => _ServicedowntimeState();
}

class _ServicedowntimeState extends State<Servicedowntime> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Servicedowntime_U>(context, listen: false);
    shared.Servicedowntime_data.clear();
    shared.ServicedowntimeLog.clear();
    Servicedowntime_Parse httpParse = Servicedowntime_Parse();
    var res = await httpParse.profile23();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.ServicedowntimeLog.add(
            Servicedowntime_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.Servicedowntime_data.add(
            Servicedowntime_Log.fromJson(i.toJson()));
      }
      for (int i = 0; i < shared.Servicedowntime_data.length; i++) {
        shared.isChecked.add(false);
      }
    }
    for (var i in shared.Servicedowntime_data) {
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
    DeleteDowntime deletedowntime = DeleteDowntime();
    final shared = Provider.of<Servicedowntime_U>(context);
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
                  padding: kEdgeInsetsAllNormal,
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
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'Description',
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
                      Row(
                        children: [
                          DatePickerScreen(),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                        shared.Servicedowntime_data.clear();
                                        for (var i in shared
                                            .ServicedowntimeLog[0].data!) {
                                          print(i.toJson());
                                          print(i.downtimeDesc
                                              ?.toLowerCase()
                                              .contains(controller.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.downtimeDesc!
                                                .toLowerCase()
                                                .contains(controller.text
                                                    .toLowerCase())) {
                                              debugPrint(i.downtimeDesc);
                                              setState(() {
                                                shared.Servicedowntime_data.add(
                                                    Servicedowntime_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Servicedowntime_data
                                                  .isNotEmpty) {
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
                                      debugPrint(shared.Servicedowntime_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.Servicedowntime_data.clear();
                                      isLoaded = true;
                                    }
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
                                    shared.Servicedowntime_data.clear();
                                    setState(() {
                                      shared.Servicedowntime_data.addAll(
                                          shared.ServicedowntimeLog[0].data!);
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
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () async {
                                for (int i = 0;
                                    i < shared.Servicedowntime_data.length;
                                    i++) {
                                  if (shared.isChecked[i] == true) {
                                    http.Response response =
                                        await deletedowntime.deletedowntime(
                                            shared.Servicedowntime_data[i]
                                                .downtimeId);
                                    print(jsonDecode(response.body)['message']);
                                    if (await jsonDecode(
                                            response.body)['message']
                                        .toString()
                                        .toLowerCase()
                                        .contains("Updated Successfully")) {
                                      if (shared.isChecked[i] == true) {
                                        shared.Servicedowntime_data.removeAt(i);
                                        isLoaded = false;
                                      }
                                    }
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    Future.delayed(
                                      Duration(seconds: 1),
                                      () {
                                        setState(() {
                                          isLoaded = true;
                                          if (response.statusCode == 200) {
                                            wait();
                                            shared.isChecked.clear();
                                          }
                                        });
                                      },
                                    );
                                  }
                                }
                              },
                              icon: const Icon(
                                Icons.delete_outline,
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
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: kEdgeInsetsVerticalNormal,
                      child: PaginatedDataTable(
                        key: key,
                        dataRowHeight: 70,
                        arrowHeadColor: kWhiteColor,
                        columns: [
                          DataColumn(
                              label: Text('Description',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Date Start',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Date End', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Client Type',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Delete', style: kLargeBoldTextStyle)),
                        ],
                        source: isLoaded
                            ? shared.Servicedowntime_data.isNotEmpty
                                ? data
                                : data2
                            : data3,
                        rowsPerPage: 8,
                        showFirstLastButtons: true,
                        header:
                            Text('List of Role', style: kXLargeBoldTextStyle),
                      ),
                    ),
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
  Servicedowntime_U shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Servicedowntime_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 200,
          child: Text(
              shared.Servicedowntime_data[index].downtimeDesc.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(
              shared.Servicedowntime_data[index].downtimeStart.toString()))),
      DataCell(SizedBox(
          width: 200,
          child:
              Text(shared.Servicedowntime_data[index].downtimeEnd.toString()))),
      DataCell(SizedBox(
          width: 200,
          child:
              Text(shared.Servicedowntime_data[index].clientType.toString()))),
      DataCell(SizedBox(
          width: 50,
          child: DowntimeDeleteFunction(
            index: index,
          ))),
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
    return const DataRow(cells: [
      DataCell(SizedBox(child: Text('Loading, please wait'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
    ]);
  }
}
