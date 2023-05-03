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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../UI/screens/homepage/main_dashboard.dart';
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

class AtmLocation extends ChangeNotifier {
  String ATMLocation_button = 'Click here';
  List<Atm_Loc_Api> AtmLocation_Log = [];
  List<Atm_Loc_Log> AtmLocation_data = [];
  bool search = false;
  bool isLoaded = false;
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
  bool isLoaded = false;
}

class Branch_U extends ChangeNotifier {
  String Branch_button = 'Click here';
  List<Branch_Api> BranchLog = [];
  List<Branch_Log> Branch_data = [];
  bool search = false;
  bool isLoaded = false;
}

class Unit_U extends ChangeNotifier {
  String Unit_button = 'Click here';
  late BuildContext dashboardContext;
  List<Unit_Api> UnitLog = [];
  List<Unit_Log> Unit_data = [];
  bool search = false;
  bool isLoaded = false;
}

class Center_U extends ChangeNotifier {
  String Center_button = 'Click here';
  List<Center_Api> CenterLog = [];
  List<Center_Log> Center_data = [];
  bool search = false;
  bool isLoaded = false;
}

class Providers_U extends ChangeNotifier {
  String Providers_button = 'Click here';
  List<Providers_Api> ProvidersLog = [];
  List<Providers_Log> Providers_data = [];
  bool search = false;
  bool isLoaded = false;
}

class HomePageProvider extends ChangeNotifier {
  List<Widget> homewidget = [const Maindashboard()];
  String title = "Dashboard";
  String header = "Home";
  String addbutton = "";
  String subaddbutton = "";
  String uploadbutton = "";
  String subuploadbutton = "";
  IconData? icon = Icons.home_outlined;
  IconData? addicon;
  VoidCallback? onPress;
  VoidCallback? onTaps;
}
