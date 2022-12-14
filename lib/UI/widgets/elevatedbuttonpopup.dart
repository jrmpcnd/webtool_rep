import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/spacing.dart';
import '../utils/text_styles.dart';

class elevatedbuttonpopup extends StatefulWidget {
  String? label = "";
  double? width;
  elevatedbuttonpopup({Key? key, this.label, this.width}) : super(key: key);

  @override
  State<elevatedbuttonpopup> createState() => _elevatedbuttonpopupState();
}

class _elevatedbuttonpopupState extends State<elevatedbuttonpopup> {
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
              title: const Text(
                'Branch',
                style: TextStyle(color: Colors.green),
              ),
              actions: <Widget>[
                const SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kBlackColor)),
                    ),
                  ),
                ),
                verticalSpaceTiny,
                Table(
                  border: TableBorder.all(color: Colors.grey, width: 1.5),
                  children: const [
                    TableRow(children: [
                      Text(
                        "#",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        "Code",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        "Descriptions",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        "2",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        "Sample 2",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        "27",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ]),
                  ],
                ),
                verticalSpaceSmall,
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      verticalSpaceSmall,
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 20.0,
                          ),
                          label: const Text(
                            'Search',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.0, //
                        height: 35.0,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          icon: const Icon(
                            Icons.close,
                            size: 19.0,
                          ),
                          label: const Text(
                            'Close',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        icon: const Icon(Icons.search, color: kWhiteColor),
        label: Text(widget.label!, style: kTinyRegularTextStyle),
      ),
    );
  }
}
