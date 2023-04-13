import 'dart:async';

import 'package:flutter/material.dart';

import '../../UI/screens/login/login_screen.dart';

class TimerProvider extends ChangeNotifier {
  Timer _timer = Timer(Duration.zero, () {});
  late BuildContext _buildContext;

  BuildContext get buildContext => _buildContext;

  set buildContext(BuildContext value) {
    _buildContext = value;
    notifyListeners();
  }

  Timer get timer => _timer;

  set timer(Timer value) {
    _timer = value;
    notifyListeners();
  }

  void stop() {
    _timer.cancel();
    _timer = Timer(Duration.zero, () {});
    print('flutter-----(time stop!)');
  }

  void startTimer() {
    if (_timer != Timer(Duration.zero, () {})) {
      _timer.cancel();
    }
    _timer = Timer(const Duration(seconds: 100), () {
      _timer.cancel();
      _timer = Timer(Duration.zero, () {});
      print('flutter-----(time out!)');
      Navigator.push(
          _buildContext, MaterialPageRoute(builder: (_) => Loginpage()));
    });
  }
}
