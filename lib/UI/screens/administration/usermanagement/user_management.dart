import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/text_styles.dart';

class Usermanagement extends StatefulWidget {
  const Usermanagement({Key? key}) : super(key: key);

  @override
  State<Usermanagement> createState() => _UsermanagementState();
}

class _UsermanagementState extends State<Usermanagement> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared2 = Provider.of<Prov1>(context, listen: false);
    shared2.user.clear();
    UserParse httpParse2 = UserParse();
    var res2 = await httpParse2.profile2();
    if (res2.data!.isNotEmpty) {
      print(res2.data!.length);
      print(res2.data![0].toJson().length);
      setState(() {
        shared2.user.add(User_Management.fromJson(res2.toJson()));
        isLoaded = true;
      });
      for (var i in res2.data!) {
        setState(() {});
        shared2.user_data.add(Data2.fromJson(i.toJson()));
      }
    }
    for (var i in shared2.user_data) {
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
    final shared = Provider.of<Prov1>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Container(
      padding: kEdgeInsetsVerticalNormal,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: 500,
              //   child: TextFormField(
              //     style: TextStyle(color: kBlackColor),
              //     decoration: const InputDecoration(
              //       hintText: 'Search',
              //       border: OutlineInputBorder(),
              //       labelStyle: TextStyle(fontSize: 12.0),
              //       contentPadding: EdgeInsets.only(left: 10.0),
              //       hintStyle: TextStyle(color: kSecondaryColor2),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: kBlackColor),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: kBlackColor),
              //       ),
              //     ),
              //     textInputAction: TextInputAction.go,
              //     controller: controller,
              //     onChanged: (value) {
              //       setState(() {
              //         isLoaded = false;
              //       });
              //       try {
              //         if (controller.text.isNotEmpty) {
              //           shared.role_data.clear();
              //           for (var i in shared.role[0].data!) {
              //             print(i.toJson());
              //             print(i.role_name
              //                 ?.toLowerCase()
              //                 .contains(controller.text.toLowerCase()));
              //             if (i.toJson().isNotEmpty) {
              //               if (i.role_name!
              //                       .toLowerCase()
              //                       .contains(controller.text.toLowerCase()) ||
              //                   i.role_desc!
              //                       .toLowerCase()
              //                       .contains(controller.text.toLowerCase())) {
              //                 debugPrint(i.role_name);
              //                 setState(() {
              //                   shared.role_data.add(Data(
              //                       role_name: i.role_name,
              //                       role_desc: i.role_desc,
              //                       role_id: i.role_id));
              //                 });
              //                 if (shared.role_data.isNotEmpty) {
              //                   setState(() {
              //                     isLoaded = true;
              //                   });
              //                 }
              //               }
              //             }
              //           }
              //         } else if (controller.text == '') {
              //           shared.role_data.clear();
              //           setState(() {
              //             shared.role_data.addAll(shared.role[0].data!);
              //           });
              //         }
              //         debugPrint(shared.role_data[0].toJson().toString());
              //       } catch (e) {
              //         shared.role_data.clear();
              //       }
              //     },
              //     onEditingComplete: () async {
              //       setState(() {
              //         isLoaded = false;
              //       });
              //       try {
              //         if (controller.text.isNotEmpty) {
              //           shared.role_data.clear();
              //           for (var i in shared.role[0].data!) {
              //             print(i.toJson());
              //             print(i.role_name
              //                 ?.toLowerCase()
              //                 .contains(controller.text.toLowerCase()));
              //             if (i.toJson().isNotEmpty) {
              //               if (i.role_name!
              //                       .toLowerCase()
              //                       .contains(controller.text.toLowerCase()) ||
              //                   i.role_desc!
              //                       .toLowerCase()
              //                       .contains(controller.text.toLowerCase())) {
              //                 debugPrint(i.role_name);
              //                 setState(() {
              //                   key.currentState?.pageTo(0);
              //                   shared.role_data.add(Data(
              //                       role_name: i.role_name,
              //                       role_desc: i.role_desc,
              //                       role_id: i.role_id));
              //                 });
              //                 if (shared.role_data.isNotEmpty) {
              //                   setState(() {
              //                     isLoaded = true;
              //                   });
              //                 }
              //               }
              //             }
              //           }
              //         } else if (controller.text == '') {
              //           shared.role_data.clear();
              //           setState(() {
              //             shared.role_data.addAll(shared.role[0].data!);
              //           });
              //         }
              //         debugPrint(shared.role_data[0].toJson().toString());
              //       } catch (e) {
              //         shared.role_data.clear();
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
          Container(
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: PaginatedDataTable(
                key: key,
                dataRowHeight: 100,
                arrowHeadColor: kWhiteColor,
                columns: [
                  DataColumn(
                      label: Text('User Name', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Given Name', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Middle Name', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label: Text('Last Name', style: kLargeBoldTextStyle)),
                  DataColumn(label: Text('Branch', style: kLargeBoldTextStyle)),
                  DataColumn(label: Text('Role', style: kLargeBoldTextStyle)),
                  DataColumn(label: Text('Status', style: kLargeBoldTextStyle)),
                ],
                source: isLoaded
                    ? shared.user_data.isNotEmpty
                        ? data
                        : data2
                    : data3,
                rowsPerPage: 8,
                showFirstLastButtons: true,
                header: Text('List of User', style: kXLargeBoldTextStyle),
              )),
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
  Prov1 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.user_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.user_data[index].userLogin.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.user_data[index].givenName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.user_data[index].middleName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.user_data[index].lastName.toString()))),
      DataCell(SizedBox(
          width: 1800,
          child: Text(shared.user_data[index].branchNames.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.user_data[index].roles.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.user_data[index].checkStatus.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
    ]);
  }
}
