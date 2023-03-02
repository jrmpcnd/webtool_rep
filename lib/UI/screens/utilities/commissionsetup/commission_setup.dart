import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/tables.dart';
import '../../../widgets/textfield.dart';

class Commissionsetup extends StatefulWidget {
  const Commissionsetup({Key? key}) : super(key: key);

  @override
  State<Commissionsetup> createState() => _CommissionsetupState();
}

class _CommissionsetupState extends State<Commissionsetup> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared15 = Provider.of<Prov18>(context, listen: false);
    shared15.commission.clear();
    shared15.commission_data.clear();
    Commission_SetupParse httpParse16 = Commission_SetupParse();
    var res16 = await httpParse16.profile18();
    if (res16.data!.isNotEmpty) {
      print(res16.data!.length);
      print(res16.data![0].toJson().length);
      setState(() {
        shared15.commission.add(Commission_Setup.fromJson(res16.toJson()));
        isLoaded = true;
      });
      for (var i in res16.data!) {
        setState(() {});
        shared15.commission_data.add(Data18.fromJson(i.toJson()));
      }
    }
    for (var i in shared15.commission_data) {
      print(i.toJson());
    }
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov18>(context);
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
                        hintext: "Transaction Type",
                      ),
                      verticalSpaceTiny,
                      textfield(
                        hintext: "Commission Type",
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
                            isLoaded = false;
                          });
                          //
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.commission_data.clear();
                              for (var i in shared.commission[0].data!) {
                                print(i.toJson());
                                print(i.transType
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.commissionType!.toLowerCase().contains(
                                      controller.text.toLowerCase())) {
                                    debugPrint(i.transType);
                                    setState(() {
                                      shared.commission_data
                                          .add(Data18.fromJson(i.toJson()));
                                    });
                                    if (shared.commission_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.commission_data.clear();
                              setState(() {
                                shared.commission_data
                                    .addAll(shared.commission[0].data!);
                                isLoaded = true;
                              });
                            }
                            debugPrint(
                                shared.commission_data[0].toJson().toString());
                          } catch (e) {
                            shared.commission_data.clear();
                            isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.commission_data.clear();
                              for (var i in shared.commission[0].data!) {
                                print(i.toJson());
                                print(i.transType
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.commissionType!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase()))
                                    ;
                                  debugPrint(i.transType);
                                  setState(() {
                                    key.currentState?.pageTo(0);
                                    shared.commission_data
                                        .add(Data18.fromJson(i.toJson()));
                                  });
                                  if (shared.commission_data.isNotEmpty) {
                                    setState(() {
                                      isLoaded = true;
                                    });
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.commission_data.clear();
                              setState(() {
                                shared.commission_data
                                    .addAll(shared.commission[0].data!);
                              });
                            }
                            debugPrint(
                                shared.commission_data[0].toJson().toString());
                          } catch (e) {
                            shared.commission_data.clear();
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
                                label: Text('Transaction Type',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Commission Type',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Customer Income',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Agent Income',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Bank Income',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Bank Partner Income',
                                    style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.commission_data.isNotEmpty
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
  Prov18 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.commission_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 50,
          child: Text(shared.commission_data[index].transType.toString()))),
      DataCell(SizedBox(
          width: 150,
          child:
              Text(shared.commission_data[index].commissionType.toString()))),
      DataCell(SizedBox(
          width: 150,
          child:
              Text(shared.commission_data[index].customerIncome.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.commission_data[index].agentIncome.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.commission_data[index].bankIncome.toString()))),
      DataCell(SizedBox(
          width: 150,
          child:
              Text(shared.commission_data[index].bankPartnerIncome.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
