import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/tables.dart';
import '../../../widgets/textfield.dart';

class Productcategory extends StatefulWidget {
  const Productcategory({Key? key}) : super(key: key);

  @override
  State<Productcategory> createState() => _ProductcategoryState();
}

class _ProductcategoryState extends State<Productcategory> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared15 = Provider.of<Prov15>(context, listen: false);
    shared15.category.clear();
    shared15.category_data.clear();
    Product_CategoryParse httpParse15 = Product_CategoryParse();
    var res15 = await httpParse15.profile15();
    if (res15.data!.isNotEmpty) {
      print(res15.data!.length);
      print(res15.data![0].toJson().length);
      setState(() {
        shared15.category.add(Product_Category.fromJson(res15.toJson()));
        isLoaded = true;
      });
      for (var i in res15.data!) {
        setState(() {});
        shared15.category_data.add(Data15.fromJson(i.toJson()));
      }
    }
    for (var i in shared15.category_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  List<String> res2 = [];
  String init = '';
  String init2 = '';
  ProductCategory_Api dropdownFunction = ProductCategory_Api();
  ProductCategory_ProductType_Api dropdownStatus =
      ProductCategory_ProductType_Api();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait();
    });
    getList();
    getCategory();
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

  getCategory() async {
    List<dynamic> dlist = await dropdownStatus.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res2.add(i['get_pc_producttype_dropdown']);
      });
    }
    setState(() {
      init2 = res2[0];
    });
    print("safgsdgsdgsdfgde $res2");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov15>(context);
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
                          textfield(
                            hintext: "Product Category ID",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Product Category Name",
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
                      horizontalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                              DropdownButton(
                                value: init2,
                                items: res2.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e,
                                        style: TextStyle(color: Colors.black)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    init2 = value.toString();
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
                              shared.category_data.clear();
                              for (var i in shared.category[0].data!) {
                                print(i.toJson());
                                print(i.providerName
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.productTypeName!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.productCategoryId!
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase()) ||
                                      i.productCategoryName!
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase())) {
                                    debugPrint(i.providerName);
                                    setState(() {
                                      shared.category_data
                                          .add(Data15.fromJson(i.toJson()));
                                    });
                                    if (shared.category_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.category_data.clear();
                              setState(() {
                                shared.category_data
                                    .addAll(shared.category[0].data!);
                                isLoaded = true;
                              });
                            }
                            debugPrint(
                                shared.category_data[0].toJson().toString());
                          } catch (e) {
                            shared.category_data.clear();
                            isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.category_data.clear();
                              for (var i in shared.category[0].data!) {
                                print(i.toJson());
                                print(i.providerName
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.productTypeName!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.productCategoryId!
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase()) ||
                                      i.productCategoryName!
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase())) ;
                                  debugPrint(i.providerName);
                                  setState(() {
                                    key.currentState?.pageTo(0);
                                    shared.category_data
                                        .add(Data15.fromJson(i.toJson()));
                                  });
                                  if (shared.category_data.isNotEmpty) {
                                    setState(() {
                                      isLoaded = true;
                                    });
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.category_data.clear();
                              setState(() {
                                shared.category_data
                                    .addAll(shared.category[0].data!);
                              });
                            }
                            debugPrint(
                                shared.category_data[0].toJson().toString());
                          } catch (e) {
                            shared.category_data.clear();
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
                                    Text('Status', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.category_data.isNotEmpty
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
  Prov15 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.category_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 50,
          child: Text(shared.category_data[index].providerName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.category_data[index].productTypeName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child:
              Text(shared.category_data[index].productCategoryId.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(
              shared.category_data[index].productCategoryName.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.category_data[index].status.toString())))
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
