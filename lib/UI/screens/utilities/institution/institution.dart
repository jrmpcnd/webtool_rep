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
import 'components/institution_delete.dart';
import 'components/intitution_edit.dart';

class Institution extends StatefulWidget {
  const Institution({Key? key}) : super(key: key);

  @override
  State<Institution> createState() => _InstitutionState();
}

class _InstitutionState extends State<Institution> {
  TextEditingController institution_code_controller = TextEditingController();
  TextEditingController institution_desc_controller = TextEditingController();
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  bool isCheck = false;
  Future<void> wait() async {
    final shared = Provider.of<Institution_U>(context, listen: false);
    shared.Institution_data.clear();
    Institution_Parse institution = Institution_Parse();
    var res = await institution.profile24();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.InstitutionLog.add(Institution_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.Institution_data.add(Institution_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Institution_data) {
      print(i.toJson());
    }
  }

  @override
  void initState() {
    Institution_Function.insti(insti_code: '', insti_desc: '');
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Institution_U>(context);
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
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'institution Code',
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
                          controller: institution_code_controller,
                        ),
                      ),
                      verticalSpaceTiny,
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'institution Description',
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
                          controller: institution_desc_controller,
                        ),
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
                                    try {
                                      if (institution_code_controller
                                          .text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Institution_data.clear();
                                        for (var i
                                            in shared.InstitutionLog[0].data!) {
                                          print(i.toJson());
                                          print(i.instCode
                                              ?.toLowerCase()
                                              .contains(
                                                  institution_code_controller
                                                      .text
                                                      .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.instCode!.toLowerCase().contains(
                                                    institution_code_controller
                                                        .text
                                                        .toLowerCase()) &&
                                                i.instDesc!.toLowerCase().contains(
                                                    institution_desc_controller
                                                        .text
                                                        .toLowerCase())) {
                                              debugPrint(i.instCode);
                                              setState(() {
                                                shared.Institution_data.add(
                                                    Institution_Log.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared.Institution_data
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
                                      if (institution_desc_controller
                                          .text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Institution_data.clear();
                                        for (var i
                                            in shared.InstitutionLog[0].data!) {
                                          print(i.toJson());
                                          print(i.instDesc
                                              ?.toLowerCase()
                                              .contains(
                                                  institution_desc_controller
                                                      .text
                                                      .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.instDesc!.toLowerCase().contains(
                                                    institution_desc_controller
                                                        .text
                                                        .toLowerCase()) &&
                                                i.instCode!.toLowerCase().contains(
                                                    institution_code_controller
                                                        .text
                                                        .toLowerCase())) {
                                              debugPrint(i.instCode);
                                              setState(() {
                                                shared.Institution_data.add(
                                                    Institution_Log.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared.Institution_data
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
                                      debugPrint(shared.Institution_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.Institution_data.clear();
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
                                    institution_desc_controller.clear();
                                    institution_code_controller.clear();
                                    shared.Institution_data.clear();
                                    setState(() {
                                      shared.Institution_data.addAll(
                                          shared.InstitutionLog[0].data!);
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
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () {
                                setState(() {
                                  shared.isChecked = false;
                                  shared.Institution_data.removeAt(0);
                                });
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
                              label: Text(
                            'Create Date',
                          )),
                          DataColumn(
                              label: Text(
                            'Action',
                          )),
                          DataColumn(
                              label: Text(
                            'Delete',
                          ))
                        ],
                        source: isLoaded
                            ? shared.Institution_data.isNotEmpty
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
  late String get_insti_code = '';
  late String get_insti_desc = '';
  late String get_insti_id = '';

  BuildContext? dashboardContext;
  Institution_U shared;
  Future<void> wait() async {
    shared.Institution_data.clear();
    Institution_Parse provider = Institution_Parse();
    var res = await provider.profile24();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      shared.InstitutionLog.add(Institution_Api.fromJson(res.toJson()));
      shared.isLoaded = true;
      for (var i in res.data!) {
        shared.Institution_data.add(Institution_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Institution_data) {
      print(i.toJson());
    }
  }

  MyData({required this.shared, this.dashboardContext});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Institution_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Institution_data[index].instCode.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Institution_data[index].instDesc.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Institution_data[index].createdDate.toString()))),
      DataCell(SizedBox(
        width: 50,
        child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            showDialog(
              context: dashboardContext!,
              builder: (ctx) => Form(
                key: _formKey,
                child: InstitutionEditFunction(
                  code1: shared.Institution_data[index].instCode.toString(),
                  date1: shared.Institution_data[index].createdDate.toString(),
                  desc1: shared.Institution_data[index].instDesc.toString(),
                ),
              ),
            );
          },
        ),
      )),
      const DataCell(SizedBox(width: 50, child: InstitutionDeleteFunction())),
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
    ]);
  }
}
