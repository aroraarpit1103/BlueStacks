import 'dart:ui';
import 'package:flutter/material.dart';

class AppFonts {
  static const String _futura = "Futura";
  static const String _roboto = "Roboto";

  static const String app_font_family = _futura;
  static const String app_font_family_2 = _roboto;
}

class AppFontSize {
  static const double size24 = 24.0;
  static const double size23 = 23.0;
  static const double size22 = 22.0;
  static const double size21 = 21.0;
  static const double size20 = 20.0;
  static const double size19 = 19.0;
  static const double size18 = 18.0;
  static const double size17 = 17.0;
  static const double size16 = 16.0;
  static const double size15 = 15.0;
  static const double size14 = 14.0;
  static const double size13 = 13.0;
  static const double size12 = 12.0;
  static const double size11 = 11.0;
  static const double size10 = 10.0;
}

class AppFontsStyle {
  static const FontWeight BLACK = FontWeight.w900;
  static const FontWeight EXTRA_BOLD = FontWeight.w800;
  static const FontWeight BOLD = FontWeight.w700;
  static const FontWeight SEMI_BOLD = FontWeight.w600;
  static const FontWeight MEDIUM = FontWeight.w500;
  static const FontWeight REGULAR = FontWeight.w400;
  static const FontWeight LIGHT = FontWeight.w300;
  static const FontWeight EXTRA_LIGHT = FontWeight.w200;
  static const FontWeight THIN = FontWeight.w100;
}

class AppColors {
  static const Color theme_color = Color(0xFF302782);
  static const Color theme_color_light = Color(0x22A7F0F0);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellow = Color(0xFFFFD700);
  static const Color green = Color(0xFF166d20);
  static const Color green_light = Color(0xFF3EB714);
  static const Color tiles_bg = Color(0xFFFFFAE5);
  static const Color transparent = Color(0x00000000);
  static const Color dark_grey = Color(0xff333333);
  static const Color grey = Color(0xffBFBFBF);
  static const Color light_grey = Color(0xff7A7A7A);
  static const Color gradient_color_1 = Color(0xFF4548E0);
  static const Color gradient_color_2 = Color(0xFF0061D2);
  static const Color blue = Color(0xFF187BEF);
  static const Color bg_grey = Color(0xffF5F5F5);

}

class MaterialAppColor{
  static const Map<int, Color> color =
  {
    50:Color.fromRGBO(255,255,255, .1),
    100:Color.fromRGBO(255,255,255, .2),
    200:Color.fromRGBO(255,255,255, .3),
    300:Color.fromRGBO(255,255,255, .4),
    400:Color.fromRGBO(255,255,255, .5),
    500:Color.fromRGBO(255,255,255, .6),
    600:Color.fromRGBO(255,255,255, .7),
    700:Color.fromRGBO(255,255,255, .8),
    800:Color.fromRGBO(255,255,255, .9),
    900:Color.fromRGBO(255,255,255, 1),
  };
  static const MaterialColor materialColorWhite = MaterialColor(0xffffffff, color);

}




class AppTextStyles {
  static TextStyle inputHeaderTextStyle = TextStyle(
      fontSize: AppFontSize.size12,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.app_font_family,
      color: AppColors.blue);

  static TextStyle inputHeaderHintTextStyle = TextStyle(
      fontSize: AppFontSize.size12,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.app_font_family_2,
      color: AppColors.light_grey);

  static TextStyle labelFieldTextStyle = TextStyle(
      fontSize: AppFontSize.size12,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.app_font_family_2,
      color: AppColors.dark_grey);










}
