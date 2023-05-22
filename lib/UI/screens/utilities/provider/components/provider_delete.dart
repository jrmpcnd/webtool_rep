import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class ProviderDeleteFunction extends StatefulWidget {
  int? index;
  ProviderDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<ProviderDeleteFunction> createState() => _ProviderDeleteFunctionState();
}

class _ProviderDeleteFunctionState extends State<ProviderDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Providers_U>(context, listen: false);
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
