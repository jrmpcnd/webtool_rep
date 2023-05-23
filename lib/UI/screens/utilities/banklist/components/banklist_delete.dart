import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class BanklistDeleteFunction extends StatefulWidget {
  int? index;
  BanklistDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BanklistDeleteFunction> createState() => _BanklistDeleteFunctionState();
}

class _BanklistDeleteFunctionState extends State<BanklistDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov19>(context, listen: false);
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
