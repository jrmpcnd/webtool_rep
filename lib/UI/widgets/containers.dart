import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/spacing.dart';

class Containers extends StatelessWidget {
  Containers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          verticalSpaceSmall,
          Container(
            height: 600.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 30,
                      width: 450,
                      child: TextField(
                        decoration: InputDecoration(
                            labelStyle:
                                TextStyle(fontSize: 12, color: kBlackColor),
                            contentPadding: EdgeInsets.only(left: 10),
                            border: OutlineInputBorder(),
                            hintText: 'First Name'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
