import 'package:flutter/material.dart';
import '../utils/constant.dart';

class dropdowns extends StatefulWidget {
  List<DropdownMenuItem<String>>? items;
  String? dropdown = "";
  VoidCallback? ontap;
  dropdowns({Key? key, this.dropdown, this.ontap, this.items})
      : super(key: key);

  @override
  State<dropdowns> createState() => _dropdownsState();
}

class _dropdownsState extends State<dropdowns> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: 400.0,
      child: DropdownButtonFormField(
        onTap: widget.ontap,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: kSecondaryColor2),
          labelStyle: const TextStyle(fontSize: 12.0),
          contentPadding: const EdgeInsets.only(left: 10.0),
          hintText: widget.dropdown,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kBlackColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kBlackColor)),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        isDense: true,
        isExpanded: true,
        iconEnabledColor: kBlackColor,
        style: const TextStyle(fontSize: 16.5),
        itemHeight: 50.0,
        items: widget.items,
        onChanged: (newValue) {
          setState(() {});
        },
      ),
    );
  }
}
