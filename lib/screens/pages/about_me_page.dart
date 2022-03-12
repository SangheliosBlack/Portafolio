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
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              height: size.height - 80,
              width: size.width <= 600 ? size.width - 80 : null,
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          image: NetworkImage(
                            'https://personalprojectjvm2011.s3.us-west-1.amazonaws.com/me.jpg',
                          ),
                          fit: BoxFit.cover,
                          placeholder:
                              AssetImage('assets/images/placeholder.jpg'),
                        )),
                  ),
                  size.width <= 600
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Text('Acerca de mi',
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Quien soy',
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 35)),
                              Container(
                                  constraints: BoxConstraints(
                                      maxHeight: size.height - 372,
                                      minHeight: size.height - 372),
                                  margin: EdgeInsets.only(top: 5),
                                  child: SingleChildScrollView(
                                    child: Text(
                                        'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.¿Por qué lo usamos?Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las',
                                        overflow: TextOverflow.clip,
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white,
                                            fontSize:
                                                size.width >= 600 ? 13 : 11,
                                            height: 1.7)),
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.8),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 19.2,
                                      sigmaY: 19.2,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      width: double.infinity,
                                      height: 60,
                                      child: PageView(
                                        controller: pageController,
                                        scrollDirection: Axis.horizontal,
                                        children: getTecnologys(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SmoothPageIndicator(
                                  count: lista.length,
                                  axisDirection: Axis.horizontal,
                                  effect: ExpandingDotsEffect(
                                      activeDotColor: Colors.white,
                                      dotColor: Color(0xFFababab),
                                      dotHeight: 5,
                                      dotWidth: 5,
                                      spacing: 3),
                                  controller: pageController,
                                ),
                              ),
                              btnCv(),
                            ],
                          ),
                        )
                      : Positioned(
                          bottom: 19.2,
                          left: 19.2,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.8),
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 19.2,
                                    sigmaY: 19.2,
                                  ),
                                  child: Container(
                                      height: 36,
                                      padding: EdgeInsets.only(
                                          left: 16.72, right: 14.4),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Icon(Icons.place,
                                              color: Colors.white),
                                          SizedBox(width: 9.52),
                                          Text("Cascadas de Tuliman, Puebla",
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 16.8))
                                        ],
                                      )))))
                ],
              ),
            ),
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
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                            'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.¿Por qué lo usamos?Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las',
                            style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontSize: 13,
                                height: 1.7))),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Color(0xff2A2A2A),
                          borderRadius: BorderRadius.circular(5)),
                      child: Wrap(
                        spacing: 50,
                        runSpacing: 20,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: getTecnologys(),
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
