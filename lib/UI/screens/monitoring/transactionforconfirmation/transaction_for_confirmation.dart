import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/spacing.dart';
import 'package:webtool_rep/UI/widgets/date_picker.dart';
import 'package:webtool_rep/UI/widgets/date_picker1.dart';
import 'package:webtool_rep/UI/widgets/elevatedbuttonpopup.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/text_styles.dart';

class Transactionforconfirmation extends StatefulWidget {
  const Transactionforconfirmation({Key? key}) : super(key: key);

  @override
  State<Transactionforconfirmation> createState() =>
      _TransactionforconfirmationState();
}

class _TransactionforconfirmationState
    extends State<Transactionforconfirmation> {
  List<String> res = [];
  List<String> res1 = [];
  String init = '';
  String init1 = '';

  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TransactionConfirm_API dropdownInsti = TransactionConfirm_API();
  TransactionStatus_Api dropdownUnit = TransactionStatus_Api();

  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared3 = Provider.of<Prov3>(context, listen: false);
    shared3.confirm.clear();
    TconfirmationParse httpParse3 = TconfirmationParse();
    var res3 = await httpParse3.profile3();
    if (res3.data!.isNotEmpty) {
      print(res3.data!.length);
      print(res3.data![0].toJson().length);
      setState(() {
        shared3.confirm.add(Transaction_Confirmation.fromJson(res3.toJson()));
        isLoaded = true;
      });
      for (var i in res3.data!) {
        setState(() {});
        shared3.confirm_data.add(Data3.fromJson(i.toJson()));
      }
    }
    for (var i in shared3.confirm_data) {
      print(i.toJson());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
      getList();
      getUnit();
    });
  }

  getList() async {
    List<dynamic> dlist = await dropdownInsti.getCategory();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_tfc_transaction_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde == $res");
  }

  getUnit() async {
    List<dynamic> dlist = await dropdownUnit.getStatus();
    for (var i in dlist) {
      setState(() {
        res1.add(i['get_tfc_status_dropdown']);
      });
    }
    setState(() {
      init1 = res1[0];
    });
    print("safgsdgsdgsdfgde $res1");
  }

  Widget build(BuildContext context) {
    final shared = Provider.of<Prov3>(context);
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                height: 250.0,
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
                            Column(
                              children: [
                                SizedBox(
                                  height: 35.0,
                                  width: 400,
                                  child: TextFormField(
                                    style: kTextStyle,
                                    decoration: const InputDecoration(
                                      hintText: 'CID',
                                      border: OutlineInputBorder(),
                                      labelStyle: TextStyle(fontSize: 12.0),
                                      contentPadding:
                                          EdgeInsets.only(left: 10.0),
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
                                    onChanged: (value) {
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      try {
                                        if (controller1.text.isNotEmpty) {
                                          shared.confirm_data.clear();
                                          for (var i
                                              in shared.confirm[0].data!) {
                                            print(i.toJson());
                                            print(i.cid?.toLowerCase().contains(
                                                controller1.text
                                                    .toLowerCase()));
                                            if (i.toJson().isNotEmpty) {
                                              if (i.cid!.toLowerCase().contains(
                                                  controller1.text
                                                      .toLowerCase())) {
                                                debugPrint(i.cid);
                                                setState(() {
                                                  shared.confirm_data.add(
                                                      Data3.fromJson(
                                                          i.toJson()));
                                                });
                                                if (shared
                                                    .confirm_data.isNotEmpty) {
                                                  setState(() {
                                                    isLoaded = true;
                                                  });
                                                }
                                              }
                                            }
                                          }
                                        } else if (controller1.text == '') {
                                          shared.confirm_data.clear();
                                          setState(() {
                                            shared.confirm_data.addAll(
                                                shared.confirm[0].data!);
                                            isLoaded = true;
                                          });
                                        }
                                        debugPrint(shared.confirm_data[0]
                                            .toJson()
                                            .toString());
                                      } catch (e) {
                                        shared.confirm_data.clear();
                                        isLoaded = true;
                                      }
                                    },
                                    onEditingComplete: () async {
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      try {
                                        if (controller1.text.isNotEmpty) {
                                          shared.confirm_data.clear();
                                          for (var i
                                              in shared.confirm[0].data!) {
                                            print(i.toJson());
                                            print(i.cid?.toLowerCase().contains(
                                                controller1.text
                                                    .toLowerCase()));
                                            if (i.toJson().isNotEmpty) {
                                              if (i.cid!.toLowerCase().contains(
                                                      controller1.text
                                                          .toLowerCase()) ||
                                                  i.cid!.toLowerCase().contains(
                                                      controller1.text
                                                          .toLowerCase())) {
                                                debugPrint(i.cid);
                                                setState(() {
                                                  key.currentState?.pageTo(0);
                                                  shared.confirm_data.add(
                                                      Data3.fromJson(
                                                          i.toJson()));
                                                });
                                                if (shared
                                                    .confirm_data.isNotEmpty) {
                                                  setState(() {
                                                    isLoaded = true;
                                                  });
                                                }
                                              }
                                            }
                                          }
                                        } else if (controller1.text == '') {
                                          shared.confirm_data.clear();
                                          setState(() {
                                            shared.confirm_data.addAll(
                                                shared.confirm[0].data!);
                                          });
                                        }
                                        debugPrint(shared.confirm_data[0]
                                            .toJson()
                                            .toString());
                                      } catch (e) {
                                        shared.confirm_data.clear();
                                      }
                                    },
                                  ),
                                ),
                                verticalSpaceTiny,
                                Container(
                                  height: 35.0,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                          color: Color(0xFF000000), width: 1),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: DropdownButton(
                                        iconEnabledColor: Colors.black,
                                        value: init,
                                        items: res.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(e, style: kText),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            init = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpaceTiny,
                                Container(
                                  height: 35.0,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                          color: Color(0xFF000000), width: 1),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: DropdownButton(
                                        iconEnabledColor: Colors.black,
                                        value: init1,
                                        items: res1.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(e, style: kText),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            init1 = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0,
                              height: 35.0,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kPrimaryColor)),
                                onPressed: () {
                                  try {
                                    print(" === $init");
                                    print(
                                        "+_+_+_+_+${init.toLowerCase().contains('cash out')}");
                                    if (controller.text.isNotEmpty ) {
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      shared.confirm_data.clear();
                                      for (var i in shared.confirm[0].data!) {
                                        // print(i.toJson());
                                        // print(i.cid?.toLowerCase().contains(
                                        //     controller.text.toLowerCase()));
                                        if (i.toJson().isNotEmpty) {
                                          if (i.cid!.toLowerCase().contains(
                                              controller.text.toLowerCase())) {
                                            setState(() {
                                              shared.confirm_data.add(
                                                  Data3.fromJson(i.toJson()));
                                            });
                                            if (shared
                                                .confirm_data.isNotEmpty) {
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
                                    if (init
                                        .toLowerCase()
                                        .contains('cash out')) {
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      shared.confirm_data.clear();
                                      for (var i in shared.confirm[0].data!) {
                                        if (i.toJson().isNotEmpty) {
                                          if (i.transDesc!
                                              .toLowerCase()
                                              .contains(init
                                                  .toString()
                                                  .toLowerCase())) {
                                            setState(() {
                                              shared.confirm_data.add(
                                                  Data3.fromJson(i.toJson()));
                                            });
                                            if (shared
                                                .confirm_data.isNotEmpty) {
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
                                    if (init
                                        .toLowerCase()
                                        .contains('cash in - cash out')) {
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      shared.confirm_data.clear();
                                      for (var i in shared.confirm[0].data!) {
                                        if (i.toJson().isNotEmpty) {
                                          if (i.transDesc!
                                                  .toLowerCase()
                                                  .contains('cash in') ||
                                              i.transDesc!
                                                  .toLowerCase()
                                                  .contains('cash out')) {
                                            setState(() {
                                              shared.confirm_data.add(
                                                  Data3.fromJson(i.toJson()));
                                            });
                                            if (shared
                                                .confirm_data.isNotEmpty) {
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
                                    if (init
                                        .toLowerCase()
                                        .contains('fund transfer')) {
                                      setState(() {
                                        if (init.toLowerCase().contains(
                                            'cash in - fund transfer')) {
                                          isLoaded = false;
                                        }
                                      });
                                      shared.confirm_data.clear();
                                      for (var i in shared.confirm[0].data!) {
                                        if (i.toJson().isNotEmpty) {
                                          if (i.transDesc!
                                                  .toLowerCase()
                                                  .contains('cash in') ||
                                              i.transDesc!
                                                  .toLowerCase()
                                                  .contains('fund transfer')) {
                                            setState(() {
                                              shared.confirm_data.add(
                                                  Data3.fromJson(i.toJson()));
                                            });
                                            if (shared
                                                .confirm_data.isNotEmpty) {
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
                                    debugPrint(shared.confirm_data[0]
                                        .toJson()
                                        .toString());
                                  } catch (e) {
                                    shared.confirm_data.clear();
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
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 100.0,
                              height: 35.0,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kSecondaryColor2)),
                                onPressed: () {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  controller.clear();
                                  controller1.clear();
                                  init = res[0];
                                  init1 = res1[0];
                                  setState(() {
                                    shared.confirm_data
                                        .addAll(shared.confirm[0].data!);
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
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        elevatedbuttonpopup(
                            label: "Branch", width: 400.0),
                        verticalSpaceTiny,
                        DatePickerScreen1(),
                        verticalSpaceTiny,
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  padding: kEdgeInsetsVerticalNormal,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      cardColor: Color(0xFF6F8A71),
                    ),
                    child: PaginatedDataTable(
                      key: key,
                      dataRowHeight: 50,
                      arrowHeadColor: kWhiteColor,
                      columns: [
                        DataColumn(
                            label: Text('Date', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Transaction',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label:
                                Text('Mobile No.', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('CID', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Client Name',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Branch', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Unit', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Center', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Details', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Status', style: kLargeBoldTextStyle)),
                      ],
                      source: isLoaded
                          ? shared.confirm_data.isNotEmpty
                              ? data
                              : data2
                          : data3,
                      rowsPerPage: 8,
                      showFirstLastButtons: true,
                      header: Text('Transaction for Confirmation List',
                          style: kXLargeBoldTextStyle),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov3 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.confirm_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].transDate.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].transDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].clientMobileNo.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.confirm_data[index].cid.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].clientName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].branchDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].unitDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].centerDesc.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.confirm_data[index].note.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.confirm_data[index].status.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
    ]);
  }
}
