import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/textfield.dart';

class Parameters extends StatefulWidget {
  const Parameters({Key? key}) : super(key: key);

  @override
  State<Parameters> createState() => _ParametersState();
}

class _ParametersState extends State<Parameters> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared2 = Provider.of<Prov13>(context, listen: false);
    shared2.prov.clear();
    shared2.prov_data.clear();
    Prov_ConfigParse httpParse2 = Prov_ConfigParse();
    var res2 = await httpParse2.profile13();
    if (res2.data!.isNotEmpty) {
      print(res2.data!.length);
      print(res2.data![0].toJson().length);
      setState(() {
        shared2.prov.add(Prov_Config.fromJson(res2.toJson()));
        isLoaded = true;
      });
      for (var i in res2.data!) {
        setState(() {});
        shared2.prov_data.add(Data13.fromJson(i.toJson()));
      }
    }
    for (var i in shared2.prov_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  String init = '';
  Parameter_Api dropdownFunction = Parameter_Api();
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
        res.add(i['get_pc_parametertype_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov13>(context);
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          verticalSpaceTiny,
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              style: kTextStyle,
                              decoration: const InputDecoration(
                                hintText: 'Parameter Name',
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
                                    shared.prov_data.clear();
                                    for (var i in shared.prov[0].data!) {
                                      print(i.toJson());
                                      print(i.paramName
                                          ?.toLowerCase()
                                          .contains(controller.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.paramName!
                                            .toLowerCase()
                                            .contains(controller.text.toLowerCase())

                                        ) {
                                          debugPrint(i.paramName);
                                          setState(() {
                                            shared.prov_data.add(Data13.fromJson(i.toJson()));
                                          });
                                          if (shared.prov_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller.text == '') {
                                    shared.prov_data.clear();
                                    setState(() {
                                      shared.prov_data.addAll(shared.prov[0].data!);
                                      isLoaded = true;
                                    });
                                  }
                                  debugPrint(shared.prov_data[0].toJson().toString());
                                } catch (e) {
                                  shared.prov_data.clear();
                                  isLoaded = true;
                                }
                              },
                              onEditingComplete: () async {
                                setState(() {
                                  isLoaded = false;
                                });
                                try {
                                  if (controller.text.isNotEmpty) {
                                    shared.prov_data.clear();
                                    for (var i in shared.prov[0].data!) {
                                      print(i.toJson());
                                      print(i.paramName
                                          ?.toLowerCase()
                                          .contains(controller.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.paramName!
                                            .toLowerCase()
                                            .contains(controller.text.toLowerCase()) ||
                                            i.paramName!
                                                .toLowerCase()
                                                .contains(controller.text.toLowerCase())) {
                                          debugPrint(i.paramName);
                                          setState(() {
                                            key.currentState?.pageTo(0);
                                            shared.prov_data.add(Data13.fromJson(i.toJson()));
                                          });
                                          if (shared.prov_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller.text == '') {
                                    shared.prov_data.clear();
                                    setState(() {
                                      shared.prov_data.addAll(shared.prov[0].data!);
                                    });
                                  }
                                  debugPrint(shared.prov_data[0].toJson().toString());
                                } catch (e) {
                                  shared.prov_data.clear();
                                }
                              },
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
                          dataRowHeight: 50,
                          arrowHeadColor: kWhiteColor,
                          columns: [
                            DataColumn(
                                label: Text('Parameter Type',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Parameter Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Parameter Value',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Description',
                                    style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.prov_data.isNotEmpty
                                  ? data
                                  : data2
                              : data3,
                          rowsPerPage: 8,
                          showFirstLastButtons: true,
                          header: Text(' List of Parameter Configuration',
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
  Prov13 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.prov_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 50, child: Text(shared.prov_data[index].appType.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.prov_data[index].paramName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.prov_data[index].paramValue.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.prov_data[index].paramDesc.toString())))
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
    ]);
  }
}
