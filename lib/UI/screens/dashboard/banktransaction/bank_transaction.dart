import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/spacing.dart';

class Banktransaction extends StatefulWidget {
  const Banktransaction({Key? key}) : super(key: key);

  @override
  State<Banktransaction> createState() => _BanktransactionState();
}

class _BanktransactionState extends State<Banktransaction> {
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
                'https://flutter.dev/?gclid=EAIaIQobChMIosO9jL7K-gIV0RxyCh1g-QvIEAAYASAAEgJA4vD_BwE&gclsrc=aw.ds',
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
