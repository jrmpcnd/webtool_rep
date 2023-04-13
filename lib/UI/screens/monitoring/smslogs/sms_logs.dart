import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/dropdown.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Smslogs extends StatefulWidget {
  const Smslogs({Key? key}) : super(key: key);

  @override
  State<Smslogs> createState() => _SmslogsState();
}

class _SmslogsState extends State<Smslogs> {
  List<String> res = [];
  List<String> res1 = [];
  String init = '';
  String init1 = '';
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  SMSLogs_Api dropdownInsti = SMSLogs_Api();
  SMSLogsStatus_Api dropdownUnit = SMSLogsStatus_Api();

  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared5 = Provider.of<Prov5>(context, listen: false);
    shared5.sms.clear();
    SmsParse httpParse5 = SmsParse();
    var res5 = await httpParse5.profile5();
    if (res5.data!.isNotEmpty) {
      print(res5.data!.length);
      print(res5.data![0].toJson().length);
      setState(() {
        shared5.sms.add(Sms_Logs.fromJson(res5.toJson()));
        isLoaded = true;
      });
      for (var i in res5.data!) {
        setState(() {});
        shared5.sms_data.add(Data5.fromJson(i.toJson()));
      }
    }
    for (var i in shared5.sms_data) {
      print(i.toJson());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
      getUnit();
      getList();
    });
  }

  getList() async {
    List<dynamic> dlist = await dropdownInsti.getStatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_sms_logs_smstype_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  getUnit() async {
    List<dynamic> dlist = await dropdownUnit.getStatus();
    for (var i in dlist) {
      setState(() {
        res1.add(i['get_sms_logs_smsstatus_dropdown']);
      });
    }
    setState(() {
      init1 = res1[0];
    });
    print("safgsdgsdgsdfgde $res1");
  }

  Widget build(BuildContext context) {
    final shared = Provider.of<Prov5>(context);
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
                  height: 320.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    shared.sms_data.clear();
                                    for (var i in shared.sms[0].data!) {
                                      print(i.toJson());
                                      print(i.cid?.toLowerCase().contains(
                                          controller.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.cid!.toLowerCase().contains(
                                                controller.text
                                                    .toLowerCase()) ||
                                            i.cid!.toLowerCase().contains(
                                                controller.text
                                                    .toLowerCase())) {
                                          debugPrint(i.cid);
                                          setState(() {
                                            shared.sms_data.add(
                                                Data5.fromJson(i.toJson()));
                                          });
                                          if (shared.sms_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller.text == '') {
                                    shared.sms_data.clear();
                                    setState(() {
                                      shared.sms_data
                                          .addAll(shared.sms[0].data!);
                                      isLoaded = true;
                                    });
                                  }
                                  debugPrint(
                                      shared.sms_data[0].toJson().toString());
                                } catch (e) {
                                  shared.sms_data.clear();
                                  isLoaded = true;
                                }
                              },
                              onEditingComplete: () async {
                                setState(() {
                                  isLoaded = false;
                                });
                                try {
                                  if (controller.text.isNotEmpty) {
                                    shared.sms_data.clear();
                                    for (var i in shared.sms[0].data!) {
                                      print(i.toJson());
                                      print(i.cid?.toLowerCase().contains(
                                          controller.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.cid!.toLowerCase().contains(controller.text.toLowerCase()) ||
                                            i.cid!.toLowerCase().contains(
                                                controller.text
                                                    .toLowerCase()) ||
                                            i.cid!.toLowerCase().contains(
                                                controller.text
                                                    .toLowerCase())) {
                                          debugPrint(i.cid);
                                          setState(() {
                                            key.currentState?.pageTo(0);
                                            shared.sms_data.add(
                                                Data5.fromJson(i.toJson()));
                                          });
                                          if (shared.sms_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller.text == '') {
                                    shared.sms_data.clear();
                                    setState(() {
                                      shared.sms_data
                                          .addAll(shared.sms[0].data!);
                                    });
                                  }
                                  debugPrint(
                                      shared.sms_data[0].toJson().toString());
                                } catch (e) {
                                  shared.sms_data.clear();
                                }
                              },
                            ),
                          ),
                          verticalSpaceTiny,
                          Row(
                            children: [
                              WebDatePicker(
                                hinttext: "Enroll Date Start",
                                onChange: (value) {},
                              ),
                             SizedBox(width: 17,),
                              WebDatePicker(
                                hinttext: "Activate Date Start",
                                onChange: (value) {},
                              ),
                              horizontalSpaceRegular,
                            ],
                          ),
                          verticalSpaceTiny,
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
                              onChanged: (value) {
                                setState(() {
                                  isLoaded = false;
                                });
                                try {
                                  if (controller1.text.isNotEmpty) {
                                    shared.sms_data.clear();
                                    for (var i in shared.sms[0].data!) {
                                      print(i.toJson());
                                      print(i.msisdn?.toLowerCase().contains(
                                          controller1.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.msisdn!.toLowerCase().contains(
                                            controller1.text.toLowerCase())) {
                                          debugPrint(i.msisdn);
                                          setState(() {
                                            shared.sms_data.add(
                                                Data5.fromJson(i.toJson()));
                                          });
                                          if (shared.sms_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller1.text == '') {
                                    shared.sms_data.clear();
                                    setState(() {
                                      shared.sms_data
                                          .addAll(shared.sms[0].data!);
                                      isLoaded = true;
                                    });
                                  }
                                  debugPrint(
                                      shared.sms_data[0].toJson().toString());
                                } catch (e) {
                                  shared.sms_data.clear();
                                  isLoaded = true;
                                }
                              },
                              onEditingComplete: () async {
                                setState(() {
                                  isLoaded = false;
                                });
                                try {
                                  if (controller1.text.isNotEmpty) {
                                    shared.sms_data.clear();
                                    for (var i in shared.sms[0].data!) {
                                      print(i.toJson());
                                      print(i.msisdn?.toLowerCase().contains(
                                          controller1.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.msisdn!.toLowerCase().contains(
                                                controller1.text
                                                    .toLowerCase()) ||
                                            i.msisdn!.toLowerCase().contains(
                                                controller1.text
                                                    .toLowerCase())) {
                                          debugPrint(i.msisdn);
                                          setState(() {
                                            key.currentState?.pageTo(0);
                                            shared.sms_data.add(
                                                Data5.fromJson(i.toJson()));
                                          });
                                          if (shared.sms_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller1.text == '') {
                                    shared.sms_data.clear();
                                    setState(() {
                                      shared.sms_data
                                          .addAll(shared.sms[0].data!);
                                    });
                                  }
                                  debugPrint(
                                      shared.sms_data[0].toJson().toString());
                                } catch (e) {
                                  shared.sms_data.clear();
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
                                BorderSide(color: Color(0xFF000000), width: 1),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
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
                                BorderSide(color: Color(0xFF000000), width: 1),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
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
                          verticalSpaceRegular,
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
                        ],
                      ),
                      horizontalSpaceMedium,
                    ],
                  ),
                ),
                verticalSpaceRegular,
                Container(
                  width: double.infinity,
                  padding: kEdgeInsetsVerticalNormal,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      cardColor: Color(0xFF6F8A71),
                    ),
                    child: PaginatedDataTable(
                      key: key,
                      dataRowHeight: 100,
                      arrowHeadColor: kWhiteColor,
                      columns: [
                        DataColumn(
                            label: Text('ID', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label:
                                Text('Date Time', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label:
                                Text('Mobile No.', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('CID', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Name', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Message', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Message Type',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Status', style: kLargeBoldTextStyle)),
                      ],
                      source: isLoaded
                          ? shared.sms_data.isNotEmpty
                              ? data
                              : data2
                          : data3,
                      rowsPerPage: 8,
                      showFirstLastButtons: true,
                      header:
                          Text('List of Sms Logs', style: kXLargeBoldTextStyle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov5 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.sms_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 50, child: Text(shared.sms_data[index].msgId.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.sms_data[index].msgSentDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].msisdn.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].cid.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].name.toString()))),
      DataCell(SizedBox(
          width: 500,
          child: Text(shared.sms_data[index].msgCommand.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].activity.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].msgStatus.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
