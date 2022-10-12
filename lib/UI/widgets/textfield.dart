import 'package:flutter/material.dart';
import '../utils/constant.dart';

class textfield extends StatefulWidget {
  TextEditingController? controller;
  String? hintext = "";
  textfield({Key? key, this.hintext, this.controller}) : super(key: key);

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: 450.0,
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(color: kBlackColor),
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 12.0),
          hintStyle: const TextStyle(color: kBlackColor),
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
