import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class SplashscreenDeleteFunction extends StatefulWidget {
  int? index;
  SplashscreenDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<SplashscreenDeleteFunction> createState() =>
      _SplashscreenDeleteFunctionState();
}

class _SplashscreenDeleteFunctionState
    extends State<SplashscreenDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov21>(context, listen: false);
    return Checkbox(
      checkColor: Colors.green,
      value: shared.isChecked[widget.index!],
      onChanged: (value) {
        setState(() {
          shared.isChecked[widget.index!] = value!;
          print(shared.isChecked);
        });
      },
    );
  }
}
