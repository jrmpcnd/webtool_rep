import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/constant.dart';
import 'package:webtool_rep/UI/utils/edge_insect.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import 'package:webtool_rep/UI/utils/spacing.dart';
import 'package:webtool_rep/UI/utils/text_styles.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';

class Rolemanagement extends StatefulWidget {
  const Rolemanagement({Key? key}) : super(key: key);

  @override
  State<Rolemanagement> createState() => _RolemanagementState();
}

class _RolemanagementState extends State<Rolemanagement> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Prov>(context, listen: false);
    shared.role.clear();
    Role_Parse httpParse = Role_Parse();
    var res = await httpParse.profile();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.role.add(Role_Management.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.role_data.add(Data.fromJson(i.toJson()));
      }
    }
    for (var i in shared.role_data) {
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
    final shared = Provider.of<Prov>(context);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 35.0,
                              width: 400,
                              child: TextFormField(
                                style: kTextStyle,
                                decoration: const InputDecoration(
                                  hintText: 'Role Management',
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
                              ),
                            ),
                            verticalSpaceTiny,
                            // DropdownButton(value: init,items: res.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                            //   setState(() {
                            //     init = value.toString();
                            //   });
                            // },),
                            verticalSpaceSmall,
                            Row(
                              children: [
                                SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(kPrimaryColor)),
                                   onPressed: (){
                                      try{
                                        if (controller.text.isNotEmpty) {
                                          setState(() {
                                            isLoaded = false;
                                          });
                                          shared.role_data.clear();
                                          for (var i in shared.role[0].data!) {
                                            print(i.toJson());
                                            print(i.role_name?.toLowerCase().contains(
                                                controller.text.toLowerCase()));
                                            if (i.toJson().isNotEmpty) {
                                              if (i.role_name!.toLowerCase().contains(
                                                  controller.text.toLowerCase())) {
                                                debugPrint(i.role_name);
                                                setState(() {
                                                  shared.role_data
                                                      .add(Data.fromJson(i.toJson()));
                                                });
                                                if (shared.role_data.isNotEmpty) {
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
                                            shared.role_data[0].toJson().toString());
                                      }catch (e) {
                                        shared.role_data.clear();
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
                                      controller.clear();
                                      shared.role_data.clear();
                                      setState(() {
                                        shared.role_data.addAll(shared.role[0].data!);
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
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(cardColor: Color(0xFF6F8A71),),


                child: PaginatedDataTable(
                  key: key,
                  arrowHeadColor: kWhiteColor,
                  columns: [
                    DataColumn(
                        label: Text('Role Name', style: kLargeBoldTextStyle)),
                    DataColumn(
                        label: Text('Role Desc', style: kLargeBoldTextStyle))
                  ],
                  source: isLoaded
                      ? shared.role_data.isNotEmpty
                          ? data
                          : data2
                      : data3,
                  rowsPerPage: 8,
                  showFirstLastButtons: true,
                  header: Text('List of Role', style: kXLargeBoldTextStyle),
                ),
              )),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.role_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 500,
          child: Text(shared.role_data[index].role_name.toString()))),
      DataCell(SizedBox(
          width: 500,
          child: Text(shared.role_data[index].role_desc.toString())))
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
    ]);
  }
}
