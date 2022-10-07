import 'package:flutter/material.dart';

import '../utils/constant.dart';

class textfield extends StatelessWidget {
  String? hintext = "";
  textfield({Key? key, this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: 450.0,
      child: TextField(
        style: const TextStyle(color: kBlackColor),
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 12.0),
          hintStyle: const TextStyle(color: kBlackColor),
          contentPadding: const EdgeInsets.only(left: 10.0),
          border: const OutlineInputBorder(),
          hintText: hintext!,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kBlackColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kBlackColor)),
        ),
      ),
    );
  }
}
