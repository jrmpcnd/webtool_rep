import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/dropdown.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Failedenrollment extends StatefulWidget {
  const Failedenrollment({Key? key}) : super(key: key);

  @override
  State<Failedenrollment> createState() => _FailedenrollmentState();
}

class _FailedenrollmentState extends State<Failedenrollment> {
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared7 = Provider.of<Prov7>(context, listen: false);
    shared7.failed.clear();
    FailedParse httpParse = FailedParse();
    var res7 = await httpParse.profile7();
    if (res7.data!.isNotEmpty) {
      print(res7.data!.length);
      print(res7.data![0].toJson().length);
      setState(() {
        shared7.failed.add(Failed_Enrollment.fromJson(res7.toJson()));
        isLoaded = true;
      });
      for (var i in res7.data!) {
        shared7.failed_data.add(Data7.fromJson(i.toJson()));
      }
    }
    for (var i in shared7.failed_data) {
      print(i.toJson());
    }
  }

  List<String> res = [];
  String init = '';
  FieldEnrollmentList_Api dropdownFunction = FieldEnrollmentList_Api();
  void initState() {
    getList();
  }

  getList() async {
    List<dynamic> dlist = await dropdownFunction.getStatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_fel_clienttype_dropdown']);
      });
    }
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        wait();
      });
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov7>(context);
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
                            hintext: "Birthday",
                          ),
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
                                hintext: "Account Number",
                              ),
                              verticalSpaceTiny,
                              textfield(
                                hintext: "Mobile Number",
                              ),
                              verticalSpaceTiny,
                              textfield(
                                hintext: "Error Message",
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
                    width: double.infinity,
                    padding: kEdgeInsetsVerticalNormal,
                    child: PaginatedDataTable(
                      key: key,
                      arrowHeadColor: kWhiteColor,
                      columns: [
                        DataColumn(
                            label: Text('Date & Time',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Account Number',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Date of Birth',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Mobile Number',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Client Type',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label:
                                Text('Device ID', style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Device Model',
                                style: kLargeBoldTextStyle)),
                        DataColumn(
                            label: Text('Error Message',
                                style: kLargeBoldTextStyle))
                      ],
                      source: isLoaded
                          ? shared.failed_data.isNotEmpty
                              ? data
                              : data2
                          : data3,
                      rowsPerPage: 8,
                      showFirstLastButtons: true,
                      header: Text('Failed Enrollment List',
                          style: kXLargeBoldTextStyle),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  Prov7 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.failed_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].createdDate.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].accountNumber.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].dateOfBirth.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].mobileNumber.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].clientType.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].deviceId.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].deviceModel.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.failed_data[index].errorMessage.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
