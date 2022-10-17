import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class Sidemenu extends StatefulWidget {
  String? title;
  String? sub;
  List<Widget>? child;
  IconData? icon;
  Sidemenu({
    this.title,
    this.sub,
    this.child,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.black,
      iconColor: Colors.black,
      textColor: Colors.black,
      leading: widget.icon != null ? Icon(widget.icon!) : null,
      title: Text(
        widget.title!,
        style: kSubtitleRegularTextStyle,
      ),
      children: widget.child!,
    );
  }
}
