import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';

class textfield extends StatefulWidget {
  List<TextInputFormatter>? inputformatters;
  TextEditingController? controller;
  TextInputType? keyboardtype;
  MouseCursor? mousecursor;
  String? hintext = "";
  Widget? suffixIcon;
  bool? readonly;
  double? width;

  textfield({
    Key? key,
    this.readonly = false,
    this.inputformatters,
    this.keyboardtype,
    this.width = 400,
    this.mousecursor,
    this.suffixIcon,
    this.controller,
    this.hintext,
  }) : super(key: key);

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: widget.width,
      child: TextFormField(
        readOnly: widget.readonly!,
        controller: widget.controller,
        mouseCursor: widget.mousecursor,
        keyboardType: widget.keyboardtype,
        inputFormatters: widget.inputformatters,
        style: kTextStyle,
        decoration: InputDecoration(
          hintText: widget.hintext!,
          suffixIcon: widget.suffixIcon,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(fontSize: 12.0),
          contentPadding: const EdgeInsets.only(left: 10.0),
          hintStyle: const TextStyle(color: kSecondaryColor2),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBlackColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBlackColor),
          ),
        ),
      ),
    );
  }
}
