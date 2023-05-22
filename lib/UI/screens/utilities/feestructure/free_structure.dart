import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/utilities/feestructure/components/alertdialog.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import 'package:http/http.dart' as http;

import '../institution/components/instiAPI.dart';
import 'components/structure_delete.dart';

class Feestructure extends StatefulWidget {
  const Feestructure({Key? key}) : super(key: key);

  @override
  State<Feestructure> createState() => _FeestructureState();
}

class _FeestructureState extends State<Feestructure> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared2 = Provider.of<Prov12>(context, listen: false);
    shared2.fee.clear();
    shared2.fee_data.clear();
    Fee_StructureParse httpParse2 = Fee_StructureParse();
    var res2 = await httpParse2.profile12();
    if (res2.data!.isNotEmpty) {
      print(res2.data!.length);
      print(res2.data![0].toJson().length);
      setState(() {
        shared2.fee.add(Fee_Structure.fromJson(res2.toJson()));
        isLoaded = true;
      });
      for (var i in res2.data!) {
        setState(() {});
        shared2.fee_data.add(Data12.fromJson(i.toJson()));
      }
      for (int i = 0; i < shared2.fee_data.length; i++) {
        shared2.isChecked.add(false);
      }
    }
    for (var i in shared2.fee_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  String init = '';
  FeeStructure_Api dropdownFunction = FeeStructure_Api();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
    });
    getList();
  }

  getList() async {
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_fs_transaction_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  @override
  Widget build(BuildContext context) {
    DeleteFee deletefee = DeleteFee();
    final shared = Provider.of<Prov12>(context);
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
                  height: 200.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton(
                        value: init,
                        items: res.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child:
                                Text(e, style: TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            init = value.toString();
                          });
                        },
                      ),
                      verticalSpaceMedium,
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
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () async {
                                for (int i = 0;
                                    i < shared.fee_data.length;
                                    i++) {
                                  if (shared.isChecked[i] == true) {
                                    http.Response response = await deletefee
                                        .deletefee(shared.fee_data[i].feeId);
                                    print(jsonDecode(response.body)['message']);
                                    if (await jsonDecode(
                                            response.body)['message']
                                        .toString()
                                        .toLowerCase()
                                        .contains("Updated Successfully")) {
                                      if (shared.isChecked[i] == true) {
                                        shared.fee_data.removeAt(i);
                                      }
                                    }
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
                              shared.fee_data.clear();
                              for (var i in shared.fee[0].data!) {
                                print(i.toJson());
                                print(i.transType
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.range!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.totalCharge!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.agentIncome!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.bankIncome!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.agentTargetIncome!
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase()) ||
                                      i.agentIncome!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.transType);
                                    setState(() {
                                      shared.fee_data
                                          .add(Data12.fromJson(i.toJson()));
                                    });
                                    if (shared.fee_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.fee_data.clear();
                              setState(() {
                                shared.fee_data.addAll(shared.fee[0].data!);
                                isLoaded = true;
                              });
                            }
                            debugPrint(shared.fee_data[0].toJson().toString());
                          } catch (e) {
                            shared.fee_data.clear();
                            isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.fee_data.clear();
                              for (var i in shared.fee[0].data!) {
                                print(i.toJson());
                                print(i.transType
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.range!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.totalCharge!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.agentIncome!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.bankIncome!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.agentTargetIncome!
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase()) ||
                                      i.agentIncome!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.transType);
                                    setState(() {
                                      key.currentState?.pageTo(0);
                                      shared.fee_data
                                          .add(Data12.fromJson(i.toJson()));
                                    });
                                    if (shared.fee_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.fee_data.clear();
                              setState(() {
                                shared.fee_data.addAll(shared.fee[0].data!);
                              });
                            }
                            debugPrint(shared.fee_data[0].toJson().toString());
                          } catch (e) {
                            shared.fee_data.clear();
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
                                label: Text('transaction',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Range', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Total Charge',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Agent Income',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Bank Income',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Agent Target Income',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('AP Bancnet Instapay',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Action', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Delete', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.fee_data.isNotEmpty
                                  ? data
                                  : data2
                              : data3,
                          rowsPerPage: 8,
                          showFirstLastButtons: true,
                          header:
                              Text('List of User', style: kXLargeBoldTextStyle),
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
  final _formKey = GlobalKey<FormState>();
  BuildContext? dashboardContext;

  Prov12 shared;
  MyData({required this.shared, this.dashboardContext});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.fee_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.fee_data[index].transType.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.fee_data[index].range.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.fee_data[index].totalCharge.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.fee_data[index].agentIncome.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.fee_data[index].bankIncome.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.fee_data[index].agentTargetIncome.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.fee_data[index].bancnetIncome.toString()))),
      DataCell(
        SizedBox(
          width: 50,
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: dashboardContext!,
                builder: (ctx) => Form(
                  key: _formKey,
                  child: AlertEditFunction(
                    feeId: shared.fee_data[index].feeId.toString(),
                    transType: shared.fee_data[index].transType.toString(),
                    range: shared.fee_data[index].range.toString(),
                    totalCharge: shared.fee_data[index].totalCharge.toString(),
                    agentIncome: shared.fee_data[index].agentIncome.toString(),
                    bankIncome: shared.fee_data[index].bankIncome.toString(),
                    bancnetIncome:
                        shared.fee_data[index].bancnetIncome.toString(),
                    agentTargetIncome:
                        shared.fee_data[index].agentTargetIncome.toString(),
                    clientType: shared.fee_data[index].clientType,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      DataCell(SizedBox(
          width: 50,
          child: StructureDeleteFunction(
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
    return const DataRow(cells: [
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
    return const DataRow(cells: [
      DataCell(SizedBox(child: Text('Loading Please wait!'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
