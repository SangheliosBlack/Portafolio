import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width >= 600 ? 0 : 70),
      color: Color(0xff131313),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: size.width >= 600 ? 15 : 5),
                  child: Text('Contacto',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35)),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.width >= 600 ? 80 : 10),
                  child: Text('Encuentrame en',
                      style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20)),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.width >= 600 ? 30 : 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Color(0xff1C1C1C),
            child: Center(
              child: Text(
                '© Copyright JVM 2023. All rights reserved',
                style: GoogleFonts.quicksand(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
