import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  IconData? icon;
  Color? color;
  String? title;
  VoidCallback? onTap;
  Listtile({
    this.icon,
    this.color,
    this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(
              icon!,
              color: color,
            )
          : null,
      title: Text(
        title!,
        style: TextStyle(color: color),
      ),
      onTap: onTap,
    );
  }
}
