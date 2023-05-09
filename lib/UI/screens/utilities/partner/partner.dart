import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/tables.dart';
import '../../../widgets/textfield.dart';

class Partner extends StatefulWidget {
  const Partner({Key? key}) : super(key: key);

  @override
  State<Partner> createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared15 = Provider.of<Prov20>(context, listen: false);
    shared15.partner.clear();
    shared15.partner_data.clear();
    Partner_listParse httpParse16 = Partner_listParse();
    var res16 = await httpParse16.profile20();
    if (res16.data!.isNotEmpty) {
      print(res16.data!.length);
      print(res16.data![0].toJson().length);
      setState(() {
        shared15.partner.add(Partner_List.fromJson(res16.toJson()));
        isLoaded = true;
      });
      for (var i in res16.data!) {
        setState(() {});
        shared15.partner_data.add(Data20.fromJson(i.toJson()));
      }
    }
    for (var i in shared15.partner_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  String init = '';
  Partner_Api dropdownFunction = Partner_Api();
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
        res.add(i['get_p_status_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov20>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
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
                          offset: const Offset(0, 3)),
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
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                hintText: 'Partner ID',
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
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                hintText: 'Partner Desc',
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
                                      if (controller.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.partner_data.clear();
                                        for (var i in shared.partner[0].data!) {
                                          print(i.toJson());
                                          print(i.partnerId
                                              ?.toLowerCase()
                                              .contains(controller.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.partnerId!
                                                .toLowerCase()
                                                .contains(controller.text
                                                    .toLowerCase())) {
                                              debugPrint(i.partnerId);
                                              setState(() {
                                                shared.partner_data.add(
                                                    Data20.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .partner_data.isNotEmpty) {
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
                                      if (controller1.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.partner_data.clear();
                                        for (var i in shared.partner[0].data!) {
                                          print(i.toJson());
                                          print(i.partnerDesc
                                              ?.toLowerCase()
                                              .contains(controller1.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.partnerDesc!
                                                .toLowerCase()
                                                .contains(controller1.text
                                                    .toLowerCase())) {
                                              debugPrint(i.partnerDesc);
                                              setState(() {
                                                shared.partner_data.add(
                                                    Data20.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .partner_data.isNotEmpty) {
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
                                        shared.partner_data.clear();
                                        for (var i in shared.partner[0].data!) {
                                          print(i.toJson());
                                          print(i.partnerName
                                              ?.toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.partnerName!
                                                .toLowerCase()
                                                .contains(controller2.text
                                                    .toLowerCase())) {
                                              debugPrint(i.partnerName);
                                              setState(() {
                                                shared.partner_data.add(
                                                    Data20.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .partner_data.isNotEmpty) {
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
                                      debugPrint(shared.partner_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.partner_data.clear();
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
                                    controller1.clear();
                                    controller.clear();
                                    controller2.clear();
                                    shared.partner_data.clear();
                                    setState(() {
                                      shared.partner_data
                                          .addAll(shared.partner[0].data!);
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 35.0,
                                width: 400,
                                child: TextFormField(
                                  style: kTextStyle,
                                  decoration: const InputDecoration(
                                    hintText: 'Partner Name',
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
                                label: Text('Partner ID',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Partner Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Partner Desc',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Partner Account',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Partner API URL',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Merchant Payment Callback URL',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Merchant ID Prefix',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('MRI Group',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Status', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.partner_data.isNotEmpty
                                  ? data
                                  : data2
                              : data3,
                          rowsPerPage: 8,
                          showFirstLastButtons: true,
                          header: Text('Product Type List',
                              style: kXLargeBoldTextStyle),
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
  Prov20 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.partner_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].partnerId.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].partnerName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].partnerDesc.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].partnerAccount.toString()))),
      DataCell(SizedBox(
          width: 50,
          child: Text(shared.partner_data[index].partnerApiUrl.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].merchantPaymentCallbackUrl
              .toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].merchantIdPrefix.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].mriGroup.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.partner_data[index].status.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
