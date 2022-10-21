import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webtool_rep/UI/utils/responsive.dart';
import '../../utils/constant.dart';
import 'card_login_page.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTertiaryColor5,
      body: SingleChildScrollView(
        child: Responsive(
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/kplus.png',
                    width: 500.0,
                  ),
                  Text(
                    'Use your registered username and password to sign in. To have an account \n or have some problems, please contact our support team.',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 250),
                  buildCard(),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        '©CARD Bank | Version 1.0. build 20150704.1727',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ],
          ),
          mobile: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/kplus.png',
                    width: 400.0,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Use your registered username and password to sign in.\nTo have an account or have some problems,\nplease contact our support team.',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 50),
                  buildCard(),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '©CARD Bank | Version 1.0. build 20150704.1727',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
