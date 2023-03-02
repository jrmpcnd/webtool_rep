import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import 'package:webtool_rep/UI/utils/functions.dart';
import 'package:webtool_rep/UI/utils/model2.dart';
import '../../../../core/providers/Provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/textfield.dart';

class Productandservices extends StatefulWidget {
  const Productandservices({Key? key}) : super(key: key);

  @override
  State<Productandservices> createState() => _ProductandservicesState();
}

class _ProductandservicesState extends State<Productandservices> {
  TextEditingController product_servicescontroller = TextEditingController();
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<ProductandServices_U>(context, listen: false);
    shared.ProductandServicesLog.clear();
    ProductandServices_Parse productandservices = ProductandServices_Parse();

    var res = await productandservices.profile22();
    print(res.toJson());
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      setState(() {
        shared.ProductandServicesLog.add(ProductandServices_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        // shared.inqqq.add(Data.fromJson(i.toJson()));
        shared.ProductandServices_data.add(ProductandServices_Log.fromJson(i.toJson()));

      }
    } else{
      setState(() {
        isLoaded = true;
      });
    }
    for (var i in shared.ProductandServices_data) {
      print(i.toJson());
    }
  }
  @override
  void initState(){
    super.initState();
    wait();
  }
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<ProductandServices_U>(context);
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
                  height: 110.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textfield(
                        hintext: "Name",
                        controller: product_servicescontroller,
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
                                    Productandservices_Function.product(
                                        search_productservices:
                                            product_servicescontroller.text);
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
                Column(children: [Container(
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
                          shared.ProductandServices_data.clear();
                          for (var i in shared.ProductandServicesLog[0].data!) {
                            print(i.toJson());
                            print(i.serviceDescription
                                ?.toLowerCase()
                                .contains(controller.text.toLowerCase()));
                            if (i.toJson().isNotEmpty) {
                              if (i.serviceDescription!
                                  .toLowerCase()
                                  .contains(controller.text.toLowerCase()) ||
                                  i.serviceId!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())   ||
                                  i.serviceName!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())    ||
                                  i.show!.toString() == controller.text



                              ) {
                                debugPrint(i.serviceName);
                                setState(() {
                                  shared.ProductandServices_data.add(ProductandServices_Log.fromJson(i.toJson()
                                  ));
                                });
                                if (shared.ProductandServices_data.isNotEmpty) {
                                  setState(() {
                                    isLoaded = true;
                                  });
                                }
                              }
                            }
                          }
                        } else if (controller.text == '') {
                          shared.ProductandServices_data.clear();
                          setState(() {
                            shared.ProductandServices_data.addAll(shared.ProductandServicesLog[0].data!);
                            isLoaded = true;
                          });
                        }
                        debugPrint(shared.ProductandServices_data[0].toJson().toString());
                      } catch (e) {
                        shared.ProductandServices_data.clear();
                        isLoaded = true;
                      }
                    },
                    onEditingComplete: () async {
                      setState(() {
                        isLoaded = false;
                      });
                      try {
                        if (controller.text.isNotEmpty) {
                          shared.ProductandServices_data.clear();
                          for (var i in shared.ProductandServicesLog[0].data!) {
                            print(i.toJson());
                            print(i.serviceDescription
                                ?.toLowerCase()
                                .contains(controller.text.toLowerCase()));
                            if (i.toJson().isNotEmpty) {
                              if (i.serviceDescription!
                                  .toLowerCase()
                                  .contains(controller.text.toLowerCase()) ||
                                  i.serviceId!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())   ||
                                  i.serviceName!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())    ||
                                  i.show!.toString() == controller.text


                              ) {
                                debugPrint (i.serviceName);
                                setState(() {
                                  key.currentState?.pageTo(0);
                                  shared.ProductandServices_data.add(ProductandServices_Log.fromJson(i.toJson()
                                  ));

                                });
                                if (shared.ProductandServices_data.isNotEmpty) {
                                  setState(() {
                                    isLoaded = true;
                                  });
                                }
                              }
                            }
                          }
                        } else if (controller.text == '') {
                          shared.ProductandServices_data.clear();
                          setState(() {
                            shared.ProductandServices_data.addAll(shared.ProductandServicesLog[0].data!);
                          });
                        }
                        debugPrint(shared.ProductandServices_data[0].toJson().toString());
                      } catch (e) {
                        shared.ProductandServices_data.clear();
                      }
                    },
                  ),
                ), Container(
                  width: double.infinity,
                  padding: kEdgeInsetsVerticalNormal,
                  child: PaginatedDataTable(
                    dataRowHeight: 200,
                    key: key,
                    arrowHeadColor: kWhiteColor,
                    columns: [
                      DataColumn(
                          label: Text('Name', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Description', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Show', style: kLargeBoldTextStyle)),

                    ],
                    source: isLoaded ? shared.ProductandServices_data.isNotEmpty ? data : data2 : data3,
                    rowsPerPage: 8,
                    showFirstLastButtons: true,
                    header: Text('List of Role', style: kXLargeBoldTextStyle),
                  ),
                ),],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class MyData extends DataTableSource {
  ProductandServices_U shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.ProductandServices_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100, child: Text(shared.ProductandServices_data[index].serviceName.toString()))),
      DataCell(SizedBox(
          width: 400, child: Text(shared.ProductandServices_data[index].serviceDescription.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.ProductandServices_data[index].show.toString()))),


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
      DataCell(
          SizedBox(child: Text('Loading, please wait'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),




    ]);
  }
}

