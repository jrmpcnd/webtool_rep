import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';

class elevatedbuttonpopup extends StatefulWidget {
  String? code;
  String? description;
  String? label = "";
  double? width;
  elevatedbuttonpopup(
      {Key? key, this.label, this.width, this.code, this.description})
      : super(key: key);

  @override
  State<elevatedbuttonpopup> createState() => _elevatedbuttonpopupState();
}

class _elevatedbuttonpopupState extends State<elevatedbuttonpopup> {
  final List<elevatedbuttonpopup> branches = [
    elevatedbuttonpopup(code: '467870', description: 'Palawan 3'),
    elevatedbuttonpopup(code: '467815', description: 'Cagayan 1'),
    elevatedbuttonpopup(code: 'PH1010063', description: 'San Carlos'),
    elevatedbuttonpopup(code: '468023', description: 'Misamis Oriental 1'),
    elevatedbuttonpopup(code: 'PH1010065', description: 'San Fernando City'),
    elevatedbuttonpopup(code: '123456', description: 'Sample Branch 1'),
    elevatedbuttonpopup(code: '789012', description: 'Sample Branch 2'),
    elevatedbuttonpopup(code: '345678', description: 'Sample Branch 3'),
    elevatedbuttonpopup(code: '901234', description: 'Sample Branch 4'),
    elevatedbuttonpopup(code: '567890', description: 'Sample Branch 5'),
    elevatedbuttonpopup(code: '234567', description: 'Sample Branch 6'),
  ];

  final TextEditingController searchController = TextEditingController();
  int currentPage = 0;
  final int itemsPerPage = 5;

  List<elevatedbuttonpopup> getPaginatedBranches() {
    final int startIndex = currentPage * itemsPerPage;
    final int endIndex = startIndex + itemsPerPage;
    return branches.sublist(startIndex, endIndex);
  }

  void nextPage() {
    if (currentPage < totalPages - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  int get totalPages => (branches.length / itemsPerPage).ceil();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: widget.width,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          backgroundColor: MaterialStateProperty.all(kSecondaryColor3),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (alert) => AlertDialog(
              title: Text('Branch List'),
              content: Container(
                width: 400.0,
                height: 400.0,
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
                              controller: searchController,
                              decoration: InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle search button press
                              print('Search');
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  Colors.red, // Set search button color to red
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
                              primary:
                                  Colors.grey, // Set reset button color to gray
                            ),
                            child: Text('Reset'),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '#',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Page',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Code',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: getPaginatedBranches().length,
                        itemBuilder: (BuildContext context, int index) {
                          final branch = getPaginatedBranches()[index];
                          return ListTile(
                            onTap: () {
                              setState(() {
                                searchController.text = branch.code!;
                              });
                            },
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      '${index + 1 + currentPage * itemsPerPage}.'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('${currentPage + 1}'),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(branch.code!),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(branch.description!),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: previousPage,
                          child: Text('Previous'),
                        ),
                        Text('Page ${currentPage + 1} of $totalPages'),
                        ElevatedButton(
                          onPressed: nextPage,
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
        icon: const Icon(Icons.search, color: kWhiteColor),
        label: Text(widget.label!, style: kTinyRegularTextStyle),
      ),
    );
  }
}
