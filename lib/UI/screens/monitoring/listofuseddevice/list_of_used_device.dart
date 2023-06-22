import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/screens/monitoring/transactionforconfirmation/getter_setter.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/date_picker.dart';
import '../../../../core/providers/Provider.dart';
import '../../../utils/api2.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model2.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';

class Listofuseddevice extends StatefulWidget {
  const Listofuseddevice({Key? key}) : super(key: key);

  @override
  State<Listofuseddevice> createState() => _ListofuseddeviceState();
}

class _ListofuseddeviceState extends State<Listofuseddevice> {
  List<String> res = [];
  List<String> res2 = [];
  String init = '';
  String init2 = '';
  bool static = false;
  bool isLoaded = false;
  ListofUseDevice_Api dropdownFunction = ListofUseDevice_Api();
  ListofUseDeviceStatus_Api dropdownStatus = ListofUseDeviceStatus_Api();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  Future<void> wait() async {
    final shared = Provider.of<Listofuse_Device>(context, listen: false);
    shared.Listofuse_DeviceLog.clear();
    shared.Listofuse_Device_data.clear();
    ListofUserDevice_Parse listofdevice = ListofUserDevice_Parse();
    var res = await listofdevice.profile7();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      setState(() {
        shared.Listofuse_DeviceLog.add(
            UseoflistDevice_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        // shared.inqqq.add(Data.fromJson(i.toJson()));
        shared.Listofuse_Device_data.add(
            UseoflistDevice_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Listofuse_Device_data) {
      print(i.toJson());
    }
  }

  void initState() {
    getList();
    getCathegory();
    wait();
  }

  getList() async {
    List<dynamic> dlist = await dropdownFunction.getStatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_lud_clientype_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  getCathegory() async {
    List<dynamic> dlist = await dropdownStatus.getStatus();
    for (var i in dlist) {
      setState(() {
        res2.add(i['get_lud_status_dropdown']);
      });
    }
    setState(() {
      init2 = res2[0];
    });
    print("safgsdgsdgsdfgde $res2");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Listofuse_Device>(context);
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
                          Column(
                            children: [
                              Row(
                                children: [
                                  DatePickerScreen(
                                      startDateController: startDate,
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
                              style: TextStyle(color: kBlackColor),
                              decoration: const InputDecoration(
                                hintText: 'CIF Number',
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
                              controller: controller1,
                            ),
                          ),
                          verticalSpaceTiny,
                          DropdownButton(
                            value: init,
                            items: res.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e,
                                    style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                init = value.toString();
                              });
                            },
                          ),
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
                                      if (controller1.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          print(i.toJson());
                                          print(i.cid?.toLowerCase().contains(
                                              controller1.text.toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.cid!.toLowerCase().contains(
                                                    controller1.text
                                                        .toLowerCase()) &&
                                                i.activatedDateStart!
                                                    .toLowerCase()
                                                    .contains(
                                                        GetDate.getStartDate2()
                                                            .toString())) {
                                              debugPrint(i.cid);
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      if (controller2.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          print(i.toJson());
                                          print(i.deviceId
                                              ?.toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.deviceId!
                                                    .toLowerCase()
                                                    .contains(controller2.text
                                                        .toLowerCase()) &&
                                                i.cid!.toLowerCase().contains(
                                                    controller1.text
                                                        .toLowerCase()) &&
                                                i.mobileNumber!
                                                    .toLowerCase()
                                                    .contains(controller3.text
                                                        .toLowerCase()) &&
                                                i.clientType!
                                                    .toLowerCase()
                                                    .contains(init
                                                        .toString()
                                                        .toLowerCase()) &&
                                                i.activatedDateStart!
                                                    .toLowerCase()
                                                    .contains(
                                                        GetDate.getStartDate2()
                                                            .toString())) {
                                              debugPrint(i.deviceId);
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      if (controller3.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          print(i.toJson());
                                          print(i.mobileNumber
                                              ?.toLowerCase()
                                              .contains(controller3.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.mobileNumber!
                                                    .toLowerCase()
                                                    .contains(controller3.text
                                                        .toLowerCase()) &&
                                                i.deviceId!
                                                    .toLowerCase()
                                                    .contains(controller2.text
                                                        .toLowerCase()) &&
                                                i.cid!.toLowerCase().contains(
                                                    controller1.text
                                                        .toLowerCase()) &&
                                                i.clientType!
                                                    .toLowerCase()
                                                    .contains(init
                                                        .toString()
                                                        .toLowerCase()) &&
                                                i.activatedDateStart!
                                                    .toLowerCase()
                                                    .contains(
                                                        GetDate.getStartDate2()
                                                            .toString())) {
                                              debugPrint(i.deviceId);
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      if (init
                                          .toLowerCase()
                                          .contains('member')) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          if (i.toJson().isNotEmpty) {
                                            if (i.clientType!
                                                .toLowerCase()
                                                .contains(('member'))) {
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      if (init
                                          .toLowerCase()
                                          .contains('non member')) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          if (i.toJson().isNotEmpty) {
                                            if (i.clientType!
                                                .toLowerCase()
                                                .contains('non member')) {
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      if (init2
                                          .toLowerCase()
                                          .contains('used')) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          if (i.toJson().isNotEmpty) {
                                            if (i.deviceStatus!
                                                .toLowerCase()
                                                .contains('1')) {
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      if (init2
                                          .toLowerCase()
                                          .contains('unused')) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Listofuse_Device_data.clear();
                                        for (var i in shared
                                            .Listofuse_DeviceLog[0].data!) {
                                          if (i.toJson().isNotEmpty) {
                                            if (i.deviceStatus!
                                                .toLowerCase()
                                                .contains('0')) {
                                              setState(() {
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
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
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      shared.Listofuse_Device_data.clear();
                                      print(GetDate.getStartDate2());
                                      final transactionDate = DateTime.parse(
                                          GetDate.getStartDate2());
                                      print(transactionDate);
                                      for (var i in shared
                                          .Listofuse_DeviceLog[0].data!) {
                                        if (i.toJson().isNotEmpty) {
                                          if (i.activatedDateStart != '') {
                                            final transactionsDate =
                                                DateTime.parse(i
                                                    .activatedDateStart
                                                    .toString()
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
                                                shared.Listofuse_Device_data
                                                    .add(UseoflistDevice_Log
                                                        .fromJson(i.toJson()));
                                              });
                                              if (shared.Listofuse_Device_data
                                                  .isNotEmpty) {
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
                                      debugPrint(shared.Listofuse_Device_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.Listofuse_Device_data.clear();
                                      isLoaded = true;
                                    }
                                    print(shared.Listofuse_Device_data);
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
                                    controller1.clear();
                                    controller2.clear();
                                    controller3.clear();
                                    init = res[0];
                                    GetDate.setStartDate2('');
                                    GetDate.setEndDate2('');
                                    GetDate.reset = true;
                                    startDate.text = '';
                                    endDate.text = '';
                                    shared.Listofuse_Device_data.clear();
                                    setState(() {
                                      shared.Listofuse_Device_data.addAll(
                                          shared.Listofuse_DeviceLog[0].data!);
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
                                  style: TextStyle(color: kBlackColor),
                                  decoration: const InputDecoration(
                                    hintText: 'Device ID',
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
                                  controller: controller2,
                                ),
                              ),
                              verticalSpaceTiny,
                              SizedBox(
                                height: 35.0,
                                width: 400,
                                child: TextFormField(
                                  style: TextStyle(color: kBlackColor),
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
                                  controller: controller3,
                                ),
                              ),
                              verticalSpaceTiny,
                              DropdownButton(
                                value: init2,
                                items: res2.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e,
                                        style: TextStyle(color: Colors.black)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    init2 = value.toString();
                                  });
                                },
                              ),
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
                              label: Text('Date & Time \nActivated',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Device ID',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Device Model',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Andriod\nVersion',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('CIF', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Branch', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Mobile Number',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Name of Customer',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Client Type\n(Member/NonMember',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Status\n(Used/Unused)',
                                  style: kLargeBoldTextStyle)),
                        ],
                        source: isLoaded
                            ? shared.Listofuse_Device_data.isNotEmpty
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
  Listofuse_Device shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Listofuse_Device_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.Listofuse_Device_data[index].activatedDateStart
              .toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
              Text(shared.Listofuse_Device_data[index].deviceId.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.Listofuse_Device_data[index].deviceModel.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.Listofuse_Device_data[index].androidVersion.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.Listofuse_Device_data[index].cid.toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
              Text(shared.Listofuse_Device_data[index].branchCode.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.Listofuse_Device_data[index].mobileNumber.toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
              Text(shared.Listofuse_Device_data[index].clientName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
              Text(shared.Listofuse_Device_data[index].clientType.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.Listofuse_Device_data[index].deviceStatus.toString()))),
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
