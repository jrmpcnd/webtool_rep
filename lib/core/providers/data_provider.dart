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
