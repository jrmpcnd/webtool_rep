import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class HierarchyDeleteFunction extends StatefulWidget {
  int? index;
  HierarchyDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<HierarchyDeleteFunction> createState() =>
      _HierarchyDeleteFunctionState();
}

class _HierarchyDeleteFunctionState extends State<HierarchyDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<H_Prov>(context, listen: false);
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
