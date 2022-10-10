import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/cardprovider.dart';
import 'UI/screens/homepage/homepage.dart';
import 'UI/utils/constant.dart';
import 'UI/utils/web_webview.dart';

void main() {
  WebViewWebImplementation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cardprovider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Konek2CARD PLUS Webtool',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kWhiteColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: kSecondaryColor2,
          ),
          home: HomePage()),
    );
  }
}
