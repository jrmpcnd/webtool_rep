import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
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
  TextEditingController controller = TextEditingController();
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
    });
  }

  Widget build(BuildContext context) {
    final shared = Provider.of<Prov3>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        SizedBox(height: 10,),
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
                  shared.confirm_data.clear();
                  for (var i in shared.confirm[0].data!) {
                    print(i.toJson());
                    print(i.transDate
                        ?.toLowerCase()
                        .contains(controller.text.toLowerCase()));
                    if (i.toJson().isNotEmpty) {
                      if (i.transDesc!
                          .toLowerCase()
                          .contains(controller.text.toLowerCase()) ||
                          i.clientMobileNo!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())   ||
                          i.cid!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())    ||
                          i.clientName!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())  ||
                          i.branchDesc!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.unitDesc!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.centerDesc!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.note!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.status!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                      i.transDate!
                          .toLowerCase()
              .contains(controller.text.toLowerCase())

                      ) {
                        debugPrint(i.transDate);
                        setState(() {
                          shared.confirm_data.add(Data3.fromJson(i.toJson()
                          ));
                        });
                        if (shared.confirm_data.isNotEmpty) {
                          setState(() {
                            isLoaded = true;
                          });
                        }
                      }
                    }
                  }
                } else if (controller.text == '') {
                  shared.confirm_data.clear();
                  setState(() {
                    shared.confirm_data.addAll(shared.confirm[0].data!);
                    isLoaded = true;
                  });
                }
                debugPrint(shared.confirm_data[0].toJson().toString());
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
                if (controller.text.isNotEmpty) {
                  shared.confirm_data.clear();
                  for (var i in shared.confirm[0].data!) {
                    print(i.toJson());
                    print(i.transDate
                        ?.toLowerCase()
                        .contains(controller.text.toLowerCase()));
                    if (i.toJson().isNotEmpty) {
                      if (i.transDesc!
                          .toLowerCase()
                          .contains(controller.text.toLowerCase()) ||
                          i.clientMobileNo!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())   ||
                          i.cid!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())    ||
                          i.clientName!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())  ||
                          i.branchDesc!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.unitDesc!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.centerDesc!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.note!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                          i.status!
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())||
                      i.transDate!
                          .toLowerCase()
              .contains(controller.text.toLowerCase())
                      ) {
                        debugPrint (i.transDate);
                        setState(() {
                          key.currentState?.pageTo(0);
                          shared.confirm_data.add(Data3.fromJson(i.toJson()
                          ));

                        });
                        if (shared.confirm_data.isNotEmpty) {
                          setState(() {
                            isLoaded = true;
                          });
                        }
                      }
                    }
                  }
                } else if (controller.text == '') {
                  shared.confirm_data.clear();
                  setState(() {
                    shared.confirm_data.addAll(shared.confirm[0].data!);
                  });
                }
                debugPrint(shared.confirm_data[0].toJson().toString());
              } catch (e) {
                shared.confirm_data.clear();
              }
            },
          ),
        ),

        Padding(padding: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            padding: kEdgeInsetsVerticalNormal,
            child: PaginatedDataTable(
              key: key,
              dataRowHeight: 50,
              arrowHeadColor: kWhiteColor,
              columns: [
                DataColumn(label: Text('Date', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Transaction', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Mobile No.', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('CID', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Client Name', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Branch', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Unit', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Center', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Details', style: kLargeBoldTextStyle)),
                DataColumn(label: Text('Status', style: kLargeBoldTextStyle)),
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
            ),),
        ),


      ]
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
