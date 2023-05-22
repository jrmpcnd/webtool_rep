import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class PartnerDeleteFunction extends StatefulWidget {
  int? index;
  PartnerDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<PartnerDeleteFunction> createState() => _PartnerDeleteFunctionState();
}

class _PartnerDeleteFunctionState extends State<PartnerDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov20>(context, listen: false);
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
