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
import 'components/provider_edit.dart';

class Providers extends StatefulWidget {
  const Providers({Key? key}) : super(key: key);

  @override
  State<Providers> createState() => _ProvidersState();
}

class _ProvidersState extends State<Providers> {
  TextEditingController provider_code_controller = TextEditingController();
  TextEditingController provider_desc_controller = TextEditingController();
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Providers_U>(context, listen: false);
    shared.Providers_data.clear();
    Provider_Parse provider = Provider_Parse();
    var res = await provider.profile26();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.ProvidersLog.add(Providers_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.Providers_data.add(Providers_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Providers_data) {
      print(i.toJson());
    }
  }

  @override
  void initState() {
    Provider_Function.provider(provider_code: '', provider_desc: '');
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Providers_U>(context);
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
                            hintText: 'Provider ID',
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
                          controller: provider_code_controller,
                        ),
                      ),
                      verticalSpaceTiny,
                      SizedBox(
                        height: 35.0,
                        width: 400,
                        child: TextFormField(
                          style: kTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'Provider Name',
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
                          controller: provider_desc_controller,
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
                                      if (provider_code_controller
                                          .text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Providers_data.clear();
                                        for (var i
                                            in shared.ProvidersLog[0].data!) {
                                          print(i.toJson());
                                          print(i.id?.toLowerCase().contains(
                                              provider_code_controller.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.id!.toLowerCase().contains(
                                                    provider_code_controller
                                                        .text
                                                        .toLowerCase()) &&
                                                i.providerName!
                                                    .toLowerCase()
                                                    .contains(
                                                        provider_desc_controller
                                                            .text
                                                            .toLowerCase())) {
                                              debugPrint(i.id);
                                              setState(() {
                                                shared.Providers_data.add(
                                                    Providers_Log.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .Providers_data.isNotEmpty) {
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
                                      if (provider_desc_controller
                                          .text.isNotEmpty) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        shared.Providers_data.clear();
                                        for (var i
                                            in shared.ProvidersLog[0].data!) {
                                          print(i.toJson());
                                          print(i.providerName
                                              ?.toLowerCase()
                                              .contains(provider_desc_controller
                                                  .text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.providerName!
                                                    .toLowerCase()
                                                    .contains(
                                                        provider_desc_controller
                                                            .text
                                                            .toLowerCase()) &&
                                                i.id!.toLowerCase().contains(
                                                    provider_code_controller
                                                        .text
                                                        .toLowerCase())) {
                                              debugPrint(i.providerName);
                                              setState(() {
                                                shared.Providers_data.add(
                                                    Providers_Log.fromJson(
                                                        i.toJson()));
                                              });
                                              if (shared
                                                  .Providers_data.isNotEmpty) {
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
                                      debugPrint(shared.Providers_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.Providers_data.clear();
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
                                    controller.clear();
                                    provider_code_controller.clear();
                                    provider_desc_controller.clear();
                                    shared.Providers_data.clear();
                                    setState(() {
                                      shared.Providers_data.addAll(
                                          shared.ProvidersLog[0].data!);
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
                        dataRowHeight: 70,
                        arrowHeadColor: kWhiteColor,
                        columns: [
                          DataColumn(
                              label: Text('Provider ID',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Provider Name',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Description',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Provider Alias',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Status', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Action', style: kLargeBoldTextStyle)),
                        ],
                        source: isLoaded
                            ? shared.Providers_data.isNotEmpty
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
  late String get_provider_id = '';
  late String get_provider_name = '';
  late String get_description = '';
  late String get_provider_alias = '';

  BuildContext? dashboardContext;
  Providers_U shared;
  Future<void> wait() async {
    shared.Providers_data.clear();
    Provider_Parse provider = Provider_Parse();
    var res = await provider.profile26();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      shared.ProvidersLog.add(Providers_Api.fromJson(res.toJson()));
      shared.isLoaded = true;
      for (var i in res.data!) {
        shared.Providers_data.add(Providers_Log.fromJson(i.toJson()));
      }
    }
    for (var i in shared.Providers_data) {
      print(i.toJson());
    }
  }

  MyData({required this.shared, this.dashboardContext});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Providers_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 200, child: Text(shared.Providers_data[index].id.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Providers_data[index].providerName.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Providers_data[index].description.toString()))),
      DataCell(SizedBox(
          width: 200,
          child: Text(shared.Providers_data[index].providerAlias.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.Providers_data[index].status.toString()))),
      DataCell(SizedBox(
        width: 50,
        child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            showDialog(
              context: dashboardContext!,
              builder: (ctx) => Form(
                key: _formKey,
                child: ProviderEditFunction(
                  prov_id: shared.Providers_data[index].id.toString(),
                  prov_name:
                      shared.Providers_data[index].providerName.toString(),
                  prov_desc:
                      shared.Providers_data[index].description.toString(),
                  prov_alias:
                      shared.Providers_data[index].providerAlias.toString(),
                  prov_status: shared.Providers_data[index].status.toString(),
                ),
              ),
            );
          },
        ),
      )),
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
      DataCell(SizedBox(
          child: Center(
        child: CircularProgressIndicator(),
      ))),
    ]);
  }
}
