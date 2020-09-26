import 'dart:html' as html;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmsSection extends StatefulWidget {
  @override
  _FilmsSectionState createState() => _FilmsSectionState();
}

class _FilmsSectionState extends State<FilmsSection> {
  List<Map<String, dynamic>> _films = [
    {
      'Title': 'Ausencia de mi',
      'Image': 'assets/images/ausenciademi.jpg',
      'Director': 'Melina Terribili',
      'Año': 2018,
      'trailer': 'https://www.youtube.com/watch?v=dEA_M0SRWdg',
      'Genero': 'Documentary'
    },
    {
      'Title': 'Corte',
      'Image': 'assets/images/corte.jpg',
      'Director': 'Guadalupe Yepes',
      'Año': 2020,
      'trailer': null,
      'Genero': 'Drama'
    },
    {
      'Title': 'Los 120, la brigada del café',
      'Image': 'assets/images/los120.jpg',
      'Director': 'María Laura Vásquez',
      'Año': 2018,
      'trailer': 'https://www.youtube.com/watch?v=nVAJXTa7YNo&t=10s',
      'Genero': 'Documentary'
    },
    {
      'Title': 'Primer round',
      'Image': 'assets/images/primerRound.jpg',
      'Director': 'Guadalupe Yepes',
      'Año': 2018,
      'trailer': 'https://www.youtube.com/watch?v=kJpQC-iZ8jE',
      'Genero': 'Fiction'
    },
    {
      'Title': 'Reconocimiento',
      'Image': 'assets/images/reconocimiento.jpg',
      'Director': 'Celina Font',
      'Año': 2016,
      'trailer': 'https://www.youtube.com/watch?v=IgAi3nhaNVQ',
      'Genero': 'Drama'
    },
    {
      'Title': 'Reset',
      'Image': 'assets/images/reset.png',
      'Director': 'Alejandro Hartmann',
      'Año': 2020,
      'trailer': 'https://www.youtube.com/watch?v=DVFNN3Vx9Qg',
      'Genero': 'Documentary'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Expanded(child: filmSwiper())],
      ),
    );
  }

  Widget filmSwiper() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width < 500
            ? MediaQuery.of(context).size.width * 1
            : MediaQuery.of(context).size.width * 0.50,
        child: Swiper(
            autoplay: true,
            pagination: SwiperPagination(
                alignment: MediaQuery.of(context).size.width < 500
                    ? Alignment.bottomCenter
                    : Alignment.center,
                margin: EdgeInsets.only(
                    top:
                        MediaQuery.of(context).size.width < 500 ? 0.0 : 130.0)),
            scale: MediaQuery.of(context).size.width < 400 ? 0.8 : 0.6,
            viewportFraction:
                MediaQuery.of(context).size.width < 500 ? 0.9 : 0.3,
            itemBuilder: (context, index) {
              return _movieImage(index);
            },
            itemCount: _films.length),
      ),
    );
  }

  _movieImage(index) {
    return MouseRegion(
      cursor: SystemMouseCursors.grabbing,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showInfo(
                _films[index]['Title'],
                _films[index]['Director'],
                _films[index]['Año'].toString(),
                _films[index]['Genero'],
                _films[index]['trailer']),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(_films[index]['Image']),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(_films[index]['Title'],
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width < 400
                            ? 12.0
                            : 18.0))),
          ),
        ],
      ),
    );
  }

  _showInfo(name, director, year, genre, url) {
    showDialog(
      context: context,
      builder: (context) {
        return ZoomIn(
          child: MovieInformation(
            name: name,
            director: director,
            year: year,
            genre: genre,
            url: url,
          ),
        );
      },
    );
  }
}

class MovieInformation extends StatefulWidget {
  MovieInformation({this.name, this.director, this.year, this.genre, this.url});

  String name;
  String director;
  String url;
  String genre;
  String year;

  @override
  _MovieInformationState createState() => _MovieInformationState();
}

class _MovieInformationState extends State<MovieInformation> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          width: MediaQuery.of(context).size.width < 500
              ? MediaQuery.of(context).size.width * 0.95
              : MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(widget.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 25.0
                                            : 25.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text('Director: ' + widget.director,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 22.0
                                            : 22.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('Genre: ' + widget.genre,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 22.0
                                            : 22.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('Year: ' + widget.year,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 22.0
                                            : 22.0))),
                      ),
                      widget.url != null && widget.url != ''
                          ? Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    html.window.open(widget.url, 'Dummy');
                                  },
                                  child: Text('Trailer',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 25.0
                                                  : 25.0)))))
                          : Container(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                right: 20.0,
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.0,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
