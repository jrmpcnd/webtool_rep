import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/utils/model.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';

class Csrhotline extends StatefulWidget {
  const Csrhotline({Key? key}) : super(key: key);

  @override
  State<Csrhotline> createState() => _CsrhotlineState();
}

class _CsrhotlineState extends State<Csrhotline> {
  TextEditingController controller = TextEditingController();
  bool static = false;
  bool isLoaded = false;
  Future<void> wait() async {
    final shared2 = Provider.of<Prov11>(context, listen: false);
    shared2.hotline.clear();
    CSR_HotlineParse httpParse2 = CSR_HotlineParse();
    var res2 = await httpParse2.profile11();
    if (res2.data!.isNotEmpty) {
      print(res2.data!.length);
      print(res2.data![0].toJson().length);
      setState(() {
        shared2.hotline.add(CSR_Hotline.fromJson(res2.toJson()));
        isLoaded = true;
      });
      for (var i in res2.data!) {
        setState(() {});
        shared2.hotline_data.add(Data11.fromJson(i.toJson()));
      }
    }
    for (var i in shared2.hotline_data) {
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
    final shared = Provider.of<Prov11>(context);
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
              width: double.infinity,
              padding: kEdgeInsetsVerticalNormal,
              child: PaginatedDataTable(
                key: key,
                dataRowHeight: 50,
                arrowHeadColor: kWhiteColor,
                columns: [
                  DataColumn(
                      label:
                          Text('Contact Number', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label:
                          Text('Network Provider', style: kLargeBoldTextStyle)),
                  DataColumn(
                      label:
                          Text('Institution Desc', style: kLargeBoldTextStyle))
                ],
                source: isLoaded
                    ? shared.hotline_data.isNotEmpty
                        ? data
                        : data2
                    : data3,
                rowsPerPage: 8,
                showFirstLastButtons: true,
                header:
                    Text('Type Of Concern List', style: kXLargeBoldTextStyle),
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
  Prov11 shared;
  MyData({required this.shared});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => shared.hotline_data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    debugPrint(index.toString());
    return DataRow(cells: [
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.hotline_data[index].contactNumber.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.hotline_data[index].networkProvider.toString()))),
      DataCell(SizedBox(
          width: 100,
          child: Text(shared.hotline_data[index].instDesc.toString())))
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
      DataCell(SizedBox(child: Center(child: CircularProgressIndicator())))
    ]);
  }
}
