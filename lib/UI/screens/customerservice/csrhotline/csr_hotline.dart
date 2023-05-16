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
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Csrhotline extends StatefulWidget {
  const Csrhotline({Key? key}) : super(key: key);

  @override
  State<Csrhotline> createState() => _CsrhotlineState();
}

class _CsrhotlineState extends State<Csrhotline> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared2 = Provider.of<Prov11>(context, listen: false);
    shared2.hotline.clear();
    CSR_HotlineParse httpParse2 = CSR_HotlineParse();
    var res2 = await httpParse2.profile11();
    if (res2.data!.isNotEmpty) {
      print(res2.data!.length);
      print(res2.data![0].toJson().length);
      setState(() {
        shared2.hotline.add(CSR_Hotline.fromJson(res2.toJson()));
        isLoaded = true;
      });
      for (var i in res2.data!) {
        setState(() {});
        shared2.hotline_data.add(Data11.fromJson(i.toJson()));
      }
    }
    for (var i in shared2.hotline_data) {
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

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov11>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Column(
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
                    style: TextStyle(color: kBlackColor),
                    decoration: const InputDecoration(
                      hintText: 'Contact Number',
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
                SizedBox(height: 5),
                SizedBox(
                  height: 35.0,
                  width: 400,
                  child: TextFormField(
                    style: TextStyle(color: kBlackColor),
                    decoration: const InputDecoration(
                      hintText: 'Network Provider',
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
                    controller: controller2,
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
                                    MaterialStateProperty.all(kPrimaryColor)),
                            onPressed: () {
                              try {
                                if (controller1.text.isNotEmpty) {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  shared.hotline_data.clear();
                                  for (var i in shared.hotline[0].data!) {
                                    print(i.toJson());
                                    print(i.contactNumber
                                        ?.toLowerCase()
                                        .contains(
                                            controller1.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (i.contactNumber!
                                              .toLowerCase()
                                              .contains(controller1.text
                                                  .toLowerCase()) &&
                                          i.networkProvider!
                                              .toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase())) {
                                        debugPrint(i.contactNumber);
                                        setState(() {
                                          shared.hotline_data
                                              .add(Data11.fromJson(i.toJson()));
                                        });
                                        if (shared.hotline_data.isNotEmpty) {
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
                                  shared.hotline_data.clear();
                                  for (var i in shared.hotline[0].data!) {
                                    print(i.toJson());
                                    print(i.networkProvider
                                        ?.toLowerCase()
                                        .contains(
                                            controller2.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (i.networkProvider!
                                              .toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase()) &&
                                          i.contactNumber!
                                              .toLowerCase()
                                              .contains(controller1.text
                                                  .toLowerCase())) {
                                        debugPrint(i.networkProvider);
                                        setState(() {
                                          shared.hotline_data
                                              .add(Data11.fromJson(i.toJson()));
                                        });
                                        if (shared.hotline_data.isNotEmpty) {
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
                                debugPrint(
                                    shared.hotline_data[0].toJson().toString());
                              } catch (e) {
                                shared.hotline_data.clear();
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
                                backgroundColor: MaterialStateProperty.all(
                                    kSecondaryColor2)),
                            onPressed: () {
                              setState(() {
                                isLoaded = false;
                              });
                              controller1.clear();
                              controller2.clear();
                              shared.hotline_data.clear();
                              setState(() {
                                shared.hotline_data
                                    .addAll(shared.hotline[0].data!);
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: Container(
                  width: double.infinity,
                  padding: kEdgeInsetsVerticalNormal,
                  child: PaginatedDataTable(
                    key: key,
                    dataRowHeight: 50,
                    arrowHeadColor: kWhiteColor,
                    columns: [
                      DataColumn(
                          label: Text('Contact Number',
                              style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Network Provider',
                              style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Institution Desc',
                              style: kLargeBoldTextStyle))
                    ],
                    source: isLoaded
                        ? shared.hotline_data.isNotEmpty
                            ? data
                            : data2
                        : data3,
                    rowsPerPage: 8,
                    showFirstLastButtons: true,
                    header: Text('Type Of Concern List',
                        style: kXLargeBoldTextStyle),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov11 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.hotline_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.hotline_data[index].contactNumber.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.hotline_data[index].networkProvider.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.hotline_data[index].instDesc.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
