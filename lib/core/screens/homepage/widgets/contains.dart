import 'package:flutter/material.dart';

class Contains extends StatelessWidget {
  List<Widget>? child;
  Contains({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: child!),
    );
  }
}
