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
        Container(
          height: 650,
          child: WebView(
            initialUrl:
                'https://datastudio.google.com/embed/reporting/158dd32f-abd9-4a58-90bc-831f718c4ac9/page/6XIeC',
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
