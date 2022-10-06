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
    return Column(
      children: [
        verticalSpaceRegular,
        Container(
          height: 650,
          child: WebView(
            initialUrl: 'https://datastudio.google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            onPageStarted: (url) {
              print('New website: $url');
            },
          ),
        ),
      ],
    );
  }
}