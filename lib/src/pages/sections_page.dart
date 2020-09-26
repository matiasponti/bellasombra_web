import 'package:bellasombra_web/src/pages/about_section.dart';
import 'package:bellasombra_web/src/pages/films_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animate_do/animate_do.dart';

class SectionsPage extends StatefulWidget {
  SectionsPage({this.pageItem});
  var pageItem;
  @override
  _SectionsPageState createState() => _SectionsPageState();
}

enum pageItem { about, directors, partners, films }

class _SectionsPageState extends State<SectionsPage> {
  pageItem _pageIndex;

  @override
  void initState() {
    // TODO: implement initState
    _pageIndex = widget.pageItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/foto-bellasombra.jpg'))),
          ),
          _whiteScreen(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ZoomIn(
                  delay: Duration(milliseconds: 100),
                  duration: Duration(milliseconds: 1500),
                  child: Column(
                    children: <Widget>[
                      MediaQuery.of(context).size.width < 600
                          ? _menu()
                          : _bigmenu(),
                      Expanded(child: _content()),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }

  Widget _whiteScreen() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
        ));
  }

  Widget _pageSelector() {
    switch (_pageIndex) {
      case pageItem.about:
        return AboutSection();
      case pageItem.directors:
        return Container();
      case pageItem.partners:
        return Container();
      case pageItem.films:
        return FilmsSection();
    }
    // return _pageZero();
    return Container();
  }

  Widget _menu() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.popAndPushNamed(context, 'home'),
          child: Container(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Image(
                width: 150,
                height: 150,
                image: AssetImage('images/bellasombra-logo.png'),
              ),
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              _itemMenu('About', () {
                setState(() {
                  _pageIndex = pageItem.about;
                  _content();
                });
              }),
              SizedBox(
                height: 5.0,
              ),
              _itemMenu('Films', () {
                setState(() {
                  _pageIndex = pageItem.films;
                  _content();
                });
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bigmenu() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.popAndPushNamed(context, 'home'),
          child: Container(
            child: Hero(
              tag: 'sections',
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Image(
                  width: 150,
                  height: 150,
                  image: AssetImage('images/bellasombra-logo.png'),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _itemMenu('About', () {
                setState(() {
                  _pageIndex = pageItem.about;
                  _content();
                });
              }),
              SizedBox(
                width: 30.0,
              ),
              _itemMenu('Films', () {
                setState(() {
                  _pageIndex = pageItem.films;
                  _content();
                });
              }),
            ],
          ),
        ),
      ],
    );
  }

  _itemMenu(name, function) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: GestureDetector(
          onTap: function,
          child: AutoSizeText(name,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0),
              )),
        ),
      ),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: _pageSelector(),
        width: MediaQuery.of(context).size.width < 400
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.70,
      ),
    );
  }
}
