import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/tables.dart';
import '../../../widgets/textfield.dart';

class Loadproduct extends StatefulWidget {
  const Loadproduct({Key? key}) : super(key: key);

  @override
  State<Loadproduct> createState() => _LoadproductState();
}

class _LoadproductState extends State<Loadproduct> {
  TextEditingController controller = TextEditingController();
  TextEditingController load_id_controller = TextEditingController();
  TextEditingController load_product_controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared15 = Provider.of<Prov17>(context, listen: false);
    shared15.load.clear();
    shared15.load_data.clear();
    Load_ProductParse httpParse17 = Load_ProductParse();
    var res17 = await httpParse17.profile17();
    if (res17.data!.isNotEmpty) {
      print(res17.data!.length);
      print(res17.data![0].toJson().length);
      setState(() {
        shared15.load.add(Load_Product.fromJson(res17.toJson()));
        isLoaded = true;
      });
      for (var i in res17.data!) {
        setState(() {});
        shared15.load_data.add(Data17.fromJson(i.toJson()));
      }
    }
    for (var i in shared15.load_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  String init = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
    });
    getList();
  }

  LoadProduct_Api dropdownFunction = LoadProduct_Api();
  getList() async {
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_lp_productcategory_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov17>(context);
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
                  height: 220.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'Load Product ID',
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
                          controller: load_id_controller,
                        ),
                      ),
                      verticalSpaceTiny,
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: "Load Product Name",
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
                          controller: load_product_controller,
                        ),
                      ),
                      verticalSpaceSmall,
                      DropdownButton(
                        value: init,
                        items: res.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child:
                                Text(e, style: TextStyle(color: Colors.black)),
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
                                      if (load_id_controller.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.load_data.clear();
                                        for (var i in shared.load[0].data!) {
                                          print(i.toJson());
                                          print(i.productCategoryName
                                              ?.toLowerCase()
                                              .contains(load_id_controller.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.loadProductId!
                                                    .toLowerCase()
                                                    .contains(load_id_controller
                                                        .text
                                                        .toLowerCase()) ||
                                                i.loadProductName!
                                                    .toLowerCase()
                                                    .contains(load_id_controller
                                                        .text
                                                        .toLowerCase()) ||
                                                i.description!
                                                    .toLowerCase()
                                                    .contains(load_id_controller
                                                        .text
                                                        .toLowerCase()) ||
                                                i.status!
                                                    .toLowerCase()
                                                    .contains(load_id_controller
                                                        .text
                                                        .toLowerCase())) {
                                              debugPrint(i.productCategoryName);
                                              setState(() {
                                                shared.load_data.add(
                                                    Data17.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared.load_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      }
                                      if (load_product_controller
                                          .text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.load_data.clear();
                                        for (var i in shared.load[0].data!) {
                                          print(i.toJson());
                                          print(i.productCategoryName
                                              ?.toLowerCase()
                                              .contains(load_product_controller
                                                  .text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.loadProductId!
                                                    .toLowerCase()
                                                    .contains(
                                                        load_product_controller
                                                            .text
                                                            .toLowerCase()) ||
                                                i.loadProductName!
                                                    .toLowerCase()
                                                    .contains(
                                                        load_product_controller
                                                            .text
                                                            .toLowerCase()) ||
                                                i.description!
                                                    .toLowerCase()
                                                    .contains(
                                                        load_product_controller
                                                            .text
                                                            .toLowerCase()) ||
                                                i.status!
                                                    .toLowerCase()
                                                    .contains(
                                                        load_product_controller
                                                            .text
                                                            .toLowerCase())) {
                                              debugPrint(i.productCategoryName);
                                              setState(() {
                                                shared.load_data.add(
                                                    Data17.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared.load_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      }
                                      debugPrint(shared.load_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.load_data.clear();
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
                                    load_id_controller.clear();
                                    load_product_controller.clear();
                                    shared.load_data.clear();
                                    setState(() {
                                      shared.load_data
                                          .addAll(shared.load[0].data!);
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
                                label: Text('Product Category Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Load ID',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Load Product Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Description',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Status', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.load_data.isNotEmpty
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
  Prov17 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.load_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.load_data[index].productCategoryName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.load_data[index].loadProductId.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.load_data[index].loadProductName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.load_data[index].description.toString()))),
      DataCell(SizedBox(
          width: 150, child: Text(shared.load_data[index].status.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
