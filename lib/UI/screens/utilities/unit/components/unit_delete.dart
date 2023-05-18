import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class UnitDeleteFunction extends StatefulWidget {
  int? index;
  UnitDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<UnitDeleteFunction> createState() => _UnitDeleteFunctionState();
}

class _UnitDeleteFunctionState extends State<UnitDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Unit_U>(context, listen: false);
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
