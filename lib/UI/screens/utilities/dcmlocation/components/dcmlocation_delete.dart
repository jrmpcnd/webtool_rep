import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class DcmlocationDeleteFunction extends StatefulWidget {
  int? index;
  DcmlocationDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<DcmlocationDeleteFunction> createState() =>
      _DcmlocationDeleteFunctionState();
}

class _DcmlocationDeleteFunctionState extends State<DcmlocationDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<AtmLocation>(context, listen: false);
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
