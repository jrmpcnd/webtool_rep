import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/screens/monitoring/listofagent/components/get_insti_Api.dart';
import '../screens/administration/usermanagement/components/branchapi.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';
import 'package:http/http.dart' as http;

class elevatedbuttonpopupInsti extends StatefulWidget {
  String? code;
  String? description;
  String? label = "";
  double? width;
  elevatedbuttonpopupInsti(
      {Key? key, this.label, this.width, this.code, this.description})
      : super(key: key);

  @override
  State<elevatedbuttonpopupInsti> createState() => _elevatedbuttonpopupInstiState();
}

class _elevatedbuttonpopupInstiState extends State<elevatedbuttonpopupInsti> {
  InstiApilist _instiApilist = InstiApilist();
  get_insti__Drop _instihDrop = get_insti__Drop();
  final List<elevatedbuttonpopupInsti> institution = [];

  void fetchData() async {
    institution.clear();
    http.Response response = await _instiApilist.getUserstatus();

    _instihDrop = get_insti__Drop.fromJson(jsonDecode(response.body));
    for (var i in _instihDrop.data!) {
      print(i.instDesc);
      print(i.instCode);
      institution.add(elevatedbuttonpopupInsti(code: i.instCode, description: i.instDesc));
    }
    setState(() {});
  }

  final TextEditingController searchController = TextEditingController();
  final TextEditingController mainSearchController = TextEditingController();
  int currentPage = 0;
  final int itemsPerPage = 5;

  List<elevatedbuttonpopupInsti> getPaginatedBranches() {
    final int startIndex = currentPage * itemsPerPage;
    final int endIndex = (startIndex + itemsPerPage).clamp(0, institution.length);
    return institution.sublist(startIndex, endIndex);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  int get totalPages => (institution.length / itemsPerPage).ceil();

  void previousPage() {
    setState(() {
      currentPage = currentPage > 0 ? currentPage - 1 : 0;
    });
  }

  void nextPage() {
    setState(() {
      currentPage = currentPage < totalPages - 1 ? currentPage + 1 : currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      height: 35.0,
      width: widget.width,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          hintText: '--Institution--',
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
        controller: mainSearchController,
        onTap: () {
          showDialog(
            context: context,
            builder: (alert) => AlertDialog(
              title: Text('Institution List'),
              content: Container(
                width: 500.0,
                height: 500.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              style: kTextStyle,
                              controller: searchController,
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
                              onChanged: (data) {
                                mainSearchController.text = data;
                              },
                            ),
                          ),
                          SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle search button press
                              print(mainSearchController.text);
                              print('Search');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // Set search button color to red
                            ),
                            child: Text('Search'),
                          ),
                          SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle reset button press
                              print('Reset');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey, // Set reset button color to gray
                            ),
                            child: Text('Reset'),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('#')),
                        DataColumn(label: Text('Code')),
                        DataColumn(label: Text('Description')),
                      ],
                      rows: getPaginatedBranches().map((branch) {
                        final index =
                            institution.indexOf(branch) + 1 + currentPage * itemsPerPage;
                        return DataRow(
                          cells: [
                            DataCell(Text(index.toString())),
                            DataCell(Text(branch.code!)),
                            DataCell(Text(branch.description!)),
                          ],
                          onSelectChanged: (_) {
                            setState(() {
                              searchController.text = branch.code!;
                              mainSearchController.text = searchController.text;
                              Navigator.pop(context);
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              previousPage;
                            });
                          },
                          child: Text('Previous'),
                        ),
                        Text('Page ${currentPage + 1} of $totalPages'),
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              nextPage;
                            });
                          },
                          child: Text('Next'),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
