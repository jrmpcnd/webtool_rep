import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import '../../../../../core/providers/data_provider.dart';

class ProducttypeDeleteFunction extends StatefulWidget {
  int? index;
  ProducttypeDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<ProducttypeDeleteFunction> createState() =>
      _ProducttypeDeleteFunctionState();

}

class _ProducttypeDeleteFunctionState extends State<ProducttypeDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Prov14>(context, listen: false);
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
