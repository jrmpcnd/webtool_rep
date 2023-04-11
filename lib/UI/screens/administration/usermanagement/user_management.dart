import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Usermanagement extends StatefulWidget {
  const Usermanagement({Key? key}) : super(key: key);

  @override
  State<Usermanagement> createState() => _UsermanagementState();
}

class _UsermanagementState extends State<Usermanagement> {
  List<String> res = [];
  String init = '';
  Usermanagementdropdown_Api dropdownstatus = Usermanagementdropdown_Api();
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
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
      getCenter();
    });
  }

  getCenter() async {
    List<dynamic> dlist = await dropdownstatus.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_um_userstatus_dropdown']);
      });
    }
    setState(() {
      init = res[0];
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    spreadRadius: 1,
                    blurRadius: 1,
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
                                  hintText: 'First Name',
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
                                  hintText: 'Middle Name',
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
                            SizedBox(
                              height: 35.0,
                              width: 400,
                              child: TextFormField(
                                style: kTextStyle,
                                decoration: const InputDecoration(
                                  hintText: 'Last Name',
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
                                controller: controller3,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                            onPressed: () {
                              try {
                                if (controller1
                                        .text.isNotEmpty &&
                                    controller2.text.isNotEmpty &&
                                    controller3.text.isNotEmpty &&
                                    controller4.text.isNotEmpty&&
                                init.toString().isNotEmpty) {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  shared.user_data.clear();
                                  for (var i in shared.user[0].data!) {
                                    print(i.toJson());
                                    print(i.userLogin?.toLowerCase().contains(
                                        controller4.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (init.toLowerCase().contains(
                                          'inactive')) {
                                        if (i.userLogin!.toLowerCase().contains(
                                            controller4.text.toLowerCase()) ||
                                            i.lastName!.toLowerCase().contains(
                                                controller3.text
                                                    .toLowerCase()) ||
                                            i.middleName!
                                                .toLowerCase()
                                                .contains(
                                                controller2.text
                                                    .toLowerCase()) ||
                                            i.givenName!.toLowerCase().contains(
                                                controller1.text
                                                    .toLowerCase()) ||
                                            i.checkStatus!
                                                .toLowerCase()
                                                .contains(init)) {
                                          debugPrint(i.userLogin);
                                          setState(() {
                                            shared.user_data
                                                .add(
                                                Data2.fromJson(i.toJson()));
                                          });
                                          if (shared.user_data.isNotEmpty) {
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
                                      if(!init.toLowerCase().contains('inactive')){
                                        if (i.userLogin!.toLowerCase().contains(
                                            controller4.text.toLowerCase()) ||
                                            i.lastName!.toLowerCase().contains(
                                                controller3.text
                                                    .toLowerCase()) ||
                                            i.middleName!
                                                .toLowerCase()
                                                .contains(
                                                controller2.text
                                                    .toLowerCase()) ||
                                            i.givenName!.toLowerCase().contains(
                                                controller1.text
                                                    .toLowerCase())) {
                                          debugPrint(i.userLogin);
                                          setState(() {
                                            shared.user_data
                                                .add(
                                                Data2.fromJson(i.toJson()));
                                          });
                                          if (shared.user_data.isNotEmpty) {
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
                                }
                                if(init.isNotEmpty) {
                                  if(init.toLowerCase().contains('inactive')){
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    shared.user_data.clear();
                                    for (var i in shared.user[0].data!) {
                                      print(i.toJson());
                                      print(i.userLogin?.toLowerCase().contains(
                                          controller4.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.checkStatus!.toLowerCase().contains(
                                           init.toLowerCase())) {
                                          debugPrint(i.userLogin);
                                          setState(() {
                                            shared.user_data
                                                .add(Data2.fromJson(i.toJson()));
                                          });
                                          if (shared.user_data.isNotEmpty) {
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
                                  if(!init.toLowerCase().contains('inactive')){
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    shared.user_data.clear();
                                    for (var i in shared.user[0].data!) {
                                      print(i.toJson());
                                      print(i.userLogin?.toLowerCase().contains(
                                          controller4.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (!i.checkStatus!.toLowerCase().contains(
                                            init.toLowerCase())) {
                                          debugPrint(i.userLogin);
                                          setState(() {
                                            shared.user_data
                                                .add(Data2.fromJson(i.toJson()));
                                          });
                                          if (shared.user_data.isNotEmpty) {
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
                                }
                                if (controller1.text.isNotEmpty) {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  shared.user_data.clear();
                                  for (var i in shared.user[0].data!) {
                                    print(i.toJson());
                                    print(i.userLogin?.toLowerCase().contains(
                                        controller4.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (i.givenName!.toLowerCase().contains(
                                          controller1.text.toLowerCase())) {
                                        debugPrint(i.userLogin);
                                        setState(() {
                                          shared.user_data
                                              .add(Data2.fromJson(i.toJson()));
                                        });
                                        if (shared.user_data.isNotEmpty) {
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
                                  shared.user_data.clear();
                                  for (var i in shared.user[0].data!) {
                                    print(i.toJson());
                                    print(i.userLogin?.toLowerCase().contains(
                                        controller4.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (i.middleName!.toLowerCase().contains(
                                          controller2.text.toLowerCase())) {
                                        debugPrint(i.userLogin);
                                        setState(() {
                                          shared.user_data
                                              .add(Data2.fromJson(i.toJson()));
                                        });
                                        if (shared.user_data.isNotEmpty) {
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
                                if (controller3.text.isNotEmpty) {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  shared.user_data.clear();
                                  for (var i in shared.user[0].data!) {
                                    print(i.toJson());
                                    print(i.userLogin?.toLowerCase().contains(
                                        controller4.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (i.lastName!.toLowerCase().contains(
                                          controller3.text.toLowerCase())) {
                                        debugPrint(i.userLogin);
                                        setState(() {
                                          shared.user_data
                                              .add(Data2.fromJson(i.toJson()));
                                        });
                                        if (shared.user_data.isNotEmpty) {
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
                                if (controller4.text.isNotEmpty) {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  shared.user_data.clear();
                                  for (var i in shared.user[0].data!) {
                                    print(i.toJson());
                                    print(i.userLogin?.toLowerCase().contains(
                                        controller4.text.toLowerCase()));
                                    if (i.toJson().isNotEmpty) {
                                      if (i.userLogin!.toLowerCase().contains(
                                          controller4.text.toLowerCase())) {
                                        debugPrint(i.userLogin);
                                        setState(() {
                                          shared.user_data
                                              .add(Data2.fromJson(i.toJson()));
                                        });
                                        if (shared.user_data.isNotEmpty) {
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
                                /*else if (controller4.text == '') {
                                  shared.user_data.clear();
                                  setState(() {
                                    shared.user_data
                                        .addAll(shared.user[0].data!);
                                    isLoaded = true;
                                  });
                                }*/
                                debugPrint(
                                    shared.user_data[0].toJson().toString());
                              } catch (e) {
                                shared.user_data.clear();
                                isLoaded = true;
                              }
                              print(shared.user_data);
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
                              controller1.clear();
                              controller2.clear();
                              controller3.clear();
                              controller4.clear();
                              shared.user_data.clear();
                              setState(() {
                                shared.user_data.addAll(shared.user[0].data!);
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
                horizontalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.0,
                          width: 400,
                          child: TextFormField(
                            style: kTextStyle,
                            decoration: const InputDecoration(
                              hintText: 'User Name',
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
                            controller: controller4,
                            onEditingComplete: () async {},
                          ),
                        ),
                        verticalSpaceTiny,
                        elevatedbuttonpopup(label: "Branch", width: 400.0),
                        verticalSpaceTiny,
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
                        verticalSpaceMedium,
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpaceRegular,
          Container(
            padding: kEdgeInsetsVerticalNormal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
                Container(
                    width: double.infinity,
                    padding: kEdgeInsetsVerticalNormal,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        cardColor: Color(0xFF6F8A71),
                      ),
                      child: PaginatedDataTable(
                        key: key,
                        dataRowHeight: 300,
                        arrowHeadColor: kWhiteColor,
                        columns: [
                          DataColumn(
                              label: Text('User Name',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Given Name',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Middle Name',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Last Name',
                                  style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Branch', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label: Text('Role', style: kLargeBoldTextStyle)),
                          DataColumn(
                              label:
                                  Text('Status', style: kLargeBoldTextStyle)),
                        ],
                        source: isLoaded
                            ? shared.user_data.isNotEmpty
                                ? data
                                : data2
                            : data3,
                        rowsPerPage: 8,
                        showFirstLastButtons: true,
                        header:
                            Text('List of User', style: kXLargeBoldTextStyle),
                      ),
                    )),
              ],
            ),
          ),
        ])),
      ]),
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
