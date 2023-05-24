import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import '../../../../core/providers/Provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model2.dart';
import 'package:http/http.dart' as http;
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../institution/components/instiAPI.dart';
import 'components/alertdialogdcm.dart';
import 'components/dcmlocation_delete.dart';

class Dcmlocation extends StatefulWidget {
  const Dcmlocation({Key? key}) : super(key: key);

  @override
  State<Dcmlocation> createState() => _DcmlocationState();
}

class _DcmlocationState extends State<Dcmlocation> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<AtmLocation>(context, listen: false);
    shared.AtmLocation_data.clear();
    shared.AtmLocation_Log.clear();
    Atm_Location_Parse httpParse = Atm_Location_Parse();
    var res = await httpParse.profile20();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.AtmLocation_Log.add(Atm_Loc_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.AtmLocation_data.add(Atm_Loc_Log.fromJson(i.toJson()));
      }
      for (int i = 0; i < shared.AtmLocation_data.length; i++) {
        shared.isChecked.add(false);
      }
    }
    for (var i in shared.AtmLocation_data) {
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
    DeleteATM deleteatm = DeleteATM();
    final shared = Provider.of<AtmLocation>(context);
    final DataTableSource data =
        MyData(shared: shared, dashboardContext: context);
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
                  height: 110.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: TextStyle(color: kBlackColor),
                          decoration: const InputDecoration(
                            hintText: 'Location',
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
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    //
                                    try {
                                      if (controller.text.isNotEmpty) {
                                        shared.AtmLocation_data.clear();
                                        for (var i in shared
                                            .AtmLocation_Log[0].data!) {
                                          print(i.toJson());
                                          print(i.atmCity
                                              ?.toLowerCase()
                                              .contains(controller.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.atmCity!
                                                    .toLowerCase()
                                                    .contains(controller.text
                                                        .toLowerCase()) ||
                                                i.atmAddress!
                                                    .toLowerCase()
                                                    .contains(controller.text
                                                        .toLowerCase()) ||
                                                i.atmDescription!
                                                    .toLowerCase()
                                                    .contains(controller.text
                                                        .toLowerCase()) ||
                                                i.instDesc!
                                                    .toLowerCase()
                                                    .contains(controller.text
                                                        .toLowerCase())) {
                                              debugPrint(i.instDesc);
                                              setState(() {
                                                shared.AtmLocation_data.add(
                                                    Atm_Loc_Log.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared.AtmLocation_data
                                                  .isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller.text == '') {
                                        shared.AtmLocation_data.clear();
                                        setState(() {
                                          shared.AtmLocation_data.addAll(
                                              shared.AtmLocation_Log[0].data!);
                                          isLoaded = true;
                                        });
                                      }
                                      debugPrint(shared.AtmLocation_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.AtmLocation_data.clear();
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
                                    shared.AtmLocation_data.clear();
                                    setState(() {
                                      shared.AtmLocation_data.addAll(
                                          shared.AtmLocation_Log[0].data!);
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
                                    i < shared.AtmLocation_data.length;
                                    i++) {
                                  if (shared.isChecked[i] == true) {
                                    http.Response response =
                                        await deleteatm.deleteatm(
                                            shared.AtmLocation_data[i].atmId);
                                    print(jsonDecode(response.body)['message']);
                                    if (await jsonDecode(
                                            response.body)['message']
                                        .toString()
                                        .toLowerCase()
                                        .contains("Updated Successfully")) {
                                      if (shared.isChecked[i] == true) {
                                        shared.AtmLocation_data.removeAt(i);
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
                              label: Text('Insti Description',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Description',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Street/Brgy',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('City/Province',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Action', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Delete', style: kLargeBoldTextStyle)),
                        ],
                        source: isLoaded
                            ? shared.AtmLocation_data.isNotEmpty
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
  final _formKey = GlobalKey<FormState>();
  BuildContext? dashboardContext;
  AtmLocation shared;
  MyData({required this.shared, this.dashboardContext});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.AtmLocation_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.AtmLocation_data[index].instDesc.toString()))),
      DataCell(SizedBox(
          width: 200,
          child:
              Text(shared.AtmLocation_data[index].atmDescription.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.AtmLocation_data[index].atmAddress.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.AtmLocation_data[index].atmCity.toString()))),
      DataCell(SizedBox(
        width: 50,
        child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            showDialog(
              context: dashboardContext!,
              builder: (ctx) => Form(
                key: _formKey,
                child: AlertEditFunction(
                  atmCity: shared.AtmLocation_data[index].atmCity.toString(),
                  atmId: shared.AtmLocation_data[index].atmId.toString(),
                  atmAddress:
                      shared.AtmLocation_data[index].atmAddress.toString(),
                  atmLatitude:
                      shared.AtmLocation_data[index].atmLatitude.toString(),
                  atmLongitude:
                      shared.AtmLocation_data[index].atmLongitude.toString(),
                  instDesc: shared.AtmLocation_data[index].instDesc.toString(),
                  atmDescription:
                      shared.AtmLocation_data[index].atmDescription.toString(),
                ),
              ),
            );
          },
        ),
      )),
      DataCell(SizedBox(
          width: 50,
          child: DcmlocationDeleteFunction(
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
      DataCell(SizedBox(child: Text('Loading, please wait'))),
      DataCell(SizedBox(
          child: Center(
        child: CircularProgressIndicator(),
      ))),
      DataCell(SizedBox(
          child: Center(
        child: CircularProgressIndicator(),
      ))),
      DataCell(SizedBox(
          child: Center(
        child: CircularProgressIndicator(),
      ))),
      DataCell(SizedBox(
          child: Center(
        child: CircularProgressIndicator(),
      ))),
      DataCell(SizedBox(
          child: Center(
        child: CircularProgressIndicator(),
      ))),
    ]);
  }
}
