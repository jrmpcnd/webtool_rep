import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  Color? color;
  String? title;
  VoidCallback? onTap;
  Listtile({
    this.color,
    this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title!,
        style: TextStyle(color: color),
      ),
      onTap: onTap,
    );
  }
}
