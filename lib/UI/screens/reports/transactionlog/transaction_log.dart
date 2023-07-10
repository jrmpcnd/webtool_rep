import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/model2.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import '../../../utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Transactionlogs extends StatefulWidget {
  const Transactionlogs({Key? key}) : super(key: key);

  @override
  State<Transactionlogs> createState() => _TransactionlogsState();
}

class _TransactionlogsState extends State<Transactionlogs> {
  bool isLoaded = false;
  List<String> res = [];
  String init = '';
  Transaction_Logs_Api dropdownFunction = Transaction_Logs_Api();
  @override
  void initState() {
    getList();
    wait();
  }
  Future<void> wait() async {
    final shared6 = Provider.of<Transaction_Log>(context, listen: false);
    shared6.transac_data.clear();
    Transaction_Logs_Parse httpParse = Transaction_Logs_Parse();
    var res6 = await httpParse.profile6();
    if (res6.data!.isNotEmpty) {
      print(res6.data!.length);
      print(res6.data![0].toJson().length);
      setState(() {
        shared6.transactionlogs.add(Transaction_log_Api.fromJson(res6.toJson()));
        isLoaded = true;
      });
      for (var i in res6.data!) {
        shared6.transac_data.add(Transaction_Logs.fromJson(i.toJson()));
      }
    }
    for (var i in shared6.transac_data) {
      print(i.toJson());
    }
  }
  getList()async{
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for(var i in dlist){
      setState(() {
        res.add(i['get_report_status_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Transaction_Log>(context);
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
                                    hinttext: "Submitted Date Start",
                                    onChange: (value) {},
                                  ),
                                  horizontalSpaceRegular,
                                  WebDatePicker(
                                    hinttext: "Submitted Date End",
                                    onChange: (value) {},
                                  ),
                                ],
                              ),
                              verticalSpaceTiny,
                              Row(
                                children: [
                                  WebDatePicker(
                                    hinttext: "Completed Date Start",
                                    onChange: (value) {},
                                  ),
                                  horizontalSpaceRegular,
                                  WebDatePicker(
                                    hinttext: "Completed Date End",
                                    onChange: (value) {},
                                  ),
                                ],
                              ),
                            ],
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
                                hintext: "Report ID",
                              ),
                              verticalSpaceTiny,
                              elevatedbuttonpopup(
                                  label: "Source Branch", width: 400.0),
                              verticalSpaceTiny,
                              textfield(
                                hintext: "Username",
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
                                    label: Text('Report ID',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Date Range',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('User Name',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Branch',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Role',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Submitted Data',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Completed Date',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Status',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Download',
                                        style: kLargeBoldTextStyle)),
                                DataColumn(
                                    label: Text('Completed Date',
                                        style: kLargeBoldTextStyle)),
                              ],
                              source: isLoaded
                                  ? shared.transac_data.isNotEmpty
                                  ? data
                                  : data2
                                  : data3,
                              rowsPerPage: 8,
                              showFirstLastButtons: true,
                              header: Container(
                                  height: 35,
                                  child: Text('List of User',
                                      style: kXLargeBoldTextStyle)),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MyData extends DataTableSource {
  Transaction_Log shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.transac_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child:
          Text(shared.transac_data[index].reportId.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.transac_data[index].submitedDate.toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
          Text(shared.transac_data[index].userName.toString()))),
      DataCell(SizedBox(
          width: 100,
          child:
          Text(shared.transac_data[index].branchDesc.toString()))),
      DataCell(SizedBox(
          width: 1800,
          child: Text(shared.transac_data[index].remark.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.transac_data[index].submitedDate.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(
              shared.transac_data[index].completedDate.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.transac_data[index].remark.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.transac_data[index].remark.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.transac_data[index].remark.toString())))
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
      DataCell(SizedBox(child: Text('Loading Please wait!'))),
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator()))),
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

