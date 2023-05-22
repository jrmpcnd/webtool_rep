import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class ProductcategoryDeleteFunction extends StatefulWidget {
  int? index;
  ProductcategoryDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<ProductcategoryDeleteFunction> createState() =>
      _ProductcategoryDeleteFunctionState();
}

class _ProductcategoryDeleteFunctionState
    extends State<ProductcategoryDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov15>(context, listen: false);
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
