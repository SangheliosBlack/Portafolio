import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController =
        PageController(viewportFraction: 0.85, initialPage: 0);
    final size = MediaQuery.of(context).size;
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(
        vertical: 40,
      ),
      color: Color(0xff131313),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: size.width >= 600 ? 100 : 40),
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
                    Text('Mi trabajo',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Text('Portafolio',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [itemShow(false), itemShow(false), itemShow(false)],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, positon) => itemShow(true),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container itemShow(bool gold) {
    return Container(
      constraints: BoxConstraints(minWidth: 500),
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: 500,
      height: 200,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                !gold ? Color(0xff6D6E71) : Color(0xffCDAB98),
                Color(0xff1E1E21),
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pendiente',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 23),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: FaIcon(
                          FontAwesomeIcons.globe,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: FaIcon(FontAwesomeIcons.github,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            'En construccion',
            style:
                GoogleFonts.quicksand(color: Color(0xffC9C7C9), fontSize: 13),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'En construccion',
              style: GoogleFonts.quicksand(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
