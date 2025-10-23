import 'package:flutter/material.dart';

class AppColors {
  static const List<Color> backgroundGradient = [
    Color(0xFFFFF8F0),
    Color(0xFFFFF3E8),
    Color(0xFFFFEEDD),
  ];
  static const Color appBarColorOne = Color(0xFF1A1A1A);
  static const Color appBarColorTwo = Color(0xFF2D2D2D);
  static const List<Color> appBarGradient = [appBarColorOne, appBarColorTwo];

  static const Color numbersColorOne = Color(0xFFE74C3C);
  static const Color numbersColorTwo = Color(0xFFEC644B);
  static const List<Color> numbersGradient = [numbersColorOne, numbersColorTwo];

  static const Color familyColorOne = Color(0xFF27AE60);
  static const Color familyColorTwo = Color(0xFF36C775);
  static const List<Color> familyGradient = [familyColorOne, familyColorTwo];

  static const Color colorsColorOne = Color(0xFF9B59B6);
  static const Color colorsColorTwo = Color(0xFFAA6DC2);
  static const List<Color> colorsGradient = [colorsColorOne, colorsColorTwo];

  static const Color phrasesColorOne = Color(0xFF3498DB);
  static const Color phrasesColorTwo = Color(0xFF4AA8E8);
  static const List<Color> phrasesGradient = [phrasesColorOne, phrasesColorTwo];

  static const Color darkBrown = Color(0xFF48302C);
  static const Color brownLight = Color(0xff5d3c37);

  static const Color orange = Colors.orange;
  static const Color aboutColorOne = Color(0xfff09137);
  static const Color aboutColorTwo = Color(0xfff5a855);

  static const Color primaryBlue = Color(0xff0077b5);
  static const Color darkGray = Color(0xFF333333);

  static List<Color> aboutGradient = [iconColor, iconColor2];

  static const Color iconColor = Color(0xFF5DADE2);
  static Color iconColor2 = iconColor.withOpacity(.2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color white70 = Colors.white70;
  static const Color creamColor = Color(0xfffff4db);

  static const Color black = Colors.black;

  static LinearGradient get appBarGradientWidget {
    return LinearGradient(colors: appBarGradient);
  }

  static LinearGradient get aboutGradientWidget {
    return LinearGradient(
      colors: [AppColors.aboutColorOne, AppColors.aboutColorTwo],
    );
  }

  static LinearGradient get backgroundGradientWidget {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: backgroundGradient,
    );
  }
}
