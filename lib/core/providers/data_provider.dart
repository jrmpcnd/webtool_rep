import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/model.dart';

class Prov extends ChangeNotifier {
  String role_button = 'Click here';
  List<Role_Management> role = [];
  List<Data> role_data = [];
  bool search = false;
}

<<<<<<< HEAD
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
=======
class Prov1 extends ChangeNotifier {
  String user_button = 'Click here';
  List<User_Management> user = [];
  List<Data2> user_data = [];
  bool search1 = false;
}

class Prov3 extends ChangeNotifier {
  String confirmation_button = 'Click here';
  List<Transaction_Confirmation> confirm = [];
  List<Data3> confirm_data = [];
  bool search3 = false;
}

class Prov5 extends ChangeNotifier {
  String sms_button = 'Click here';
  List<Sms_Logs> sms = [];
  List<Data5> sms_data = [];
  bool search5 = false;
}
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
