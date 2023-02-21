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

import '../../UI/utils/model.dart';
import '../../UI/utils/model2.dart';

class H_Prov extends ChangeNotifier {
  String Hierarchy_button = 'Click here';
  List<Hierarchy_Api> Hierarchy = [];
  List<H_SaveAccount> Hierarchy_data = [];
  bool search = false;
}