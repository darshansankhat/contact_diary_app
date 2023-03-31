import 'package:contact_diary_app/Scrrens/Add_contact_scrren.dart';
import 'package:contact_diary_app/Scrrens/Home_scrren.dart';
import 'package:contact_diary_app/Scrrens/Serch_scrren.dart';
import 'package:contact_diary_app/Splash_scrren/Splash_scrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Splash_scrren(),
        "home": (context) => Home_scrren(),
        "search": (context) => Search_scrren(),
        "add": (context) => Add_contact(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
