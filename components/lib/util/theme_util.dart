import 'package:flutter/material.dart';

import '../hexa_color.dart';

Map<int, Color> primaryColorCodes = HexColor.getSwatch(HexColor("#FF1493"));
Map<int, Color> accentColorCodes = HexColor.getSwatch(HexColor("#5F04B4"));

MaterialColor primaryColorMaterial =
    MaterialColor(HexColor.getColorFromHex("#FF1493"), primaryColorCodes);
MaterialColor accentColorMaterial =
    MaterialColor(HexColor.getColorFromHex("#5F04B4"), accentColorCodes);

ThemeData themeData = ThemeData(
  primaryColor: primaryColorMaterial,
  accentColor: accentColorMaterial,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 42,
      fontFamily: "Architects Daughter",
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      fontSize: 32,
      fontFamily: "Architects Daughter",
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      fontSize: 16,
      fontFamily: "Montserrat",
    ),
    headline4: TextStyle(
      fontSize: 12,
      fontFamily: "Montserrat",
      color: Colors.red,
    ),
    headline5: TextStyle(
      fontSize: 16,
      fontFamily: "Architects Daughter",
    ),
  ),
);

class ThemeUtil {
  static Color getPrimaryColor() => themeData.primaryColor;

  static Color getAccentColor() => themeData.accentColor;

  static TextStyle getHeadline1() => themeData.textTheme.headline1;

  static TextStyle getHeadline2() => themeData.textTheme.headline2;

  static TextStyle getHeadline3() => themeData.textTheme.headline3;

  static TextStyle getHeadline4() => themeData.textTheme.headline4;

  static TextStyle getHeadline5() => themeData.textTheme.headline5;

  static ThemeData getThemeData() => themeData;
}
