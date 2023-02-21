import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import 'package:webtool_rep/core/providers/cardprovider.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import 'UI/screens/homepage/homepage.dart';
import 'UI/screens/login/login_screen.dart';
import 'UI/utils/constant.dart';
import 'UI/utils/web_webview.dart';

void main() {
  WebViewWebImplementation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cardprovider()),
        ChangeNotifierProvider(create: (context) => Prov()),
        ChangeNotifierProvider(create: (context) => H_Prov()),
        ChangeNotifierProvider(create: (context) => Remittance_L()),
        ChangeNotifierProvider(create: (context) => Prov1()),
        ChangeNotifierProvider(create: (context) => Prov3()),
        ChangeNotifierProvider(create: (context) => Prov5()),
      ],
      child: MaterialApp(
          title: 'Konek2CARD PLUS Webtool',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kWhiteColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: kWhiteColor),
            canvasColor: kSecondaryColor2,
          ),
          home: Loginpage()),
    );
  }
}
