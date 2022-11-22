import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/spacing.dart';

class Registerclient extends StatefulWidget {
  const Registerclient({Key? key}) : super(key: key);

  @override
  State<Registerclient> createState() => _RegisterclientState();
}

class _RegisterclientState extends State<Registerclient> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceRegular,
        SizedBox(
          height: 650,
          child: WebView(
            initialUrl:
                'https://datastudio.google.com/embed/reporting/0598f97f-4906-4961-a881-a12ec75bde3d/page/GzUdC',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            onPageStarted: (url) {},
          ),
        ),
      ],
    );
  }
}
