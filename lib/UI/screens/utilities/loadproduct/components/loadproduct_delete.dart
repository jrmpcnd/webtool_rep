import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class LoadproductDeleteFunction extends StatefulWidget {
  int? index;
  LoadproductDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<LoadproductDeleteFunction> createState() =>
      _LoadproductDeleteFunctionState();
}

class _LoadproductDeleteFunctionState extends State<LoadproductDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov17>(context, listen: false);
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
