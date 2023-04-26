import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/screens/login/login_screen.dart';
import 'package:webtool_rep/core/providers/Provider.dart';
import 'package:webtool_rep/core/providers/cardprovider.dart';
import 'package:webtool_rep/core/providers/data_provider.dart';
import 'UI/utils/constant.dart';
import 'UI/utils/web_webview.dart';
import 'core/providers/timer_provider.dart';


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
        ChangeNotifierProvider(create: (context) => Prov6()),
        ChangeNotifierProvider(create: (context) => Listofuse_Device()),
        ChangeNotifierProvider(create: (context) => Prov7()),
        ChangeNotifierProvider(create: (context) => Prov8()),
        ChangeNotifierProvider(create: (context) => Prov9()),
        ChangeNotifierProvider(create: (context) => Prov10()),
        ChangeNotifierProvider(create: (context) => Prov11()),
        ChangeNotifierProvider(create: (context) => Prov12()),
        ChangeNotifierProvider(create: (context) => Prov13()),
        ChangeNotifierProvider(create: (context) => Prov14()),
        ChangeNotifierProvider(create: (context) => Prov15()),
        ChangeNotifierProvider(create: (context) => Prov16()),
        ChangeNotifierProvider(create: (context) => Prov17()),
        ChangeNotifierProvider(create: (context) => Prov18()),
        ChangeNotifierProvider(create: (context) => Prov19()),
        ChangeNotifierProvider(create: (context) => Prov20()),
        ChangeNotifierProvider(create: (context) => Prov21()),
        ChangeNotifierProvider(create: (context) => AtmLocation()),
        ChangeNotifierProvider(create: (context) => Banknews_U()),
        ChangeNotifierProvider(create: (context) => ProductandServices_U()),
        ChangeNotifierProvider(create: (context) => Servicedowntime_U()),
        ChangeNotifierProvider(create: (context) => Institution_U()),
        ChangeNotifierProvider(create: (context) => Branch_U()),
        ChangeNotifierProvider(create: (context) => Unit_U()),
        ChangeNotifierProvider(create: (context) => Center_U()),
        ChangeNotifierProvider(create: (context) => Providers_U()),
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
      ],
      child: MaterialApp(
        title: 'Konek2CARD PLUS Webtool',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kWhiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: kWhiteColor),
          canvasColor: kSecondaryColor2,
        ),
        home: Loginpage(),
      ),
    );
  }
}
