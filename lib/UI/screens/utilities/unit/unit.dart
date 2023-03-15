import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import 'package:webtool_rep/UI/utils/functions.dart';
import 'package:webtool_rep/UI/utils/model2.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/components/alertdialog.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/textfield.dart';

class Unit extends StatefulWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  TextEditingController unit_code_controller = TextEditingController();
  TextEditingController unit_desc_controller = TextEditingController();
  TextEditingController controller = TextEditingController();
  bool static = false;
  Future<void> wait() async {
    final shared = Provider.of<Unit_U>(context, listen: false);
    shared.Unit_data.clear();
    Unit_Parse unit = Unit_Parse();
    var res = await unit.profile25();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.UnitLog.add(Unit_Api.fromJson(res.toJson()));
        shared.isLoaded = true;
      });
      for (var i in res.data!) {
        shared.Unit_data.add(Unit_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Unit_data) {
      print(i.toJson());
    }
  }

  @override
  void initState() {
    Unit_Function.unit(unit_code: '', unit_desc: '');
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Unit_U>(context);
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
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textfield(
                        hintext: "Code",
                        controller: unit_code_controller,
                      ),
                      verticalSpaceTiny,
                      textfield(
                        hintext: "Description",
                        controller: unit_desc_controller,
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
                                    Unit_Function.unit(
                                      unit_code: unit_code_controller.text,
                                      unit_desc: unit_desc_controller.text,
                                    );
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
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () {},
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
                            shared.isLoaded = false;
                          });
                          //
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.Unit_data.clear();
                              for (var i in shared.UnitLog[0].data!) {
                                print(i.toJson());
                                print(i.createdDate
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.createdDate!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.createdDate!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.unitDesc!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.unitCode!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.unitCode);
                                    setState(() {
                                      shared.Unit_data.add(
                                          Unit_Log.fromJson(i.toJson()));
                                    });
                                    if (shared.Unit_data.isNotEmpty) {
                                      setState(() {
                                        shared.isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.Unit_data.clear();
                              setState(() {
                                shared.Unit_data.addAll(
                                    shared.UnitLog[0].data!);
                                shared.isLoaded = true;
                              });
                            }
                            debugPrint(shared.Unit_data[0].toJson().toString());
                          } catch (e) {
                            shared.Unit_data.clear();
                            shared.isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            shared.isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.Unit_data.clear();
                              for (var i in shared.UnitLog[0].data!) {
                                print(i.toJson());
                                print(i.createdDate
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.createdDate!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.createdDate!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.unitDesc!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.unitCode!.toLowerCase().contains(
                                          controller.text.toLowerCase()))
                                    debugPrint(i.unitCode);
                                  setState(() {
                                    key.currentState?.pageTo(0);
                                    shared.Unit_data.add(
                                        Unit_Log.fromJson(i.toJson()));
                                  });
                                  if (shared.Unit_data.isNotEmpty) {
                                    setState(() {
                                      shared.isLoaded = true;
                                    });
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.Unit_data.clear();
                              setState(() {
                                shared.Unit_data.addAll(
                                    shared.UnitLog[0].data!);
                              });
                            }
                            debugPrint(shared.Unit_data[0].toJson().toString());
                          } catch (e) {
                            shared.UnitLog.clear();
                          }
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: kEdgeInsetsVerticalNormal,
                      child: PaginatedDataTable(
                        key: key,
                        dataRowHeight: 70,
                        arrowHeadColor: kWhiteColor,
                        columns: [
                          DataColumn(
                              label: Text('Code', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Description',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Create Date',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Action', style: kLargeBoldTextStyle)),
                        ],
                        source: shared.isLoaded
                            ? shared.Unit_data.isNotEmpty
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
  late String get_unit_code = '';
  late String get_unit_desc = '';
  late String get_unit_id = '';

  BuildContext? dashboardContext;
  Unit_U shared;
  Future<void> wait() async {
    shared.Unit_data.clear();
    Unit_Parse unit = Unit_Parse();
    var res = await unit.profile25();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
        shared.UnitLog.add(Unit_Api.fromJson(res.toJson()));
        shared.isLoaded = true;
      for (var i in res.data!) {
        shared.Unit_data.add(Unit_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Unit_data) {
      print(i.toJson());
    }
  }
  MyData({required this.shared, this.dashboardContext});
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Unit_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Unit_data[index].unitCode.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Unit_data[index].unitDesc.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Unit_data[index].createdDate.toString()))),
      DataCell(SizedBox(
        width: 50,
        child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            showDialog(
              context: dashboardContext!,
              builder: (ctx) => Form(
                key: _formKey,
                child: AlertEditFunction(code: shared.Unit_data[index].unitCode.toString(),
                    date: shared.Unit_data[index].createdDate.toString(),
                desc: shared.Unit_data[index].unitDesc.toString(),),
              ),
            );
          },
        ),
      )),
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
    ]);
  }
}
