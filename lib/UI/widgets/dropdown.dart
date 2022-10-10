import 'package:flutter/material.dart';
import '../utils/constant.dart';

class dropdowns extends StatefulWidget {
  String? dropdown = "";
  dropdowns({Key? key, this.dropdown}) : super(key: key);

  @override
  State<dropdowns> createState() => _dropdownsState();
}

class _dropdownsState extends State<dropdowns> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: 450.0,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: kBlackColor),
          labelStyle: TextStyle(fontSize: 12.0),
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: widget.dropdown,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kBlackColor)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kBlackColor)),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        isDense: true,
        isExpanded: true,
        iconEnabledColor: kBlackColor,
        style: const TextStyle(fontSize: 16.5),
        items: const [
          DropdownMenuItem(value: "", child: Text("--Select Status--")),
          DropdownMenuItem(value: "Sample 1", child: Text("Sample 1")),
          DropdownMenuItem(value: "Sample 2", child: Text("Sample 2")),
        ],
        onChanged: (newValue) {
          setState(() {});
        },
      ),
    );
  }
}
