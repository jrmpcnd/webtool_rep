import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class BranchDeleteFunction extends StatefulWidget {
  const BranchDeleteFunction({Key? key}) : super(key: key);

  @override
  State<BranchDeleteFunction> createState() => _BranchDeleteFunctionState();
}

class _BranchDeleteFunctionState extends State<BranchDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Branch_U>(context, listen: false);
    return Checkbox(
      checkColor: Colors.green,
      value: shared.isChecked,
      onChanged: (value) {
        setState(() {
          shared.isChecked = value!;
          print(shared.isChecked);
        });
      },
    );
  }
}
