import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';
import '../../administration/hierarchy/hierarchy.dart';

class Transactionlog extends StatefulWidget {
  const Transactionlog({Key? key}) : super(key: key);

  @override
  State<Transactionlog> createState() => _TransactionlogState();
}

class _TransactionlogState extends State<Transactionlog> {
  List<String> res = [];
  List<String> res3 = [];
  List<String> res2 = [];
  String init = '';
  String init2 = '';
  TransactionLogs_Api dropdownStatus = TransactionLogs_Api();
  TransactionLogsStatus_Api dropdownFunction = TransactionLogsStatus_Api();
  TextEditingController controller = TextEditingController();

  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<TransactionProv>(context, listen: false);
    shared.inqq.clear();
    TransacLogParse_Api TransactParse = TransacLogParse_Api();
    var res = await TransactParse.profile();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.toJson());
      print(res.data![0].toJson().length);
      setState(() {
        // shared.inqq.add(Data2.fromJson(res.toJson()));
        shared.inqq.add(T_SavedAccounts.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        // shared.inqqq.add(Data.fromJson(i.toJson()));
        shared.inqqq.add(Data2.fromJson(i.toJson()));

      }
    }
    for (var i in shared.inqqq) {
      print(i.toJson());
    }
  }
  void initState() {
    wait();
    getList();
    getCategory();
  }
  getList()async{
    List<dynamic> dlist = await dropdownStatus.getStatus();
    for(var i in dlist){
      setState(() {
        res.add(i['get_transaction_logs_transaction_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  getCategory()async{
    List<dynamic> dlist = await dropdownFunction.getStatus();
    for(var i in dlist){
      setState(() {
        res2.add(i['get_transaction_logs_status_dropdown']);
      });
    }
    setState(() {
      init2 = res2[0];
    });
    print("safgsdgsdgsdfgde $res2");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<TransactionProv>(context);
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
                  height: 280.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textfield(
                            hintext: "Core ID",
                          ),
                          verticalSpaceTiny,
                          DropdownButton(value: init,items: res.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                            setState(() {
                              init = value.toString();
                            });
                          },),

                          verticalSpaceTiny,
                          textfield(
                            hintext: "Source CID",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Source Account",
                          ),
                          verticalSpaceTiny,
                          DropdownButton(value: init2,items: res2.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                            setState(() {
                              init2 = value.toString();
                            });
                          },),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              textfield(
                                hintext: "Mobile ID",
                              ),
                              verticalSpaceTiny,
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      WebDatePicker(
                                        hinttext: "Date Start",
                                        onChange: (value) {},
                                      ),
                                      horizontalSpaceRegular,
                                      WebDatePicker(
                                        hinttext: "Date End",
                                        onChange: (value) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              verticalSpaceTiny,
                              textfield(
                                hintext: "Target CID",
                              ),
                              verticalSpaceTiny,
                              textfield(
                                hintext: "Target Amount",
                              ),
                              verticalSpaceXLarge,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   width: 500,
                      //   child: TextFormField(
                      //     style: TextStyle(color: kBlackColor),
                      //     decoration: const InputDecoration(
                      //       hintText: 'Search',
                      //       border: OutlineInputBorder(),
                      //       labelStyle: TextStyle(fontSize: 12.0),
                      //       contentPadding: EdgeInsets.only(left: 10.0),
                      //       hintStyle: TextStyle(color: kSecondaryColor2),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kBlackColor),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kBlackColor),
                      //       ),
                      //     ),
                      //     textInputAction: TextInputAction.go,
                      //     controller: controller,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         isLoaded = false;
                      //       });
                      //       try {
                      //         if (controller.text.isNotEmpty) {
                      //           shared.inqqq.clear();
                      //           for (var i in shared.inqq[0].data!) {
                      //             print(i.toJson());
                      //             print(i.branch_code
                      //                 ?.toLowerCase()
                      //                 .contains(controller.text.toLowerCase()));
                      //             if (i.toJson().isNotEmpty) {
                      //               if (i.center_desc!
                      //                   .toLowerCase()
                      //                   .contains(controller.text.toLowerCase()) ||
                      //                   i.branch_code!
                      //                       .toLowerCase()
                      //                       .contains(controller.text.toLowerCase())) {
                      //                 debugPrint(i.center_desc);
                      //                 setState(() {
                      //                   shared.inqqq.add(Data1(
                      //                       // role_name: i.role_name,
                      //                   ));
                      //                 });
                      //                 if (shared.inqqq.isNotEmpty) {
                      //                   setState(() {
                      //                     isLoaded = true;
                      //                   });
                      //                 }
                      //               }
                      //             }
                      //           }
                      //         } else if (controller.text == '') {
                      //           shared.inqqq.clear();
                      //           setState(() {
                      //             shared.inqqq.addAll(shared.inqq[0].data!);
                      //           });
                      //         }
                      //         debugPrint(shared.inqqq[0].toJson().toString());
                      //       } catch (e) {
                      //         shared.inqqq.clear();
                      //       }
                      //     },
                      //     onEditingComplete: () async {
                      //       setState(() {
                      //         isLoaded = false;
                      //       });
                      //       try {
                      //         if (controller.text.isNotEmpty) {
                      //           shared.inqqq.clear();
                      //           for (var i in shared.inqq[0].data!) {
                      //             print(i.toJson());
                      //             print(i.unit_desc
                      //                 ?.toLowerCase()
                      //                 .contains(controller.text.toLowerCase()));
                      //             if (i.toJson().isNotEmpty) {
                      //               if (i.branch_desc!
                      //                   .toLowerCase()
                      //                   .contains(controller.text.toLowerCase()) ||
                      //                   i.center_desc!
                      //                       .toLowerCase()
                      //                       .contains(controller.text.toLowerCase())) {
                      //                 debugPrint(i.branch_code);
                      //                 setState(() {
                      //                   key.currentState?.pageTo(0);
                      //                   shared.inqqq.add(Data1(
                      //                     branch_code: i.branch_code,
                      //                     center_desc: i.center_desc,
                      //                     unit_desc: i.unit_desc,
                      //
                      //                       ));
                      //                 });
                      //                 if (shared.inqqq.isNotEmpty) {
                      //                   setState(() {
                      //                     isLoaded = true;
                      //                   });
                      //                 }
                      //               }
                      //             }
                      //           }
                      //         } else if (controller.text == '') {
                      //           shared.inqqq.clear();
                      //           setState(() {
                      //             shared.inqqq.addAll(shared.inqq[0].data!);
                      //           });
                      //         }
                      //         debugPrint(shared.inqqq[0].toJson().toString());
                      //       } catch (e) {
                      //         shared.inqqq.clear();
                      //       }
                      //     },
                      //   ),
                      // ),
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
                              label: Text('Mobile Ref ID', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Core Ref ID', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Remittance Ref ID', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Sender (GivenName\nMiddleName\nSurName', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Receiver (GivenName\nMiddleName\nSurName', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Amount', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Sender Mobile Number', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Date&Time Send', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Source Branch\n(Processed By)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Processed By Full Name\n(Member,Non-Member,Agent)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Date&Time\nReceive', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Target Branch\n(Disbursed By)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Disbursed By\nFullName\n(Agent,Mbo,Teller/Branch Teller)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Date&Time Cancelled', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Cancelled By Fullname\n(Member,Non-Member,Agent)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Status\n(Sent/Claimed/Cancelled)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Core Ref ID\n(Claimed/Cancelled)', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Mobile Ref ID\n(Claimed/Cancelled)', style: kLargeBoldTextStyle)),

                        ],
                        source: isLoaded ? shared.inqqq.isNotEmpty ? data : data2 : data3,
                        rowsPerPage: 8,
                        showFirstLastButtons: true,
                        header: Text('List of Role', style: kXLargeBoldTextStyle),
                      )),

                ],
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
  TransactionProv shared;
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
          width: 100, child: Text(shared.inqqq[index].mobileRefno.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].coreRefno.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].sourceBranch.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].sourceCid.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].sourceClientType.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].sourceAccountType.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].sourceAccount.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].sourceName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].targetBranch.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].targetCid.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].bankName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].targetClientType.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].targetAccountType.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].targetAccount.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].targetName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].transTypeCode.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].amount.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.inqqq[index].transAmountFee.toString()))),

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
      DataCell(
          SizedBox(child: Text('Loading, please wait'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),


    ]);
  }
}
