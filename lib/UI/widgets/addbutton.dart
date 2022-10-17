import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';

class Addbutton extends StatefulWidget {
  String? addbutton = "";
  String? subaddbutton = "";
  VoidCallback? onPress;
  Addbutton({Key? key, this.addbutton, this.subaddbutton, this.onPress})
      : super(key: key);

  @override
  State<Addbutton> createState() => _AddbuttonState();
}

class _AddbuttonState extends State<Addbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 210.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kLightPurpleColor1),
        onPressed: widget.onPress!,
        child: Row(
          children: [
            const Icon(Icons.add_outlined, size: 30.0),
            Column(
              children: [
                Text(widget.addbutton!,
                    style: kBodyTextStyle.copyWith(color: kWhiteColor)),
                Text(
                  widget.subaddbutton!,
                  style: kBodyRegularTextStyle.copyWith(color: kWhiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
