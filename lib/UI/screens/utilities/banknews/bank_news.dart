import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api2.dart';
import 'package:webtool_rep/UI/utils/functions.dart';
import '../../../../core/providers/Provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model2.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Banknews extends StatefulWidget {
  const Banknews({Key? key}) : super(key: key);

  @override
  State<Banknews> createState() => _BanknewsState();
}

class _BanknewsState extends State<Banknews> {
  bool static = false;
  bool isLoaded = false;
  TextEditingController bank_newscontroller = TextEditingController();
  TextEditingController controller = TextEditingController();
  Future<void> wait() async {
    final shared = Provider.of<Banknews_U>(context, listen: false);
    shared.BanknewsLog.clear();
    BanksNews_Parse banksnews = BanksNews_Parse();

    var res = await banksnews.profile21();
    print(res.toJson());
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      setState(() {
        shared.BanknewsLog.add(BankNews_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        // shared.inqqq.add(Data.fromJson(i.toJson()));
        shared.Banknews_data.add(BankNews_Log.fromJson(i.toJson()));

      }
    } else{
      setState(() {
        isLoaded = true;
      });
    }
    for (var i in shared.Banknews_data) {
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
    final shared = Provider.of<Banknews_U>(context);
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
                        hintext: "Topic",
                        controller: bank_newscontroller,
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
                                    Banknews_Function.news(
                                        search_banknews:
                                            bank_newscontroller.text);
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
                          shared.Banknews_data.clear();
                          for (var i in shared.BanknewsLog[0].data!) {
                            print(i.toJson());
                            print(i.givenName
                                ?.toLowerCase()
                                .contains(controller.text.toLowerCase()));
                            if (i.toJson().isNotEmpty) {
                              if (i.givenName!
                                  .toLowerCase()
                                  .contains(controller.text.toLowerCase()) ||
                                  i.productDate!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())   ||
                                  i.productId!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())    ||
                                  i.productName!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())



                              ) {
                                debugPrint(i.productName);
                                setState(() {
                                  shared.Banknews_data.add(BankNews_Log.fromJson(i.toJson()
                                  ));
                                });
                                if (shared.Banknews_data.isNotEmpty) {
                                  setState(() {
                                    isLoaded = true;
                                  });
                                }
                              }
                            }
                          }
                        } else if (controller.text == '') {
                          shared.Banknews_data.clear();
                          setState(() {
                            shared.Banknews_data.addAll(shared.BanknewsLog[0].data!);
                            isLoaded = true;
                          });
                        }
                        debugPrint(shared.Banknews_data[0].toJson().toString());
                      } catch (e) {
                        shared.Banknews_data.clear();
                        isLoaded = true;
                      }
                    },
                    onEditingComplete: () async {
                      setState(() {
                        isLoaded = false;
                      });
                      try {
                        if (controller.text.isNotEmpty) {
                          shared.Banknews_data.clear();
                          for (var i in shared.BanknewsLog[0].data!) {
                            print(i.toJson());
                            print(i.givenName
                                ?.toLowerCase()
                                .contains(controller.text.toLowerCase()));
                            if (i.toJson().isNotEmpty) {
                              if (i.givenName!
                                  .toLowerCase()
                                  .contains(controller.text.toLowerCase()) ||
                                  i.productDate!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())   ||
                                  i.productId!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())    ||
                                  i.productName!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase())




                              ) {
                                debugPrint (i.productName);
                                setState(() {
                                  key.currentState?.pageTo(0);
                                  shared.Banknews_data.add(BankNews_Log.fromJson(i.toJson()
                                  ));

                                });
                                if (shared.Banknews_data.isNotEmpty) {
                                  setState(() {
                                    isLoaded = true;
                                  });
                                }
                              }
                            }
                          }
                        } else if (controller.text == '') {
                          shared.Banknews_data.clear();
                          setState(() {
                            shared.Banknews_data.addAll(shared.BanknewsLog[0].data!);
                          });
                        }
                        debugPrint(shared.Banknews_data[0].toJson().toString());
                      } catch (e) {
                        shared.Banknews_data.clear();
                      }
                    },
                  ),
                ), Container(
                  width: double.infinity,
                  padding: kEdgeInsetsVerticalNormal,
                  child: PaginatedDataTable(
                    key: key,
                    arrowHeadColor: kWhiteColor,
                    columns: [
                      DataColumn(
                          label: Text('Date', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Sender', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Topic', style: kLargeBoldTextStyle)),

                    ],
                    source: isLoaded ? shared.Banknews_data.isNotEmpty ? data : data2 : data3,
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
  Banknews_U shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Banknews_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100, child: Text(shared.Banknews_data[index].productDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Banknews_data[index].givenName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Banknews_data[index].productName.toString()))),


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

