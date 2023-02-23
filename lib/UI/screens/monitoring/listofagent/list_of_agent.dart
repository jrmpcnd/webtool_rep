import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/dropdown.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Listofagent extends StatefulWidget {
  const Listofagent({Key? key}) : super(key: key);

  @override
  State<Listofagent> createState() => _ListofagentState();
}

class _ListofagentState extends State<Listofagent> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Prov8>(context, listen: false);
    shared.list_agent.clear();
    ListAgentParse httpParse = ListAgentParse();
    var res = await httpParse.profile8();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      print(res.data![0].toJson().length);
      setState(() {
        shared.list_agent.add(List_Agent.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        shared.list_agent_data.add(Data8.fromJson(i.toJson()));
      }
    }
    for (var i in shared.list_agent_data) {
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
    final shared = Provider.of<Prov8>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: 500,
          //       child: TextFormField(
          //         style: TextStyle(color: kBlackColor),
          //         decoration: const InputDecoration(
          //           hintText: 'Search',
          //           border: OutlineInputBorder(),
          //           labelStyle: TextStyle(fontSize: 12.0),
          //           contentPadding: EdgeInsets.only(left: 10.0),
          //           hintStyle: TextStyle(color: kSecondaryColor2),
          //           enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: kBlackColor),
          //           ),
          //           focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: kBlackColor),
          //           ),
          //         ),
          //         textInputAction: TextInputAction.go,
          //         controller: controller,
          //         onChanged: (value) {
          //           setState(() {
          //             isLoaded = false;
          //           });
          //           //
          //           try {
          //             if (controller.text.isNotEmpty) {
          //               shared.role_data.clear();
          //               for (var i in shared.role[0].data!) {
          //                 print(i.toJson());
          //                 print(i.role_name
          //                     ?.toLowerCase()
          //                     .contains(controller.text.toLowerCase()));
          //                 if (i.toJson().isNotEmpty) {
          //                   if (i.role_name!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase()) ||
          //                       i.role_desc!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase())) {
          //                     debugPrint(i.role_name);
          //                     setState(() {
          //                       shared.role_data.add(Data(
          //                           role_name: i.role_name,
          //                           role_desc: i.role_desc,
          //                           role_id: i.role_id));
          //                     });
          //                     if (shared.role_data.isNotEmpty) {
          //                       setState(() {
          //                         isLoaded = true;
          //                       });
          //                     }
          //                   }
          //                 }
          //               }
          //             } else if (controller.text == '') {
          //               shared.role_data.clear();
          //               setState(() {
          //                 shared.role_data.addAll(shared.role[0].data!);
          //                 isLoaded = true;
          //               });
          //             }
          //             debugPrint(shared.role_data[0].toJson().toString());
          //           } catch (e) {
          //             shared.role_data.clear();
          //             isLoaded = true;
          //           }
          //         },
          //         onEditingComplete: () async {
          //           setState(() {
          //             isLoaded = false;
          //           });
          //           try {
          //             if (controller.text.isNotEmpty) {
          //               shared.role_data.clear();
          //               for (var i in shared.role[0].data!) {
          //                 print(i.toJson());
          //                 print(i.role_name
          //                     ?.toLowerCase()
          //                     .contains(controller.text.toLowerCase()));
          //                 if (i.toJson().isNotEmpty) {
          //                   if (i.role_name!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase()) ||
          //                       i.role_desc!
          //                           .toLowerCase()
          //                           .contains(controller.text.toLowerCase())) {
          //                     debugPrint(i.role_name);
          //                     setState(() {
          //                       key.currentState?.pageTo(0);
          //                       shared.role_data.add(Data(
          //                           role_name: i.role_name,
          //                           role_desc: i.role_desc,
          //                           role_id: i.role_id));
          //                     });
          //                     if (shared.role_data.isNotEmpty) {
          //                       setState(() {
          //                         isLoaded = true;
          //                       });
          //                     }
          //                   }
          //                 }
          //               }
          //             } else if (controller.text == '') {
          //               shared.role_data.clear();
          //               setState(() {
          //                 shared.role_data.addAll(shared.role[0].data!);
          //               });
          //             }
          //             debugPrint(shared.role_data[0].toJson().toString());
          //           } catch (e) {
          //             shared.role_data.clear();
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // ),
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
                   shared.list_agent_data.clear();
                   for (var i in shared.list_agent[0].data!) {
                     print(i.toJson());
                     print(i.cBranchDesc
                         ?.toLowerCase()
                         .contains(controller.text.toLowerCase()));
                     if (i.toJson().isNotEmpty) {
                       if (i.cDateAndTime!
                           .toLowerCase()
                           .contains(controller.text.toLowerCase()) ||
                           i.iUserName!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())   ||
                           i.cCid!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())    ||
                           i.cFullname!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())  ||
                           i.cMobileNo!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())  ||
                           i.aInstDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())  ||
                           i.cBranchDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())||
                       i.cUnitDesc!
                           .toLowerCase()
               .contains(controller.text.toLowerCase())||
                           i.cCenterDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())






                       ) {
                         debugPrint(i.cCenterDesc);
                         setState(() {
                           shared.list_agent_data.add(Data8.fromJson(i.toJson()
                           ));
                         });
                         if (shared.list_agent_data.isNotEmpty) {
                           setState(() {
                             isLoaded = true;
                           });
                         }
                       }
                     }
                   }
                 } else if (controller.text == '') {
                   shared.list_agent_data.clear();
                   setState(() {
                     shared.list_agent_data.addAll(shared.list_agent[0].data!);
                     isLoaded = true;
                   });
                 }
                 debugPrint(shared.list_agent_data[0].toJson().toString());
               } catch (e) {
                 shared.list_agent_data.clear();
                 isLoaded = true;
               }
             },
             onEditingComplete: () async {
               setState(() {
                 isLoaded = false;
               });
               try {
                 if (controller.text.isNotEmpty) {
                   shared.list_agent_data.clear();
                   for (var i in shared.list_agent[0].data!) {
                     print(i.toJson());
                     print(i.cBranchDesc
                         ?.toLowerCase()
                         .contains(controller.text.toLowerCase()));
                     if (i.toJson().isNotEmpty) {
                       if (i.cDateAndTime!
                           .toLowerCase()
                           .contains(controller.text.toLowerCase()) ||
                           i.iUserName!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())   ||
                           i.cCid!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())    ||
                           i.cFullname!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())  ||
                           i.cMobileNo!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())  ||
                           i.aInstDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())  ||
                           i.cBranchDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())||
                           i.cUnitDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())||
                           i.cCenterDesc!
                               .toLowerCase()
                               .contains(controller.text.toLowerCase())



                       ) {
                         debugPrint (i.cCenterDesc);
                         setState(() {
                           key.currentState?.pageTo(0);
                           shared.list_agent_data.add(Data8.fromJson(i.toJson()
                           ));

                         });
                         if (shared.list_agent_data.isNotEmpty) {
                           setState(() {
                             isLoaded = true;
                           });
                         }
                       }
                     }
                   }
                 } else if (controller.text == '') {
                   shared.list_agent_data.clear();
                   setState(() {
                     shared.list_agent_data.addAll(shared.list_agent[0].data!);
                   });
                 }
                 debugPrint(shared.list_agent_data[0].toJson().toString());
               } catch (e) {
                 shared.list_agent_data.clear();
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
                     label: Text('Date & Time Enable Agent Feature',
                         style: kLargeBoldTextStyle)),
                 DataColumn(
                     label: Text('Enable By', style: kLargeBoldTextStyle)),
                 DataColumn(label: Text('CID', style: kLargeBoldTextStyle)),
                 DataColumn(
                     label: Text('Full Name', style: kLargeBoldTextStyle)),
                 DataColumn(
                     label: Text('Mobile No', style: kLargeBoldTextStyle)),
                 DataColumn(
                     label: Text('Institution', style: kLargeBoldTextStyle)),
                 DataColumn(label: Text('Branch', style: kLargeBoldTextStyle)),
                 DataColumn(label: Text('Unit', style: kLargeBoldTextStyle)),
                 DataColumn(label: Text('Center', style: kLargeBoldTextStyle))
               ],
               source: isLoaded
                   ? shared.list_agent_data.isNotEmpty
                   ? data
                   : data2
                   : data3,
               rowsPerPage: 8,
               showFirstLastButtons: true,
               header: Text('List of Role', style: kXLargeBoldTextStyle),
             )),],)
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => a.role_name
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(b.role_name.toString().toLowerCase()));
          //     },
          //     child: const Text('Role name ascending'),
          //   ),
          // ),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => b.role_name
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(a.role_name.toString().toLowerCase()));
          //       //print(shared.inqq.sort());
          //     },
          //     child: const Text('Role name descending'),
          //   ),
          // ),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => a.role_desc
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(b.role_desc.toString().toLowerCase()));
          //     },
          //     child: const Text('Role desc ascending'),
          //   ),
          // ),
          // SafeArea(
          //   child: TextButton(
          //     onPressed: () async {
          //       setState(() {});
          //       shared.inqqq.sort((a, b) => b.role_desc
          //           .toString()
          //           .toLowerCase()
          //           .compareTo(a.role_desc.toString().toLowerCase()));
          //     },
          //     child: const Text('Role desc descending'),
          //   ),
          // )
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov8 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.list_agent_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 150,
          child: Text(shared.list_agent_data[index].cDateAndTime.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].iUserName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cCid.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cFullname.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cMobileNo.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].aInstDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cBranchDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cUnitDesc.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.list_agent_data[index].cCenterDesc.toString())))
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
      DataCell(SizedBox(child: Text(''))),
      DataCell(SizedBox(child: Text(''))),
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
      DataCell(SizedBox(child: Text('Loading Please wait!'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
    ]);
  }
}
