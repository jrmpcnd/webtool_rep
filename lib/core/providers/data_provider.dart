import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/model.dart';

// class Prov extends ChangeNotifier {
//   List role = [];
// }

class Prov extends ChangeNotifier {
  String inq = 'Click here';
  List<SavedAccounts> inqq = [];
  List<Data> inqqq = [];

  bool search = false;
}

class H_Prov extends ChangeNotifier {
  String inq = 'Click here';
  List<H_SavedAccounts> inqq = [];
  List<Data1> inqqq = [];

  bool search = false;
}
class TransactionProv extends ChangeNotifier {
  String inq = 'Click here';
  List<T_SavedAccounts> inqq = [];
  List<Data2> inqqq = [];

  bool search = false;
}