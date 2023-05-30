import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';
import 'dart:convert';
import 'dart:typed_data';

class Addsplashscreen extends StatefulWidget {
  const Addsplashscreen({Key? key}) : super(key: key);

  @override
  State<Addsplashscreen> createState() => _AddsplashscreenState();
}

class _AddsplashscreenState extends State<Addsplashscreen> {
  String imageUrl = '';
  Uint8List? imageBytes;
  bool value = false;

  void previewImage() {
    if (imageUrl.startsWith('http')) {
      // Handle image URL
      // ...
    } else if (imageUrl.startsWith('data:image')) {
      // Handle encoded image bytes in data URL format
      final base64String = imageUrl.split(',').last;
      setState(() {
        imageBytes = base64.decode(base64String);
      });
    } else {
      setState(() {
        imageBytes = null;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Image Source'),
            content: Text(
                'Please provide a direct URL to the image file or encoded image bytes in data URL format.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsAllNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  height: 30.0,
                  width: 450.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lan_outlined, color: kBlackColor),
                        Text('Bank News', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                verticalSpaceTiny,
                Container(
                  padding: kEdgeInsetsAllLarge,
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
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
                          offset: Offset(0, 3)),
                    ],
                  ),
                  width: 450.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Action :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Title :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Message :", style: kHeading2TextStyle),
                          AutoSizeWidget(
                            initialWidth: 400,
                            initialHeight: 150,
                            maxWidth: 400,
                            maxHeight: 200,
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            showIcon: true,
                            child: const TextField(
                              style: TextStyle(color: kBlackColor),
                              maxLines: 3 * 120,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                focusColor: kBlackColor,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 15),
                                hintText: "Enter text here",
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Sub Message :", style: kHeading2TextStyle),
                          AutoSizeWidget(
                            initialWidth: 400,
                            initialHeight: 150,
                            maxWidth: 400,
                            maxHeight: 200,
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            showIcon: true,
                            child: const TextField(
                              style: TextStyle(color: kBlackColor),
                              maxLines: 3 * 120,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                focusColor: kBlackColor,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 15),
                                hintText: "Enter text here",
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 12.0),
                                hintStyle: TextStyle(color: kSecondaryColor2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kBlackColor),
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceTiny,
                          Text("Show :", style: kHeading2TextStyle),
                          dropdowns(dropdown: "--Choose--"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kTertiaryColor5,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                    height: 30.0,
                    width: 650.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: [
                          const Icon(Icons.lan_outlined, color: kBlackColor),
                          Text('Banner', style: kTinyBoldTextStyle),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  Container(
                    decoration: BoxDecoration(
                      color: kTertiaryColor5,
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
                    width: 650.0,
                    height: 400,
                    child: Padding(
                      padding: kEdgeInsetsAllNormal,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 400,
                            child: TextFormField(
                              onChanged: (value) => imageUrl = value,
                              decoration: InputDecoration(
                                  labelText: 'Enter Image URL or Encoded Bytes',labelStyle: TextStyle(color: Colors.black),

                            ),
                          ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: previewImage,
                            child: Text('Preview'),
                          ),
                          SizedBox(height: 20),
                          if (imageBytes != null) Image.memory(imageBytes!),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
