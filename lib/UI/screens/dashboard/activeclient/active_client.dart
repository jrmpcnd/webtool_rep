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
            height: 1,
            child: WebView(
              initialUrl:
                  'https://lookerstudio.google.com/reporting/c829bc0c-a2dd-40b2-84e6-6fa187a6ce2a',
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
