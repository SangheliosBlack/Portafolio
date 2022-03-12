import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/service/scroll_service.dart';
import 'package:provider/provider.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final scrollService = Provider.of<ScrollAnimService>(context);

    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: size.width >= 600 ? 100 : 50),
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30, bottom: 30),
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: size.width >= 600
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [iconosRedes()]),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hola, My Nombre es',
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text('Julio Villagrana',
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            color: Color(0xffC1874C),
                            height: 2,
                          ),
                          SizedBox(width: 10),
                          Text('Desarrollador Frelance',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    primary: Colors.white),
                                onPressed: () {
                                  scrollService.paginaActual = 2;
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text('Portafolio',
                                      style: GoogleFonts.raleway(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                )),
                            SizedBox(width: 20),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    onSurface: Colors.red,
                                    primary: Color(0xff121212)),
                                onPressed: () {
                                  scrollService.paginaActual = 3;
                                },
                                child: Text('Contacto',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 20,
                  child: Row(
                    children: [
                      Text(
                        'Construido con ',
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                      Container(
                        child: FlutterLogo(
                          duration: Duration(milliseconds: 1000),
                          textColor: Colors.white,
                          style: FlutterLogoStyle.horizontal,
                          size: 70,
                          curve: Curves.bounceOut,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget iconosRedes() {
    return Column(
      children: [
        iconCustom(FontAwesomeIcons.youtube),
        iconCustom(FontAwesomeIcons.tiktok),
        iconCustom(FontAwesomeIcons.instagram),
        iconCustom(FontAwesomeIcons.github)
      ],
    );
  }

  Widget iconCustom(IconData iconData) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: IconButton(
          hoverColor: Color(0xffC1874C),
          color: Colors.white,
          splashRadius: 30,
          icon: Icon(iconData),
          onPressed: () {},
        ));
  }
}
