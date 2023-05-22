import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class DowntimeDeleteFunction extends StatefulWidget {
  int? index;
  DowntimeDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<DowntimeDeleteFunction> createState() => _DowntimeDeleteFunctionState();
}

class _DowntimeDeleteFunctionState extends State<DowntimeDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Servicedowntime_U>(context, listen: false);
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
