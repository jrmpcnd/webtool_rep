import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/spacing.dart';

class eLoadtransaction extends StatefulWidget {
  const eLoadtransaction({Key? key}) : super(key: key);

  @override
  State<eLoadtransaction> createState() => _eLoadtransactionState();
}

class _eLoadtransactionState extends State<eLoadtransaction> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          verticalSpaceRegular,
          SizedBox(
            height: 530,
            child: WebView(
              initialUrl:
                  'https://datastudio.google.com/embed/reporting/158dd32f-abd9-4a58-90bc-831f718c4ac9/page/6XIeC',
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
