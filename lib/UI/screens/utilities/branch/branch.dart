import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import 'package:webtool_rep/UI/utils/functions.dart';
import 'package:webtool_rep/UI/utils/model2.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/textfield.dart';

class Branch extends StatefulWidget {
  const Branch({Key? key}) : super(key: key);

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  TextEditingController branch_code_controller = TextEditingController();
  TextEditingController branch_desc_controller = TextEditingController();
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Branch_U>(context, listen: false);
    shared.Branch_data.clear();
    Branch_Parse branch = Branch_Parse();
    var res = await branch.profile24();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.BranchLog.add(Branch_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.Branch_data.add(Branch_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Branch_data) {
      print(i.toJson());
    }
  }


  @override
  void initState() {
    Branch_Function.branch(branch_code: '', branch_desc: '');
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Branch_U>(context);
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
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textfield(
                        hintext: "Code",
                        controller: branch_code_controller,
                      ),
                      verticalSpaceTiny,
                      textfield(
                        hintext: "Description",
                        controller: branch_desc_controller,
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
                                    Branch_Function.branch(
                                      branch_code: branch_code_controller.text,
                                      branch_desc: branch_desc_controller.text,
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
                            isLoaded = false;
                          });
                          //
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.Branch_data.clear();
                              for (var i in shared.BranchLog[0].data!) {
                                print(i.toJson());
                                print(i.branchCode
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.branchCode!.toLowerCase().contains(
                                      controller.text.toLowerCase()) ||
                                      i.createdDate!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.branchDesc!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.branchCode!.toLowerCase().contains(
                                          controller.text.toLowerCase()))



                                  {

                                    debugPrint(i.branchCode);
                                    setState(() {
                                      shared.Branch_data.add(
                                          Branch_Log.fromJson(i.toJson()));
                                    });
                                    if (shared.Branch_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.Branch_data.clear();
                              setState(() {
                                shared.Branch_data.addAll(
                                    shared.BranchLog[0].data!);
                                isLoaded = true;
                              });
                            }
                            debugPrint(
                                shared.Branch_data[0].toJson().toString());
                          } catch (e) {
                            shared.Branch_data.clear();
                            isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.Branch_data.clear();
                              for (var i in shared.BranchLog[0].data!) {
                                print(i.toJson());
                                print(i.branchCode
        ?.toLowerCase()
        .contains(controller.text.toLowerCase()));
    if (i.toJson().isNotEmpty) {
    if (i.branchCode!.toLowerCase().contains(
    controller.text.toLowerCase()) ||
    i.createdDate!.toLowerCase().contains(
    controller.text.toLowerCase()) ||
    i.branchDesc!.toLowerCase().contains(
    controller.text.toLowerCase()) ||
    i.branchCode!.toLowerCase().contains(
    controller.text.toLowerCase()))

    debugPrint(i.branchCode);
                                    setState(() {
                                      key.currentState?.pageTo(0);
                                      shared.Branch_data.add(
                                          Branch_Log.fromJson(i.toJson()));
                                    });
                                    if (shared.Branch_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }

                            } else if (controller.text == '') {
                              shared.Branch_data.clear();
                              setState(() {
                                shared.Branch_data.addAll(
                                    shared.BranchLog[0].data!);
                              });
                            }
                            debugPrint(
                                shared.Branch_data[0].toJson().toString());
                          } catch (e) {
                            shared.Branch_data.clear();
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
                              label: Text('Code',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Description',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Create Date',)
                          )

                        ],
                        source: isLoaded
                            ? shared.Branch_data.isNotEmpty
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
  Branch_U shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Branch_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Branch_data[index].branchCode.toString()))),
      DataCell(SizedBox(
          width: 200,
          child:
          Text(shared.Branch_data[index].branchDesc.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Branch_data[index].createdDate.toString()))),

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
    ]);
  }
}