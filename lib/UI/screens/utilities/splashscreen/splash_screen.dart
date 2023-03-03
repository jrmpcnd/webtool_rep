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

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared15 = Provider.of<Prov21>(context, listen: false);
    shared15.splash.clear();
    shared15.splash_data.clear();
    Splash_ScreenParse httpParse16 = Splash_ScreenParse();
    var res16 = await httpParse16.profile21();
    if (res16.data!.isNotEmpty) {
      print(res16.data!.length);
      print(res16.data![0].toJson().length);
      setState(() {
        shared15.splash.add(Splash_Screen.fromJson(res16.toJson()));
        isLoaded = true;
      });
      for (var i in res16.data!) {
        setState(() {});
        shared15.splash_data.add(Data21.fromJson(i.toJson()));
      }
    }
    for (var i in shared15.splash_data) {
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
    final shared = Provider.of<Prov21>(context);
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
                        hintext: "Action",
                      ),
                      verticalSpaceTiny,
                      textfield(
                        hintext: "Title",
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
                              shared.splash_data.clear();
                              for (var i in shared.splash[0].data!) {
                                print(i.toJson());
                                print(i.action
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.action!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.title!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.action);
                                    setState(() {
                                      shared.splash_data
                                          .add(Data21.fromJson(i.toJson()));
                                    });
                                    if (shared.splash_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.splash_data.clear();
                              setState(() {
                                shared.splash_data
                                    .addAll(shared.splash[0].data!);
                                isLoaded = true;
                              });
                            }
                            debugPrint(
                                shared.splash_data[0].toJson().toString());
                          } catch (e) {
                            shared.splash_data.clear();
                            isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.splash_data.clear();
                              for (var i in shared.splash[0].data!) {
                                print(i.toJson());
                                print(i.action
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.action!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.title!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.action);
                                    setState(() {
                                      shared.splash_data
                                          .add(Data21.fromJson(i.toJson()));
                                    });
                                    if (shared.splash_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.splash_data.clear();
                              setState(() {
                                shared.splash_data
                                    .addAll(shared.splash[0].data!);
                              });
                            }
                            debugPrint(
                                shared.splash_data[0].toJson().toString());
                          } catch (e) {
                            shared.splash_data.clear();
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
                                label:
                                    Text('Action', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label:
                                    Text('Title', style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Message',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Sub Message',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Image URL',
                                    style: kLargeBoldTextStyle)),
                            DataColumn(
                                label: Text('Show', style: kLargeBoldTextStyle))
                          ],
                          source: isLoaded
                              ? shared.splash_data.isNotEmpty
                                  ? data
                                  : data2
                              : data3,
                          rowsPerPage: 8,
                          showFirstLastButtons: true,
                          header: Text('Splash Screen List',
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
  Prov21 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.splash_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.splash_data[index].action.toString()))),
      DataCell(SizedBox(
          width: 150, child: Text(shared.splash_data[index].title.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.splash_data[index].message.toString()))),
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.splash_data[index].subMessage.toString()))),
      DataCell(SizedBox(
          width: 50,
          child: Text(shared.splash_data[index].imageUrl.toString()))),
      DataCell(SizedBox(
          width: 150, child: Text(shared.splash_data[index].show.toString())))
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
