import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepicker extends StatefulWidget {
  const Imagepicker({Key? key}) : super(key: key);

  @override
  State<Imagepicker> createState() => _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {
  String defaultImageUrl =
      'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg';
  String selctFile = '';
  late XFile file;
  late Uint8List selectedImageInBytes;
  bool isItemSaved = false;

  _selectFile(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) {
      setState(() {
        selctFile = fileResult.files.first.name;
        selectedImageInBytes = fileResult.files.first.bytes!;
      });
    }
    print(selctFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: selctFile.isEmpty
                  ? Image.network(
                      defaultImageUrl,
                      fit: BoxFit.cover,
                    )
                  // Image.asset('assets/create_menu_default.png')
                  : Image.memory(selectedImageInBytes)

              // Image.file(
              //     File(file.path),
              //     fit: BoxFit.fill,
              //   ),
              ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
            child: ElevatedButton(
              onPressed: () {
                //_showPicker(context);
                _selectFile(true);
              },
              child: Text("sample"),
            ),
          ),
        ],
      ),
    );
  }
}
