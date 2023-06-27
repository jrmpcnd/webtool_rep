import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';


class UploadButton extends StatefulWidget {
  String? uploadButton = "";
  String? subUploadButton = "";
  UploadButton({Key? key, this.uploadButton, this.subUploadButton})
      : super(key: key);

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  String _uploadStatus = '';
  String? _selectedOption;
  late TextEditingController _fileController;

  @override
  void initState() {
    super.initState();
    _fileController = TextEditingController();
  }

  Future<void> _openFileExplorer() async {
    final result = await showDialog<FilePickerResult>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Upload File'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedOption,
              items: [
                DropdownMenuItem(
                  child: Text('Option 1'),
                  value: 'Option 1',
                ),
                DropdownMenuItem(
                  child: Text('Option 2'),
                  value: 'Option 2',
                ),
                DropdownMenuItem(
                  child: Text('Option 3'),
                  value: 'Option 3',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select an option',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _fileController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Browse File',
                suffixIcon: IconButton(
                  icon: Icon(Icons.folder_open),
                  onPressed: _pickFile,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kOrangeColor1),
            child: Text('Upload'),
            onPressed: _uploadFile,
          ),
        ],
      ),
    );

    if (result != null) {
      // File selected, proceed with upload
      // ...
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileController.text = result.files.single.name;
      });
    }
  }

  void _uploadFile() {
    // Perform the file upload process
    // ...
    Navigator.of(context).pop();
  }

  void saveFileToDatabase(String fileUrl) {
    print('Saving file URL to the database: $fileUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 210.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kOrangeColor1),
        onPressed: _openFileExplorer,
        child: Row(
          children: [
            const Icon(Icons.upload_file_outlined, size: 30.0),
            Column(
              children: [
                Text(widget.uploadButton!,
                    style: kBodyTextStyle.copyWith(color: kWhiteColor)),
                Text(
                  widget.subUploadButton!,
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
