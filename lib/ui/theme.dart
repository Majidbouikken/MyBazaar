import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }

  static ThemeData lightTheme = ThemeData(
    cardColor: ThemeColors.cardColor,
    backgroundColor: ThemeColors.backgroundColor,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: ThemeColors.textColor
        ),
      headline2: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: ThemeColors.textColor
      ),
      headline3: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: ThemeColors.textColor
      ),
      headline4: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: ThemeColors.textColor
      ),
    ),
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}

// Colors
class ThemeColors {
  static const Color primaryColor = Color(0xFF7091F8);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color cardColor = Color(0xFFF4F4F4);
  static const Color textColor = Color(0xFF0D1C2E);
  static const Color red = Color(0xFFEF3737); //
}
