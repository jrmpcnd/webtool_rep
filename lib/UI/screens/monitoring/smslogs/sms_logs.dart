import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/text_styles.dart';

class Smslogs extends StatefulWidget {
  const Smslogs({Key? key}) : super(key: key);

  @override
  State<Smslogs> createState() => _SmslogsState();
}

class _SmslogsState extends State<Smslogs> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared5 = Provider.of<Prov5>(context, listen: false);
    shared5.sms.clear();
    SmsParse httpParse5 = SmsParse();
    var res5 = await httpParse5.profile5();
    if (res5.data!.isNotEmpty) {
      print(res5.data!.length);
      print(res5.data![0].toJson().length);
      setState(() {
        shared5.sms.add(Sms_Logs.fromJson(res5.toJson()));
        isLoaded = true;
      });
      for (var i in res5.data!) {
        setState(() {});
        shared5.sms_data.add(Data5.fromJson(i.toJson()));
      }
    }
    for (var i in shared5.sms_data) {
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

  Widget build(BuildContext context) {
    final shared = Provider.of<Prov5>(context);
    final DataTableSource data = MyData(shared: shared);
    final DataTableSource data2 = MyData2();
    final DataTableSource data3 = MyData3();
    final key = new GlobalKey<PaginatedDataTableState>();
    ScrollController scrollController = ScrollController();
    return Container(
        width: double.infinity,
        padding: kEdgeInsetsVerticalNormal,
        child: PaginatedDataTable(
          key: key,
          dataRowHeight: 100,
          arrowHeadColor: kWhiteColor,
          columns: [
            DataColumn(label: Text('ID', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('Date Time', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('Mobile No.', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('CID', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('Name', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('Message', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('Message Type', style: kLargeBoldTextStyle)),
            DataColumn(label: Text('Status', style: kLargeBoldTextStyle)),
          ],
          source: isLoaded
              ? shared.sms_data.isNotEmpty
                  ? data
                  : data2
              : data3,
          rowsPerPage: 8,
          showFirstLastButtons: true,
          header: Text('List of Sms Logs', style: kXLargeBoldTextStyle),
        ));
  }
}

class MyData extends DataTableSource {
  Prov5 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.sms_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 50, child: Text(shared.sms_data[index].msgId.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.sms_data[index].msgSentDate.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].msisdn.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].cid.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].name.toString()))),
      DataCell(SizedBox(
          width: 500,
          child: Text(shared.sms_data[index].msgCommand.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].activity.toString()))),
      DataCell(SizedBox(
          width: 100, child: Text(shared.sms_data[index].msgStatus.toString())))
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
