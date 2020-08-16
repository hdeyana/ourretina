import 'package:app/app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final main = ThemeData(
    primaryColor: OurRetinaColors.mainGreen,
    canvasColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 18,
          color: OurRetinaColors.mainGreen,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
    ),
    textTheme: GoogleFonts.ibmPlexSerifTextTheme(),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: OurRetinaColors.mainGreen,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.grey[300],
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.grey[300],
        ),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
