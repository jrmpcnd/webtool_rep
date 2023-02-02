import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webtool_rep/UI/screens/homepage/homepage.dart';
import 'package:webtool_rep/UI/utils/constant.dart';

import '../../utils/edge_insect.dart';
import '../../utils/text_styles.dart';

class buildCard extends StatefulWidget {
  const buildCard({Key? key}) : super(key: key);

  @override
  State<buildCard> createState() => _buildCardState();
}

class _buildCardState extends State<buildCard> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Container(
        width: 430,
        height: 250,
        padding: kEdgeInsetsAllSNormal,
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Container(
              height: 60,
              padding: kEdgeInsetsAllSNormal,
              child: TextField(
                style: kTextStyle,
                autocorrect: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: kSecondaryColor2,
                  ),
                  hintText: 'Username',
                  hintStyle: kHintStyle,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor2),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              padding: kEdgeInsetsAllSNormal,
              child: TextField(
                style: kTextStyle,
                obscureText: _isObscure,
                autocorrect: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: kSecondaryColor2,
                  ),
                  suffixIcon: IconButton(
                      color: kSecondaryColor2,
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                  hintText: 'Password',
                  hintStyle: kHintStyle,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor2),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 15.0, left: 9.0, right: 9.0),
                    child: Container(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kDarkGreenColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: kEdgeInsetsAllTiny,
                          child: Text(
                            'Log In',
                            style: GoogleFonts.roboto(
                                fontSize: 18, color: kWhiteColor),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
