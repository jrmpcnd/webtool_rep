import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/dropdown.dart';

class Feestructure extends StatefulWidget {
  const Feestructure({Key? key}) : super(key: key);

  @override
  State<Feestructure> createState() => _FeestructureState();
}

class _FeestructureState extends State<Feestructure> {
  List<String> res = [];
  String init = '';
  FeeStructure_Api dropdownFunction = FeeStructure_Api();
  void initState() {
    getList();

  }
  getList()async{
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for(var i in dlist){
      setState(() {
        res.add(i['get_fs_transaction_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }
  @override
  Widget build(BuildContext context) {
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
                  padding: kEdgeInsetsAllNormal,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    DropdownButton(value: init,items: res.map((e) {return DropdownMenuItem(value: e,child: Text(e, style: TextStyle(color: Colors.black)),);}).toList(), onChanged: (value) {
                    setState(() {
                      init = value.toString();
                    });
                  },),

                        // items: [
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "",
                        //       child: Text("--Select Transaction--")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Other",
                        //       child: Text("Other")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Cardless Cash Machine",
                        //       child: Text("Cardless Cash Machine")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Agent Assisted Payment",
                        //       child: Text("Agent Assisted Payment")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Fund Transfer",
                        //       child: Text("Fund Transfer")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Cash In",
                        //       child: Text("Cash In")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Cash Out",
                        //       child: Text("Cash Out")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Balance Inquiry",
                        //       child: Text("Balance Inquiry")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Client Initiated Payment",
                        //       child: Text("Client Initiated Payment")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Transaction History",
                        //       child: Text("Transaction History")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Send Remittance",
                        //       child: Text("Send Remittance")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "Self Remittance",
                        //       child: Text("Self Remittance")),
                        //   DropdownMenuItem(
                        //       onTap: () {},
                        //       value: "konek2PAY",
                        //       child: Text("konek2PAY")),
                        //   DropdownMenuItem(
                        //       onTap: () {}, value: "IBFT", child: Text("IBFT")),
                        // ],

                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                size: 20.0,
                              ),
                              label: Text(
                                'Delete',
                                style: kSmallRegularTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
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
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_month, color: kBlackColor),
                        Text('List of Roles', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Table(
                    children: [
                      TableRow(children: [
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('User Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Given Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Middle Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Last Name', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Branch', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Role', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Status', style: kSmallBoldTextStyle),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: kSecondaryColor3,
                          child: Column(children: [
                            Text('Action', style: kSmallBoldTextStyle),
                          ]),
                        ),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            'Sample 1',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Samplel',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            'Sample 2',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          Text(
                            'Sample',
                            style: kBodyRegularTextStyle.copyWith(
                                color: kBlackColor),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 15.0,
                              color: kOrangeColor1,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      ]),
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
