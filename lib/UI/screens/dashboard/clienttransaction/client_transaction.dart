import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/spacing.dart';

class Clienttransaction extends StatefulWidget {
  const Clienttransaction({Key? key}) : super(key: key);

  @override
  State<Clienttransaction> createState() => _ClienttransactionState();
}

class _ClienttransactionState extends State<Clienttransaction> {
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
              initialUrl: 'https://www.google.com/',
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
      ),
    );
  }
}
