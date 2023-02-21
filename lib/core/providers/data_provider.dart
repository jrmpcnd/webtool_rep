import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/model.dart';

class Prov extends ChangeNotifier {
  String role_button = 'Click here';
  List<Role_Management> role = [];
  List<Data> role_data = [];
  bool search = false;
}

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

class Prov6 extends ChangeNotifier {
  String agent_button = 'Click here';
  List<Agent_Dashboard> agent = [];
  List<Data6> agent_data = [];
  bool search6 = false;
}

class Prov7 extends ChangeNotifier {
  String failedenrollment_button = 'Click here';
  List<Failed_Enrollment> failed = [];
  List<Data7> failed_data = [];
  bool search7 = false;
}
