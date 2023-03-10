// class H_Prov extends ChangeNotifier {
//   String inq = 'Click here';
//   List<H_SavedAccounts> inqq = [];
//   List<Data1> inqqq = [];
//
//   bool search = false;
// }
// class TransactionProv extends ChangeNotifier {
//   String inq = 'Click here';
//   List<T_SavedAccounts> inqq = [];
//   List<Data2> inqqq = [];
//
//   bool search = false;
// }

import 'dart:js';

import 'package:flutter/cupertino.dart';

import '../../UI/utils/model.dart';
import '../../UI/utils/model2.dart';

class H_Prov extends ChangeNotifier {
  String Hierarchy_button = 'Click here';
  List<Hierarchy_Api> Hierarchy = [];
  List<H_SaveAccount> Hierarchy_data = [];
  bool search = false;
}

class Remittance_L extends ChangeNotifier {
  String RemittanceL_button = 'Click here';
  List<RemittanceLog_Api> RemittanceLog = [];
  List<Remittance_Log> Remittance_data = [];
  bool search = false;
}

class Listofuse_Device extends ChangeNotifier {
  String Listofuse_Device_button = 'Click here';
  List<UseoflistDevice_Api> Listofuse_DeviceLog = [];
  List<UseoflistDevice_Log> Listofuse_Device_data = [];
  bool search = false;
}
// Container(
// width: 500,
// child: TextFormField(
// style: TextStyle(color: kBlackColor),
// decoration: const InputDecoration(
// hintText: 'Search',
// border: OutlineInputBorder(),
// labelStyle: TextStyle(fontSize: 12.0),
// contentPadding: EdgeInsets.only(left: 10.0),
// hintStyle: TextStyle(color: kSecondaryColor2),
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: kBlackColor),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: kBlackColor),
// ),
// ),
// textInputAction: TextInputAction.go,
// controller: controller,
// onChanged: (value) {
// setState(() {
// isLoaded = false;
// });
// //
// try {
// if (controller.text.isNotEmpty) {
// shared.Remittance_data.clear();
// for (var i in shared.RemittanceLog[0].data!) {
// print(i.toJson());
// print(i.sentMobileRefId
//     ?.toLowerCase()
//     .contains(controller.text.toLowerCase()));
// if (i.toJson().isNotEmpty) {
// if (i.sentCoreRefId!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase()) ||
// i.referenceNumberRefID!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())   ||
// i.senderName!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())    ||
// i.receiverName!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())  ||
// i.amount!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.senderMobileNumber!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.createdDate!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.sourceBranch!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.processedByFullname!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.createdDate!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.targetBranch!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.disbursedByFullname!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.cancelledDate!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.status!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.claimedCoreRefId!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.claimedMobileRefId!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())
//
// ) {
// debugPrint(i.lastUpdatedDate);
// setState(() {
// shared.Remittance_data.add(Remittance_Log.fromJson(i.toJson()
// ));
// });
// if (shared.Remittance_data.isNotEmpty) {
// setState(() {
// isLoaded = true;
// });
// }
// }
// }
// }
// } else if (controller.text == '') {
// shared.Remittance_data.clear();
// setState(() {
// shared.Remittance_data.addAll(shared.RemittanceLog[0].data!);
// isLoaded = true;
// });
// }
// debugPrint(shared.Remittance_data[0].toJson().toString());
// } catch (e) {
// shared.Remittance_data.clear();
// isLoaded = true;
// }
// },
// onEditingComplete: () async {
// setState(() {
// isLoaded = false;
// });
// try {
// if (controller.text.isNotEmpty) {
// shared.Remittance_data.clear();
// for (var i in shared.RemittanceLog[0].data!) {
// print(i.toJson());
// print(i.sentMobileRefId
//     ?.toLowerCase()
//     .contains(controller.text.toLowerCase()));
// if (i.toJson().isNotEmpty) {
// if (i.sentCoreRefId!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase()) ||
// i.referenceNumberRefID!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())   ||
// i.senderName!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())    ||
// i.receiverName!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())  ||
// i.amount!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.senderMobileNumber!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.createdDate!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.sourceBranch!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.processedByFullname!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.createdDate!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.targetBranch!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.disbursedByFullname!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.cancelledDate!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.status!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.claimedCoreRefId!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())||
// i.claimedMobileRefId!
//     .toLowerCase()
//     .contains(controller.text.toLowerCase())
//
// ) {
// debugPrint (i.claimedMobileRefId);
// setState(() {
// key.currentState?.pageTo(0);
// shared.Remittance_data.add(Remittance_Log.fromJson(i.toJson()
// ));
//
// });
// if (shared.Remittance_data.isNotEmpty) {
// setState(() {
// isLoaded = true;
// });
// }
// }
// }
// }
// } else if (controller.text == '') {
// shared.Remittance_data.clear();
// setState(() {
// shared.Remittance_data.addAll(shared.RemittanceLog[0].data!);
// });
// }
// debugPrint(shared.Remittance_data[0].toJson().toString());
// } catch (e) {
// shared.Remittance_data.clear();
// }
// },
// ),
// ),

class AtmLocation extends ChangeNotifier {
  String ATMLocation_button = 'Click here';
  List<Atm_Loc_Api> AtmLocation_Log = [];
  List<Atm_Loc_Log> AtmLocation_data = [];
  bool search = false;
}

class Banknews_U extends ChangeNotifier {
  String Banknews_button = 'Click here';
  List<BankNews_Api> BanknewsLog = [];
  List<BankNews_Log> Banknews_data = [];
  bool search = false;
}

class ProductandServices_U extends ChangeNotifier {
  String ProductandServices_button = 'Click here';
  List<ProductandServices_Api> ProductandServicesLog = [];
  List<ProductandServices_Log> ProductandServices_data = [];
  bool search = false;
}

class Servicedowntime_U extends ChangeNotifier {
  String Servicedowntime_button = 'Click here';
  List<Servicedowntime_Api> ServicedowntimeLog = [];
  List<Servicedowntime_Log> Servicedowntime_data = [];
  bool search = false;
}

class Institution_U extends ChangeNotifier {
  String Institution_button = 'Click here';
  List<Institution_Api> InstitutionLog = [];
  List<Institution_Log> Institution_data = [];
  bool search = false;
}

class Branch_U extends ChangeNotifier {
  String Branch_button = 'Click here';
  List<Branch_Api> BranchLog = [];
  List<Branch_Log> Branch_data = [];
  bool search = false;
}

class Unit_U extends ChangeNotifier {
  String Unit_button = 'Click here';
  late BuildContext dashboardContext;
  List<Unit_Api> UnitLog = [];
  List<Unit_Log> Unit_data = [];
  bool search = false;
}

class Center_U extends ChangeNotifier {
  String Center_button = 'Click here';
  List<Center_Api> CenterLog = [];
  List<Center_Log> Center_data = [];
  bool search = false;
}

class Providers_U extends ChangeNotifier {
  String Providers_button = 'Click here';
  List<Providers_Api> ProvidersLog = [];
  List<Providers_Log> Providers_data = [];
  bool search = false;
}
