import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/dropdown.dart';
import '../../../../core/providers/Provider.dart';
import '../../../utils/api2.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model2.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';
import '../../administration/hierarchy/hierarchy.dart';

class Listofuseddevice extends StatefulWidget {
  const Listofuseddevice({Key? key}) : super(key: key);

  @override
  State<Listofuseddevice> createState() => _ListofuseddeviceState();
}

class _ListofuseddeviceState extends State<Listofuseddevice> {
  List<String> res = [];
  List<String> res2 = [];
  String init = '';
  String init2 = '';
  bool static = false;
  bool isLoaded = false;
  ListofUseDevice_Api dropdownFunction = ListofUseDevice_Api();
  ListofUseDeviceStatus_Api dropdownStatus = ListofUseDeviceStatus_Api();
  TextEditingController controller = TextEditingController();
  Future<void> wait() async {
    final shared = Provider.of<Listofuse_Device>(context, listen: false);
    shared.Listofuse_DeviceLog.clear();
    ListofUserDevice_Parse listofdevice = ListofUserDevice_Parse();
    var res = await listofdevice.profile7();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      setState(() {
        shared.Listofuse_DeviceLog.add(UseoflistDevice_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        // shared.inqqq.add(Data.fromJson(i.toJson()));
        shared.Listofuse_Device_data.add(UseoflistDevice_Log.fromJson(i.toJson()));

      }
    }
    for (var i in shared.Listofuse_Device_data) {
      print(i.toJson());
    }
  }


  void initState() {
    getList();
    getCathegory();
    wait();
  }
  getList()async{
    List<dynamic> dlist = await dropdownFunction.getStatus();
    for(var i in dlist){
      setState(() {
        res.add(i['get_lud_clientype_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  getCathegory()async{
    List<dynamic> dlist = await dropdownStatus.getStatus();
    for(var i in dlist){
      setState(() {
        res2.add(i['get_lud_status_dropdown']);
      });
    }
    setState(() {
      init2 = res2[0];
    });
    print("safgsdgsdgsdfgde $res2");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Listofuse_Device>(context);
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
                              Row(
                                children: [
                                  WebDatePicker(
                                    hinttext: "Start Sent Date",
                                    onChange: (value) {},
                                  ),
                                  horizontalSpaceRegular,
                                  WebDatePicker(
                                    hinttext: "End Sent Date",
                                    onChange: (value) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "CIF Number",
                          ),
                          verticalSpaceTiny,
                          DropdownButton(value: init,items: res.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                            setState(() {
                              init = value.toString();
                            });
                          },),
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
                            children: [
                              textfield(
                                hintext: "Device ID",
                              ),
                              verticalSpaceTiny,
                              textfield(
                                hintext: "Mobile Number",
                              ),
                              verticalSpaceTiny,
                              DropdownButton(value: init2,items: res2.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                                setState(() {
                                  init2 = value.toString();
                                });
                              },),

                              verticalSpaceMedium,
                            ],
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
                         shared.Listofuse_Device_data.clear();
                         for (var i in shared.Listofuse_DeviceLog[0].data!) {
                           print(i.toJson());
                           print(i.createdDate
                               ?.toLowerCase()
                               .contains(controller.text.toLowerCase()));
                           if (i.toJson().isNotEmpty) {
                             if (i.deviceId!
                                 .toLowerCase()
                                 .contains(controller.text.toLowerCase()) ||
                                 i.deviceModel!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())   ||
                                 i.androidVersion!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())    ||
                                 i.cid!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.branchCode!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.mobileNumber!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.clientName!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.clientType!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.deviceStatus!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())





                             ) {
                               debugPrint(i.branchCode);
                               setState(() {
                                 shared.Listofuse_Device_data.add(UseoflistDevice_Log.fromJson(i.toJson()
                                 ));
                               });
                               if (shared.Listofuse_Device_data.isNotEmpty) {
                                 setState(() {
                                   isLoaded = true;
                                 });
                               }
                             }
                           }
                         }
                       } else if (controller.text == '') {
                         shared.Listofuse_Device_data.clear();
                         setState(() {
                           shared.Listofuse_Device_data.addAll(shared.Listofuse_DeviceLog[0].data!);
                           isLoaded = true;
                         });
                       }
                       debugPrint(shared.Listofuse_Device_data[0].toJson().toString());
                     } catch (e) {
                       shared.Listofuse_Device_data.clear();
                       isLoaded = true;
                     }
                   },
                   onEditingComplete: () async {
                     setState(() {
                       isLoaded = false;
                     });
                     try {
                       if (controller.text.isNotEmpty) {
                         shared.Listofuse_Device_data.clear();
                         for (var i in shared.Listofuse_DeviceLog[0].data!) {
                           print(i.toJson());
                           print(i.createdDate
                               ?.toLowerCase()
                               .contains(controller.text.toLowerCase()));
                           if (i.toJson().isNotEmpty) {
                             if (i.deviceId!
                                 .toLowerCase()
                                 .contains(controller.text.toLowerCase()) ||
                                 i.deviceModel!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())   ||
                                 i.androidVersion!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())    ||
                                 i.cid!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.branchCode!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.mobileNumber!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.clientName!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.clientType!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())  ||
                                 i.deviceStatus!
                                     .toLowerCase()
                                     .contains(controller.text.toLowerCase())





                             ) {
                               debugPrint (i.branchCode);
                               setState(() {
                                 key.currentState?.pageTo(0);
                                 shared.Listofuse_Device_data.add(UseoflistDevice_Log.fromJson(i.toJson()
                                 ));

                               });
                               if (shared.Listofuse_Device_data.isNotEmpty) {
                                 setState(() {
                                   isLoaded = true;
                                 });
                               }
                             }
                           }
                         }
                       } else if (controller.text == '') {
                         shared.Listofuse_Device_data.clear();
                         setState(() {
                           shared.Listofuse_Device_data.addAll(shared.Listofuse_DeviceLog[0].data!);
                         });
                       }
                       debugPrint(shared.Listofuse_Device_data[0].toJson().toString());
                     } catch (e) {
                       shared.Listofuse_Device_data.clear();
                     }
                   },
                 ),
               ),
                 Container(
                 width: double.infinity,
                 padding: kEdgeInsetsVerticalNormal,
                 child: PaginatedDataTable(
                   key: key,
                   arrowHeadColor: kWhiteColor,
                   columns: [
                     DataColumn(
                         label: Text('Date & Time \nActivated', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Device ID', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Device Model', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Andriod\nVersion', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('CIF', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Branch', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Mobile Number', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Name of Customer', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Client Type\n(Member/NonMember', style: kLargeBoldTextStyle)),
                     DataColumn(
                         label: Text('Status\n(Used/Unused)', style: kLargeBoldTextStyle)),

                   ],
                   source: isLoaded ? shared.Listofuse_Device_data.isNotEmpty ? data : data2 : data3,
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
  Listofuse_Device shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Listofuse_Device_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].createdDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].deviceId.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].deviceModel.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].androidVersion.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].cid.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].branchCode.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].mobileNumber.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].clientName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].clientType.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Listofuse_Device_data[index].deviceStatus.toString()))),

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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),

      DataCell(SizedBox(child: Center(child: CircularProgressIndicator(),))),



    ]);
  }
}
