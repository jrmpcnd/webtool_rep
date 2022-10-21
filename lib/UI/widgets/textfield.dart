import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';

class textfield extends StatefulWidget {
  TextEditingController? controller;
  String? hintext = "";
  Widget? suffixIcon;
  textfield({Key? key, this.hintext, this.controller, this.suffixIcon})
      : super(key: key);

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: 400.0,
      child: TextField(
        controller: widget.controller,
        style: kTextStyle,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          labelStyle: const TextStyle(fontSize: 12.0),
          hintStyle: const TextStyle(color: kSecondaryColor2),
          contentPadding: const EdgeInsets.only(left: 10.0),
          border: const OutlineInputBorder(),
          hintText: widget.hintext!,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kBlackColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kBlackColor)),
        ),
      ),
    );
  }
}
