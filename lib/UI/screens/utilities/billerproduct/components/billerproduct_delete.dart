import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class BillerproductDeleteFunction extends StatefulWidget {
  int? index;
  BillerproductDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BillerproductDeleteFunction> createState() =>
      _BillerproductDeleteFunctionState();
}

class _BillerproductDeleteFunctionState
    extends State<BillerproductDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov16>(context, listen: false);
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
