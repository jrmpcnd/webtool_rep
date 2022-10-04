import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  Color? color;
  String? title;
  VoidCallback? onPressed;
  Listtile({
    this.color,
    this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextButton(
          onPressed: onPressed,
          child: Text(
            title!,
            style: TextStyle(color: color),
          )),
    );
  }
}
