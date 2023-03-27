import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/spacing.dart';

class Activeclient extends StatefulWidget {
  const Activeclient({Key? key}) : super(key: key);

  @override
  State<Activeclient> createState() => _ActiveclientState();
}

class _ActiveclientState extends State<Activeclient> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          verticalSpaceRegular,
          Container(
            height: 530,
            child: WebView(
              initialUrl:
                  'https://datastudio.google.com/embed/reporting/d483b67a-c8a3-4c96-9e8d-048f86f4db59/page/GzUdC',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onPageStarted: (url) {},
            ),
          ),
        ],
      ),
    );
  }
}
