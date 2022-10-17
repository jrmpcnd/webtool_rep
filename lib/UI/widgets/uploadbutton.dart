import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';

class Uploadbutton extends StatefulWidget {
  String? uploadbutton = "";
  String? subuploadbutton = "";
  Uploadbutton({Key? key, this.uploadbutton, this.subuploadbutton})
      : super(key: key);

  @override
  State<Uploadbutton> createState() => _UploadbuttonState();
}

class _UploadbuttonState extends State<Uploadbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 210.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kOrangeColor1),
        onPressed: () {},
        child: Row(
          children: [
            const Icon(Icons.upload_file_outlined, size: 30.0),
            Column(
              children: [
                Text(widget.uploadbutton!,
                    style: kBodyTextStyle.copyWith(color: kWhiteColor)),
                Text(
                  widget.subuploadbutton!,
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
