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
                  margin: EdgeInsets.only(bottom: size.width >= 600 ? 25 : 10),
                  child: Text('Contacto',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: size.width >= 600 ? 40 : 20),
                  child: Text('Saludame! ',
                      style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: [
                      Container(
                          constraints: BoxConstraints(
                              maxWidth: size.width >= 600 ? 210 : size.width,
                              minWidth: size.width >= 600 ? 210 : size.width),
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(15),
                              hintText: 'Nombre',
                              hintStyle: GoogleFonts.quicksand(
                                  color: Color(0xff66676B)),
                              filled: true,
                              fillColor: Color(0xff1A1A1A),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Color(0xff66676B), width: .5)),
                            ),
                          )),
                      Container(
                          constraints: BoxConstraints(
                              maxWidth: size.width >= 600 ? 220 : size.width,
                              minWidth: size.width >= 600 ? 220 : size.width),
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Correo electronico',
                              contentPadding: EdgeInsets.all(15),
                              hintStyle: GoogleFonts.quicksand(
                                  color: Color(0xff66676B)),
                              filled: true,
                              fillColor: Color(0xff1A1A1A),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Color(0xff66676B), width: .5)),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: 520,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Asunto',
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        hintStyle:
                            GoogleFonts.quicksand(color: Color(0xff66676B)),
                        filled: true,
                        fillColor: Color(0xff1A1A1A),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                color: Color(0xff66676B), width: .5)),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    width: 520,
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Mensaje',
                        hintStyle:
                            GoogleFonts.quicksand(color: Color(0xff66676B)),
                        filled: true,
                        fillColor: Color(0xff1A1A1A),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                color: Color(0xff66676B), width: .5)),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.white),
                    onPressed: () {},
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('Enviar',
                          style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )),
                Container(
                  margin: EdgeInsets.only(top: size.width >= 600 ? 80 : 20),
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
                '© Copyright JVM 2021. All rights reserved',
                style: GoogleFonts.quicksand(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
