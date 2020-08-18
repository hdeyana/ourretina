import 'package:app/app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final main = ThemeData(
    primaryColor: OurRetinaColors.mainGreen,
    canvasColor: OurRetinaColors.greenCanvas,
    appBarTheme: AppBarTheme(
      color: OurRetinaColors.greenCanvas,
      elevation: 0,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: GoogleFonts.dmSerifDisplay(
          fontSize: 18,
          color: OurRetinaColors.mainGreenDark,
        ),
      ),
      iconTheme: IconThemeData(
        color: OurRetinaColors.mainGreenDark,
      ),
    ),
    textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
      headline1: GoogleFonts.dmSerifDisplay(
        fontSize: 48,
        color: OurRetinaColors.mainGreenDark,
      ),
      headline2: GoogleFonts.dmSerifDisplay(
        fontSize: 36,
        color: OurRetinaColors.mainGreenDark,
      ),
      headline3: GoogleFonts.dmSerifDisplay(
        fontSize: 24,
        color: OurRetinaColors.mainGreenDark,
      ),
      headline4: GoogleFonts.dmSerifDisplay(
        fontSize: 18,
        color: OurRetinaColors.mainGreenDark,
      ),
      headline5: GoogleFonts.dmSerifDisplay(
        fontSize: 16,
        color: OurRetinaColors.mainGreenDark,
      ),
      headline6: GoogleFonts.dmSerifDisplay(
        fontSize: 14,
        color: OurRetinaColors.mainGreenDark,
      ),
      bodyText1: GoogleFonts.nunitoSans(
        color: OurRetinaColors.mainGreenText,
      ),
      bodyText2: GoogleFonts.nunitoSans(
        color: OurRetinaColors.mainGreenText,
      ),
      subtitle1: GoogleFonts.nunitoSans(
        color: OurRetinaColors.mainGreenText,
      ),
    ),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary, buttonColor: OurRetinaColors.mainGreenDark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
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
