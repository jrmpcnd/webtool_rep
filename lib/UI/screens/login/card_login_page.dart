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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 1)),
          ],
        ),
        width: 430,
        height: 300,
        padding: kEdgeInsetsAllSNormal,
        child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30.0),
          Container(
            width: 350,
            child: TextField(
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.green,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.blueGrey[100],
                filled: true,
                labelStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                child: TextField(style: TextStyle(color: Colors.black),
                  obscureText: _isObscure,
                  autocorrect: true,
                  decoration: InputDecoration(
                   hintText: 'Enter Your Password',
                    hintStyle: TextStyle(color: Colors.grey[500],),
                    fillColor: Colors.blueGrey[100],
                    filled: true,
                    labelStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.only(left: 30),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
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
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Column(
                children: [
                  Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.green[500],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
