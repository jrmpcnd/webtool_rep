import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import '../../../utils/api.dart';
import '../../../utils/api2.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model2.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Remittancetransactionlog extends StatefulWidget {
  const Remittancetransactionlog({Key? key}) : super(key: key);

  @override
  State<Remittancetransactionlog> createState() =>
      _RemittancetransactionlogState();
}

class _RemittancetransactionlogState extends State<Remittancetransactionlog> {
  List<String> res = [];
  String init = '';


  TextEditingController controller = TextEditingController();
  Remittancelog_Api dropdownStatus = Remittancelog_Api();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared = Provider.of<Remittance_L>(context, listen: false);
    shared.RemittanceLog.clear();
    RemittanceL_Parse remittance = RemittanceL_Parse();
    var res = await remittance.profile6();
    if (res.data!.isNotEmpty) {
      print(res.data!.length);
      setState(() {
        shared.RemittanceLog.add(RemittanceLog_Api.fromJson(res.toJson()));
        isLoaded = true;
      });
      for (var i in res.data!) {
        // shared.inqqq.add(Data.fromJson(i.toJson()));
        shared.Remittance_data.add(Remittance_Log.fromJson(i.toJson()));

      }
    }
    for (var i in shared.Remittance_data) {
      print(i.toJson());
    }
  }
  void initState() {
    wait();
    getList();
  }
  getList()async{
    List<dynamic> dlist = await dropdownStatus.getStatus();
    for(var i in dlist){
      setState(() {
        res.add(i['get_rtl_status_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Remittance_L>(context);
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
                                    hinttext: "Date Start",
                                    onChange: (value) {},
                                  ),
                                  horizontalSpaceRegular,
                                  WebDatePicker(
                                    hinttext: "Date End",
                                    onChange: (value) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Sender Mobile Number",
                          ),
                          verticalSpaceTiny,
                          textfield(
                            hintext: "Mobile Reference",
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
                              DropdownButton(value: init,items: res.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                                setState(() {
                                  init = value.toString();
                                });
                              },),

                              verticalSpaceTiny,
                              elevatedbuttonpopup(
                                  label: "Source Branch", width: 400.0),
                              verticalSpaceTiny,
                              elevatedbuttonpopup(
                                  label: "Target Branch", width: 400.0),
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
                          label: Text('Mobile Ref ID \n(sent)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Core Ref ID \n(sent)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Remittance Ref ID', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Sender\n(GivenName\nMiddleName\nSureName)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Receiver\n(GivenName\nMiddleName\nSureName)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Amount', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Sender Mobile Number', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Date&Time\nSent', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Source Branch \n(Processed By)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Processed By Fullname\n(Member/NonMember/Agent', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Date&Time\n(Receive)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Target Branch\n(Disbursed By)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Disbursed By Fullname(Agent/MBO\nTeller/Branch Teller)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Date&Time\nCancelled', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Cancelled By Fullname\n(Member/Non-Member/Agent', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Status', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Core Ref ID\n(Claimed/Cancelled)', style: kLargeBoldTextStyle)),
                      DataColumn(
                          label: Text('Mobile Ref ID\n(Claimed/Cancelled)', style: kLargeBoldTextStyle)),

                    ],
                    source: isLoaded ? shared.Remittance_data.isNotEmpty ? data : data2 : data3,
                    rowsPerPage: 8,
                    showFirstLastButtons: true,
                    header: Text('List of Role', style: kXLargeBoldTextStyle),
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
  Remittance_L shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.Remittance_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].sentMobileRefId.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].sentCoreRefId.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].referenceNumberRefID.toString()))),

      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].senderName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].receiverName.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].amount.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].senderMobileNumber.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].createdDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].sourceBranch.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].processedByFullname.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].createdDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].targetBranch.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].disbursedByFullname.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].cancelledDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].cancelledByFullname.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].status.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].claimedMobileRefId.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.Remittance_data[index].claimedMobileRefId.toString()))),

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
