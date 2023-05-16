import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class InstitutionDeleteFunction extends StatefulWidget {
  const InstitutionDeleteFunction({Key? key}) : super(key: key);

  @override
  State<InstitutionDeleteFunction> createState() =>
      _InstitutionDeleteFunctionState();
}

class _InstitutionDeleteFunctionState extends State<InstitutionDeleteFunction> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    // final shared = Provider.of<Institution_U>(context, listen: false);
    return Checkbox(
      checkColor: Colors.green,
      value: isCheck,
      onChanged: (value) {
        setState(() {
          isCheck = value!;
        });
      },
    );
  }
}
