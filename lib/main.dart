import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nikilapi_web/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nikita Lapin',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF7EF),
        primaryColor: const Color(0xFF708D81),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'WorkSans',
            height: 1.1,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF001427),
          ),
          bodyText1: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 22,
            height: 1.1,
            color: const Color(0xFF001427),
          ),
          bodyText2: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 22,
            height: 1.1,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF001427),
          ),
          subtitle1: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 20,
            height: 1.1,
            fontWeight: FontWeight.w300,
            color: const Color(0x99001427),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
