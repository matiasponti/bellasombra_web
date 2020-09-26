import 'package:bellasombra_web/src/pages/home_page.dart';
import 'package:bellasombra_web/src/pages/sections_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bellasombra Films',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'sections': (BuildContext context) => SectionsPage(),
      },
    );
  }
}
