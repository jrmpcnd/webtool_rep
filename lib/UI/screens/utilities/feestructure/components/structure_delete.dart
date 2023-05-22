import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class StructureDeleteFunction extends StatefulWidget {
  int? index;
  StructureDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<StructureDeleteFunction> createState() =>
      _StructureDeleteFunctionState();
}

class _StructureDeleteFunctionState extends State<StructureDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov12>(context, listen: false);
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
