import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/screens/pages/about_me_page.dart';
import 'package:portafolio/screens/pages/contact_page.dart';
import 'package:portafolio/screens/pages/hello_page.dart';
import 'package:portafolio/screens/pages/portflio_page.dart';
import 'package:portafolio/service/scroll_service.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {}); // Must call setState
      });
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {});
    final scrollService = Provider.of<ScrollAnimService>(context);

    final size = MediaQuery.of(context).size;

    return FancyDrawerWrapper(
      drawerPadding: EdgeInsets.only(right: 130, left: 30),
      backgroundColor: Color(0xff0C0C0D),
      itemGap: 10,
      drawerItems: <Widget>[
        tituloCustom2('Hola', 0),
        tituloCustom2('Acerca de mi', 1),
        tituloCustom2('Portafolio', 2),
        tituloCustom2('Contactame', 3),
      ],
      controller: _controller,
      child: Scaffold(
        backgroundColor: Color(0xff131313),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                height: 1000,
                width: 1000,
                child: Image(
                  image: AssetImage("assets/images/io.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(.75), Colors.black])),
              ),
            ),
            PageView(
              onPageChanged: !scrollService.isScroll
                  ? (value) {
                      scrollService.paginaActual = value;
                    }
                  : null,
              controller: scrollService.pageController,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                HelloPage(),
                AboutMePage(),
                PortfolioPage(),
                ContactPage(),
              ],
            ),
            Column(
              mainAxisAlignment: size.width >= 600
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: size.width >= 600 ? 45 : 15,
                      bottom: size.width >= 600 ? 0 : 70),
                  child: SmoothPageIndicator(
                    count: 4,
                    axisDirection: Axis.vertical,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFFC1874C),
                        dotColor: Color(0xFFababab),
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5),
                    controller: scrollService.pageController,
                  ),
                ),
              ],
            ),
            size.width >= 600 ? header() : headerPhone(),
          ],
        ),
      ),
    );
  }

  Widget tituloCustom2(String titulo, int toPage) {
    final animService = Provider.of<ScrollAnimService>(context);
    return AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(
              animService.paginaActual == toPage ? 0xffC1874C : 0xff0C0C0D),
        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: TextButton(
          style: ButtonStyle(
              animationDuration: Duration(milliseconds: 2000),
              overlayColor: MaterialStateProperty.all(Color(0xff131313))),
          onPressed: () {
            animService.paginaActual = toPage;
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(titulo,
                style: GoogleFonts.quicksand(
                    color: Colors.white, fontWeight: FontWeight.normal)),
          ),
        ));
  }

  Widget tituloCustom(String titulo, int toPage) {
    final animService = Provider.of<ScrollAnimService>(context);
    return AnimatedContainer(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              animService.paginaActual == toPage ? 10 : 5),
          color: Color(
              animService.paginaActual == toPage ? 0xffC1874C : 0xff232324),
        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: TextButton(
          style: ButtonStyle(
              animationDuration: Duration(milliseconds: 2000),
              overlayColor: MaterialStateProperty.all(Color(0xff131313))),
          onPressed: () {
            animService.paginaActual = toPage;
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(titulo,
                style: GoogleFonts.quicksand(
                    color: Colors.white, fontWeight: FontWeight.normal)),
          ),
        ));
  }

  Container header() {
    return Container(
      height: 60,
      padding: EdgeInsets.only(right: 40),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.black,
        Colors.black,
      ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          tituloCustom('Hola', 0),
          tituloCustom('Acerca de mi', 1),
          tituloCustom('Portafolio', 2),
          tituloCustom('Contactame', 3),
        ],
      ),
    );
  }

  Container headerPhone() {
    return Container(
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.black,
        Colors.black,
      ])),
      child: GestureDetector(
          onTap: animatedIcon,
          child: Container(
            width: 50,
            height: 50,
            child: Center(
              child: Icon(Icons.menu, color: Colors.white),
            ),
          )),
    );
  }

  void animatedIcon() {
    setState(() {
      _controller.open();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
