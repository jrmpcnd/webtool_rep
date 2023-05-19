import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class ProductDeleteFunction extends StatefulWidget {
  int? index;
  ProductDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<ProductDeleteFunction> createState() => _ProductDeleteFunctionState();
}

class _ProductDeleteFunctionState extends State<ProductDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<ProductandServices_U>(context, listen: false);
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
