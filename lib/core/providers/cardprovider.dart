import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Cardprovider extends ChangeNotifier {
  String _clientname = 'qqqqqqqq';
  String get clientname => _clientname;
  set clientname(String newValue) {
    _clientname = newValue;
    notifyListeners();
  }
}
