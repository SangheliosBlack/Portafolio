import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<dynamic> lista = [
  {'titulo': 'Flutter', 'initial': 4},
  {'titulo': 'Dart', 'initial': 4},
  {'titulo': 'NodeJS', 'initial': 3},
  {'titulo': 'MongoDB', 'initial': 4},
  {'titulo': 'Git', 'initial': 3},
  {'titulo': 'Socket.IO', 'initial': 3},
  {'titulo': 'HTML', 'initial': 4},
  {'titulo': 'Sass', 'initial': 5},
  {'titulo': 'JavaScript', 'initial': 4},
  {'titulo': 'AWS', 'initial': 4},
];

List<Widget> listaW = [];

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 55),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width >= 600 ? 100 : 40, vertical: 30),
        color: Color(0xff131313),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 40, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 2,
                          color: Color(0xffC1874C),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text('ABOUT ME',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Who Am I',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 35)),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  color: Color(0xff2A2A2A),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: getTecnologys(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    btnCv(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container btnCv() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: Color(0xffC1874C)),
          onPressed: () {},
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('DOWNLOAD CV',
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          )),
    );
  }

  List<Widget> getTecnologys() {
    return lista.map((elemento) {
      return technology(elemento['titulo'], elemento['initial']);
    }).toList();
  }

  Widget technology(String titulo, double initial) {
    return Container(
      margin: EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: GoogleFonts.quicksand(color: Colors.white)),
          SizedBox(height: 5),
          RatingBar.builder(
            itemSize: 17,
            initialRating: initial,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemPadding: EdgeInsets.only(right: 4.0),
            itemBuilder: (context, _) => Icon(
              FontAwesomeIcons.circle,
              color: Color(0xffC1874C),
            ),
            onRatingUpdate: (rating) {},
          )
        ],
      ),
    );
  }
}
