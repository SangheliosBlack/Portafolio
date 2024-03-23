import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/service/scroll_service.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final scrollService = Provider.of<ScrollAnimService>(context);

    return Container(
      padding: EdgeInsets.only(left: size.width >= 600 ? 100 : 30),
      width: double.infinity,
      child: Stack(
        children: [
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
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.hatCowboySide,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Monterrey, NL, MX",
                      style: GoogleFonts.quicksand(color: Colors.grey),
                    )
                  ],
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
                    size.width > 600
                        ? Text(
                            'Web Designer & Mobile Aplication Developer Full Stack',
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15))
                        : Text(
                            'Web Designer & Mobile Aplication \n Developer Full Stack',
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
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.white),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            backgroundColor: Color(0xff121212),
                          ),
                          onPressed: () {
                            scrollService.paginaActual = 3;
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text('Contacto',
                                style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            child: PrettyQr(
              roundEdges: true,
              data: 'https://github.com/SangheliosBlack',
              errorCorrectLevel: QrErrorCorrectLevel.H,
              elementColor: Colors.white,
              size: 100,
            ),
          ),
          Positioned(
            left: 0,
            bottom: size.width >= 600 ? 20 : 0,
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
          Container(
            margin: EdgeInsets.only(
                right: size.width >= 600 ? 30 : 0,
                bottom: size.width >= 600 ? 30 : 0),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: size.width >= 600
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: iconosRedes()),
          ),
        ],
      ),
    );
  }

  List<Widget> iconosRedes() {
    return [
      iconCustom(
        titulo: "4741030509",
        iconData: FontAwesomeIcons.whatsapp,
        link:
            'https://api.whatsapp.com/send/?phone=4741030509&text=Hola+Julio+te%20hablo+desde+tu+potafolio+web!&type=phone_number&app_absent=0',
      ),
      iconCustom(
          titulo: "juliosdfghjk",
          iconData: FontAwesomeIcons.instagram,
          link: 'https://www.instagram.com/juliosdfghjk/'),
      iconCustom(
          titulo: "SangheliosBlack",
          iconData: FontAwesomeIcons.github,
          link: 'https://github.com/SangheliosBlack'),
      iconCustom(
          titulo: "Julio Villagrana",
          iconData: FontAwesomeIcons.linkedinIn,
          link: 'https://www.linkedin.com/in/julio-villagrana-792014217/')
    ];
  }

  Widget iconCustom(
      {required IconData iconData,
      required String titulo,
      required String link}) {
    return Container(
      width: 70,
      height: 70,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2000.0)),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            launchUrl(Uri.parse(link));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: IconButton(
              hoverColor: Color(0xffC1874C),
              color: Colors.white,
              tooltip: titulo,
              splashRadius: 20,
              icon: Icon(iconData),
              onPressed: () {
                launchUrl(Uri.parse(link));
              },
            ),
          )),
    );
  }
}
