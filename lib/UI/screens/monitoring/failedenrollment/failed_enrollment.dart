import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import 'package:webtool_rep/UI/widgets/date_picker.dart';
import 'package:webtool_rep/UI/widgets/dropdown.dart';
import '../../../../core/providers/data_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/edge_insect.dart';
import '../../../utils/model.dart';
import '../../../utils/model.dart';
import '../../../utils/spacing.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/elevatedbuttonpopup.dart';
import '../../../widgets/textfield.dart';
import '../transactionforconfirmation/getter_setter.dart';

class Failedenrollment extends StatefulWidget {
  const Failedenrollment({Key? key}) : super(key: key);

  @override
  State<Failedenrollment> createState() => _FailedenrollmentState();
}

class _FailedenrollmentState extends State<Failedenrollment> {
  bool static = false;
  bool isLoaded = false;
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

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
                                  DatePickerScreen(
                                      startDateController: startDate,
                                      endDateController: endDate),
                                ],
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          SizedBox(
                            height: 35.0,
                            width: 400,
                            child: TextFormField(
                              style: TextStyle(color: kBlackColor),
                              decoration: const InputDecoration(
                                hintText: 'Date Birth',
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
                              controller: controller1,
                              onChanged: (value) {
                                setState(() {
                                  isLoaded = false;
                                });
                                //
                                try {
                                  if (controller1.text.isNotEmpty) {
                                    shared.failed_data.clear();
                                    for (var i in shared.failed[0].data!) {
                                      print(i.toJson());
                                      print(i.dateOfBirth
                                          ?.toLowerCase()
                                          .contains(
                                              controller1.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.dateOfBirth!
                                            .toLowerCase()
                                            .contains(controller1.text
                                                .toLowerCase())) {
                                          debugPrint(i.dateOfBirth);
                                          setState(() {
                                            shared.failed_data.add(
                                                Data7.fromJson(i.toJson()));
                                          });
                                          if (shared.failed_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller1.text == '') {
                                    shared.failed_data.clear();
                                    setState(() {
                                      shared.failed_data
                                          .addAll(shared.failed[0].data!);
                                      isLoaded = true;
                                    });
                                  }
                                  debugPrint(shared.failed_data[0]
                                      .toJson()
                                      .toString());
                                } catch (e) {
                                  shared.failed_data.clear();
                                  isLoaded = true;
                                }
                              },
                              onEditingComplete: () async {
                                setState(() {
                                  isLoaded = false;
                                });
                                try {
                                  if (controller1.text.isNotEmpty) {
                                    shared.failed_data.clear();
                                    for (var i in shared.failed[0].data!) {
                                      print(i.toJson());
                                      print(i.dateOfBirth
                                          ?.toLowerCase()
                                          .contains(
                                              controller1.text.toLowerCase()));
                                      if (i.toJson().isNotEmpty) {
                                        if (i.dateOfBirth!
                                            .toLowerCase()
                                            .contains(controller1.text
                                                .toLowerCase())) {
                                          debugPrint(i.dateOfBirth);
                                          setState(() {
                                            key.currentState?.pageTo(0);
                                            shared.failed_data.add(
                                                Data7.fromJson(i.toJson()));
                                          });
                                          if (shared.failed_data.isNotEmpty) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          }
                                        }
                                      }
                                    }
                                  } else if (controller1.text == '') {
                                    shared.failed_data.clear();
                                    setState(() {
                                      shared.failed_data
                                          .addAll(shared.failed[0].data!);
                                    });
                                  }
                                  debugPrint(shared.failed_data[0]
                                      .toJson()
                                      .toString());
                                } catch (e) {
                                  shared.failed_data.clear();
                                }
                              },
                            ),
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
                                  onPressed: () {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    //
                                    try {
                                      if (controller1.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.dateOfBirth
                                              ?.toLowerCase()
                                              .contains(controller1.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.dateOfBirth!
                                                .toLowerCase()
                                                .contains(controller1.text
                                                    .toLowerCase())) {
                                              debugPrint(i.dateOfBirth);
                                              setState(() {
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller1.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                          isLoaded = true;
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());

                                      setState(() {
                                        isLoaded = false;
                                      });
                                      shared.failed_data.clear();
                                      print(GetDate.getStartDate2());
                                      final transactionDate = DateTime.parse(
                                          GetDate.getStartDate2());
                                      print(transactionDate);
                                      for (var i in shared.failed[0].data!) {
                                        if (i.toJson().isNotEmpty) {
                                          if (i.enrolledDateStart != '') {
                                            final transactionsDate =
                                                DateTime.parse(i
                                                    .enrolledDateStart
                                                    .toString()
                                                    .replaceAll('T', ' ')
                                                    .replaceAll('Z', ''));
                                            print(transactionsDate);

                                            if (transactionDate.year ==
                                                    transactionsDate.year &&
                                                transactionDate.month ==
                                                    transactionsDate.month &&
                                                transactionDate.day ==
                                                    transactionsDate.day) {
                                              setState(() {
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                Future.delayed(
                                                    Duration(seconds: 1), () {
                                                  setState(() {
                                                    isLoaded = true;
                                                  });
                                                });
                                              }
                                            }
                                          }
                                        }
                                      }
                                    } catch (e) {
                                      shared.failed_data.clear();
                                      isLoaded = true;
                                    }
                                  },
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
                              SizedBox(
                                height: 35.0,
                                width: 400,
                                child: TextFormField(
                                  style: TextStyle(color: kBlackColor),
                                  decoration: const InputDecoration(
                                    hintText: 'Account Number',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(fontSize: 12.0),
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    hintStyle:
                                        TextStyle(color: kSecondaryColor2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kBlackColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kBlackColor),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.go,
                                  controller: controller2,
                                  onChanged: (value) {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    //
                                    try {
                                      if (controller2.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.accountNumber
                                              ?.toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.accountNumber!
                                                .toLowerCase()
                                                .contains(controller2.text
                                                    .toLowerCase())) {
                                              debugPrint(i.accountNumber);
                                              setState(() {
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller2.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                          isLoaded = true;
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.failed_data.clear();
                                      isLoaded = true;
                                    }
                                  },
                                  onEditingComplete: () async {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    try {
                                      if (controller2.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.accountNumber
                                              ?.toLowerCase()
                                              .contains(controller2.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.accountNumber!
                                                .toLowerCase()
                                                .contains(controller2.text
                                                    .toLowerCase())) {
                                              debugPrint(i.accountNumber);
                                              setState(() {
                                                key.currentState?.pageTo(0);
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller2.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.failed_data.clear();
                                    }
                                  },
                                ),
                              ),
                              verticalSpaceTiny,
                              SizedBox(
                                height: 35.0,
                                width: 400,
                                child: TextFormField(
                                  style: TextStyle(color: kBlackColor),
                                  decoration: const InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(fontSize: 12.0),
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    hintStyle:
                                        TextStyle(color: kSecondaryColor2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kBlackColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kBlackColor),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.go,
                                  controller: controller3,
                                  onChanged: (value) {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    //
                                    try {
                                      if (controller3.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.mobileNumber
                                              ?.toLowerCase()
                                              .contains(controller3.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.mobileNumber!
                                                .toLowerCase()
                                                .contains(controller3.text
                                                    .toLowerCase())) {
                                              debugPrint(i.mobileNumber);
                                              setState(() {
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller3.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                          isLoaded = true;
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.failed_data.clear();
                                      isLoaded = true;
                                    }
                                  },
                                  onEditingComplete: () async {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    try {
                                      if (controller3.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.mobileNumber
                                              ?.toLowerCase()
                                              .contains(controller3.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.mobileNumber!
                                                .toLowerCase()
                                                .contains(controller3.text
                                                    .toLowerCase())) {
                                              debugPrint(i.mobileNumber);
                                              setState(() {
                                                key.currentState?.pageTo(0);
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller3.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.failed_data.clear();
                                    }
                                  },
                                ),
                              ),
                              verticalSpaceTiny,
                              SizedBox(
                                height: 35.0,
                                width: 400,
                                child: TextFormField(
                                  style: TextStyle(color: kBlackColor),
                                  decoration: const InputDecoration(
                                    hintText: 'Error Message',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(fontSize: 12.0),
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    hintStyle:
                                        TextStyle(color: kSecondaryColor2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kBlackColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kBlackColor),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.go,
                                  controller: controller4,
                                  onChanged: (value) {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    //
                                    try {
                                      if (controller4.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.errorMessage
                                              ?.toLowerCase()
                                              .contains(controller4.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.errorMessage!
                                                .toLowerCase()
                                                .contains(controller4.text
                                                    .toLowerCase())) {
                                              debugPrint(i.errorMessage);
                                              setState(() {
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller4.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                          isLoaded = true;
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.failed_data.clear();
                                      isLoaded = true;
                                    }
                                  },
                                  onEditingComplete: () async {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    try {
                                      if (controller4.text.isNotEmpty) {
                                        shared.failed_data.clear();
                                        for (var i in shared.failed[0].data!) {
                                          print(i.toJson());
                                          print(i.errorMessage
                                              ?.toLowerCase()
                                              .contains(controller4.text
                                                  .toLowerCase()));
                                          if (i.toJson().isNotEmpty) {
                                            if (i.errorMessage!
                                                .toLowerCase()
                                                .contains(controller4.text
                                                    .toLowerCase())) {
                                              debugPrint(i.errorMessage);
                                              setState(() {
                                                key.currentState?.pageTo(0);
                                                shared.failed_data.add(
                                                    Data7.fromJson(i.toJson()));
                                              });
                                              if (shared
                                                  .failed_data.isNotEmpty) {
                                                setState(() {
                                                  isLoaded = true;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else if (controller4.text == '') {
                                        shared.failed_data.clear();
                                        setState(() {
                                          shared.failed_data
                                              .addAll(shared.failed[0].data!);
                                        });
                                      }
                                      debugPrint(shared.failed_data[0]
                                          .toJson()
                                          .toString());
                                    } catch (e) {
                                      shared.failed_data.clear();
                                    }
                                  },
                                ),
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
                Column(
                  children: [
                    Container(
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
                              shared.failed_data.clear();
                              for (var i in shared.failed[0].data!) {
                                print(i.toJson());
                                print(i.enrolledDateStart
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.accountNumber!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.dateOfBirth!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.mobileNumber!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.clientType!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.deviceId!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.deviceModel!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.errorMessage!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.accountNumber);
                                    setState(() {
                                      shared.failed_data
                                          .add(Data7.fromJson(i.toJson()));
                                    });
                                    if (shared.failed_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.failed_data.clear();
                              setState(() {
                                shared.failed_data
                                    .addAll(shared.failed[0].data!);
                                isLoaded = true;
                              });
                            }
                            debugPrint(
                                shared.failed_data[0].toJson().toString());
                          } catch (e) {
                            shared.failed_data.clear();
                            isLoaded = true;
                          }
                        },
                        onEditingComplete: () async {
                          setState(() {
                            isLoaded = false;
                          });
                          try {
                            if (controller.text.isNotEmpty) {
                              shared.failed_data.clear();
                              for (var i in shared.failed[0].data!) {
                                print(i.toJson());
                                print(i.enrolledDateStart
                                    ?.toLowerCase()
                                    .contains(controller.text.toLowerCase()));
                                if (i.toJson().isNotEmpty) {
                                  if (i.accountNumber!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.dateOfBirth!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.mobileNumber!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.clientType!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.deviceId!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.deviceModel!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      i.errorMessage!.toLowerCase().contains(
                                          controller.text.toLowerCase())) {
                                    debugPrint(i.accountNumber);
                                    setState(() {
                                      key.currentState?.pageTo(0);
                                      shared.failed_data
                                          .add(Data7.fromJson(i.toJson()));
                                    });
                                    if (shared.failed_data.isNotEmpty) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                    }
                                  }
                                }
                              }
                            } else if (controller.text == '') {
                              shared.failed_data.clear();
                              setState(() {
                                shared.failed_data
                                    .addAll(shared.failed[0].data!);
                              });
                            }
                            debugPrint(
                                shared.failed_data[0].toJson().toString());
                          } catch (e) {
                            shared.failed_data.clear();
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
                                label: Text('Device ID',
                                    style: kLargeBoldTextStyle)),
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
                )
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
          child: Text(shared.failed_data[index].enrolledDateStart.toString()))),
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
