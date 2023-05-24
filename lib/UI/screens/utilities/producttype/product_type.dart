import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/utilities/institution/components/instiAPI.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import 'package:http/http.dart' as http;
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import 'components/producttype_delete.dart';

class Producttype extends StatefulWidget {
  const Producttype({Key? key}) : super(key: key);

  @override
  State<Producttype> createState() => _ProducttypeState();
}

class _ProducttypeState extends State<Producttype> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool static = false;
  bool isLoaded = false;

  Future<void> wait() async {
    final shared14 = Provider.of<Prov14>(context, listen: false);
    shared14.product.clear();
    shared14.product_data.clear();
    Product_TypeParse httpParse14 = Product_TypeParse();
    var res14 = await httpParse14.profile14();
    if (res14.data!.isNotEmpty) {
      print(res14.data!.length);
      print(res14.data![0].toJson().length);
      setState(() {
        shared14.product.add(Product_Type.fromJson(res14.toJson()));
        isLoaded = true;
      });
      for (var i in res14.data!) {
        setState(() {});
        shared14.product_data.add(Data14.fromJson(i.toJson()));
      }
      for (int i = 0; i < shared14.product_data.length; i++) {
        shared14.isChecked.add(false);
      }
    }
    for (var i in shared14.product_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  String init = '';
  ProductType_Api dropdownFunction = ProductType_Api();
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
        res.add(i['get_pt_provider_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  @override
  Widget build(BuildContext context) {
    DeleteProducttype deleteproducttype = DeleteProducttype();
    final shared = Provider.of<Prov14>(context);
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
                  height: 200.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'Product type ID',
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
                      verticalSpaceTiny,
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'Product type Name',
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
                      verticalSpaceTiny,
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
                                      if (controller1.text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.product_data.clear();
                                        for (var i in shared.product[0].data!) {
                                          print(i.toJson());
                                          print(i.productTypeId
                                              ?.toLowerCase()
                                              .contains(controller1.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.productTypeId!
                                                    .toLowerCase()
                                                    .contains(controller1.text
                                                        .toLowerCase()) &&
                                                i.productTypeName!
                                                    .toLowerCase()
                                                    .contains(controller2.text
                                                        .toLowerCase())) {
                                              debugPrint(i.productTypeId);
                                              setState(() {
                                                shared.product_data.add(
                                                    Data14.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .product_data.isNotEmpty) {
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
                                        shared.product_data.clear();
                                        for (var i in shared.product[0].data!) {
                                          print(i.toJson());
                                          print(i.productTypeName
                                              ?.toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.productTypeName!
                                                    .toLowerCase()
                                                    .contains(controller2.text
                                                        .toLowerCase()) &&
                                                i.productTypeId!
                                                    .toLowerCase()
                                                    .contains(controller1.text
                                                        .toLowerCase())) {
                                              debugPrint(i.productTypeId);
                                              setState(() {
                                                shared.product_data.add(
                                                    Data14.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .product_data.isNotEmpty) {
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
                                      debugPrint(shared.product_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.product_data.clear();
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
                                    controller2.clear();
                                    controller1.clear();
                                    init = res[0];
                                    shared.product_data.clear();
                                    setState(() {
                                      shared.product_data
                                          .addAll(shared.product[0].data!);
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
                              onPressed: () async {
                                for (int i = 0;
                                    i < shared.product_data.length;
                                    i++) {
                                  if (shared.isChecked[i] == true) {
                                    http.Response response =
                                        await deleteproducttype
                                            .deleteproducttype(shared
                                                .product_data[i].productTypeId);
                                    print(jsonDecode(response.body)['message']);
                                    if (await jsonDecode(
                                            response.body)['message']
                                        .toString()
                                        .toLowerCase()
                                        .contains("Updated Successfully")) {
                                      if (shared.isChecked[i] == true) {
                                        shared.product_data.removeAt(i);
                                        isLoaded = false;
                                      }
                                    }
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    Future.delayed(
                                      Duration(seconds: 1),
                                      () {
                                        setState(() {
                                          isLoaded = true;
                                          if (response.statusCode == 200) {
                                            wait();
                                            shared.isChecked.clear();
                                          }
                                        });
                                      },
                                    );
                                  }
                                }
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
                          dataRowHeight: 50,
                          arrowHeadColor: kWhiteColor,
                          columns: [
                            DataColumn(
                                label: Text('Provider Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Product Type ID',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Product Type Name',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Description',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Status', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Delete', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.product_data.isNotEmpty
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
  Prov14 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.product_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.product_data[index].providerName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.product_data[index].productTypeId.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.product_data[index].productTypeName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.product_data[index].description.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.product_data[index].status.toString()))),
      DataCell(SizedBox(
          width: 50,
          child: ProducttypeDeleteFunction(
            index: index,
          ))),
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
    return const DataRow(cells: [
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
    return const DataRow(cells: [
      DataCell(SizedBox(child: Text('Loading Please wait!'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
