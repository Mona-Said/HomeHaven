import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light = ThemeData(
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: HexColor('#F5F5F5'),
    appBarTheme: AppBarThemeData(
      elevation: 0.0,
      backgroundColor: HexColor('#F5F5F5'),
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: HexColor('#156651')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: HexColor('#156651'),
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed),
    colorSchemeSeed: HexColor('#156651'));
