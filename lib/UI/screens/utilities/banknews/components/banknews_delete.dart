import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

class BanknewsDeleteFunction extends StatefulWidget {
  int? index;
  BanknewsDeleteFunction({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BanknewsDeleteFunction> createState() => _BanknewsDeleteFunctionState();
}

class _BanknewsDeleteFunctionState extends State<BanknewsDeleteFunction> {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<Branch_U>(context, listen: false);
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
