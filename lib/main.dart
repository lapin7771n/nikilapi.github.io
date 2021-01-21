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
            height: 1.2,
            fontSize: 98,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF001427),
          ),
          headline2: TextStyle(
            fontFamily: 'WorkSans',
            height: 1.2,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF001427),
          ),
          headline3: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 22,
            height: 1.4,
            color: const Color(0xFF001427),
          ),
          headline4: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 22,
            height: 1.4,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF001427),
          ),
          bodyText1: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 16,
            height: 1.2,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          bodyText2: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 20,
            height: 1.2,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF001427),
          ),
          subtitle1: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 20,
            height: 1.2,
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
