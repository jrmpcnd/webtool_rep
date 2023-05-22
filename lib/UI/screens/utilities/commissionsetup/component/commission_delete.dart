import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class CommissionDeleteFunction extends StatefulWidget {
  int? index;
  CommissionDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<CommissionDeleteFunction> createState() => _CommissionDeleteFunctionState();
}

class _CommissionDeleteFunctionState extends State<CommissionDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov18>(context, listen: false);
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
