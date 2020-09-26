import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  List<Map<String, dynamic>> _descriptions = [
    {
      'description':
          'Content development.\n \nWe know stories. \n\n15 years of experience making films, 15 years of telling the stories that shape our time. And we continue learning. Looking at our past, pushing to our future, working the present. '
    },
    {'description': ' '}
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[_description()],
        ),
      ),
    );
  }

  _description() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white.withOpacity(0.3)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            children: [
              Text(_descriptions[0]['description'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.width < 600
                            ? 16.0
                            : 20.0),
                  )),
              MediaQuery.of(context).size.width < 800
                  ? _contactMobile()
                  : _contact()
            ],
          ),
        ),
      ),
    );
  }

  _contact() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.mail),
                SelectableText('infobellasombra@gmail.com',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 900
                              ? 12
                              : 14.0),
                    )),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.phone),
                SelectableText('+54-911-4045-2869',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 900
                              ? 12
                              : 14.0),
                    )),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.location_on),
                SelectableText('Av. Santa fe 5130, CABA, Argentina.',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 900
                              ? 12
                              : 14.0),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _contactMobile() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.mail),
                SelectableText('infobellasombra@gmail.com',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 900
                              ? 12
                              : 16.0),
                    )),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.phone),
                SelectableText('+54-911-4045-2869',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 900
                              ? 12
                              : 16.0),
                    )),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.location_on),
                SelectableText('Av. Santa fe 5130, CABA, Argentina.',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 900
                              ? 12
                              : 16.0),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
