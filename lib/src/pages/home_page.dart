import 'package:bellasombra_web/src/pages/sections_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cursor/flutter_cursor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/foto-bellasombra.jpg'))),
      ),
      _whiteScreen(),
      Align(
        alignment: Alignment.center,
        child: _menu(),
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text('BELLASOMBRA FILMS',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500))),
        ),
      )
    ]));
  }

  Widget _whiteScreen() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
        ));
  }

  Widget _menu() {
    return ZoomIn(
      delay: Duration(milliseconds: 500),
      duration: Duration(milliseconds: 1500),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.width < 400
            ? MediaQuery.of(context).size.height * 0.50
            : MediaQuery.of(context).size.height * 0.40,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/bellasombra-logo-1.png',
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SectionsPage(
                            pageItem: pageItem.about,
                          )),
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text('About',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width < 400
                                ? 20.0
                                : 26.0),
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SectionsPage(
                            pageItem: pageItem.films,
                          )),
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text('Films',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width < 400
                                ? 20.0
                                : 26.0),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
