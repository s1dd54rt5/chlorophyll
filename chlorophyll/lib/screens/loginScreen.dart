import 'package:chlorophyll/constants/svgConst.dart';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: -120,
            top: -120,
            child: Container(
              height: s.hHelper(50),
              width: s.hHelper(50),
              decoration: BoxDecoration(
                color: secondaryGreen,
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: s.hHelper(15),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: s.hHelper(3),
                ),
                width: double.infinity,
                height: s.hHelper(30),
                child: SvgPicture.asset(
                  logo,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: s.hHelper(10),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: s.wHelper(10),
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(text: 'Chlorophy'),
                      TextSpan(
                        text: 'll',
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).primaryColor,
                          fontSize: s.wHelper(10),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: s.hHelper(5),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: s.wHelper(5),
                ),
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: s.wHelper(5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: s.hHelper(1),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: s.wHelper(5),
                ),
                child: Text(
                  'To get started, sign in with Google',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: s.wHelper(5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: s.wHelper(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: s.hHelper(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffdedede),
                            blurRadius: 7,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        'Google Sign In',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: s.wHelper(5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
