import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UI/screens/homepage/homepage.dart';
import 'UI/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Konek2CARD PLUS Webtool',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kWhiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: kSecondaryColor2,
        ),
        home: HomePage());
  }
}
