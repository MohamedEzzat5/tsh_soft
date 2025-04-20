import 'package:flutter/material.dart';

import '../../injection_container.dart';

class MyColors {
  static const Color white = Colors.white;
  static const Color backGround = Color(0xFFF6F7F6);
  static const Color upBackGround = Color(0xFFFFFFFF);
  static const Color main = Color(0xFF0D47A1);
  static const Color secondaryColor = Color(0xFFBBDEFB);
  static const Color textColor = Color(0xFF1A237E);
  static const Color body = Color(0xFF5C6BC0);
  static const Color highlight = Color(0xFF1976D2);
  static const Color buttonColor = Color(0xFF0D47A1);
  static const Color onBoardingColor = Color(0xFF1E88E5);
  static const Color iconColor = Color(0xFF8A8A8A);
  static const Color title = Color(0xFF3D5F48);
  static const Color unselected = Color(0xFFB2B8B4);
  static const Color dividerColor = Color(0xff979797);
  static const Color profileDividerColor = Color(0xffDADADA);
  static const Color grayLight = Color(0xffF2F2F2);
  static const Color successColor = Color(0xFF0FEF3D);
  static const Color errorColor = Color(0xFFEF0F0F);
  static const Color buttonColor2 = Color(0xFFEEEEEE);
  static const Color backGroundContainerColor = Color(0xffD5F6FB);

// dark mode
  static const Color black = Colors.black;
  static const Color mainDark = Color(0xFF1976D2);
  static const Color titleDark = Color(0xFFE9F2FD);
  static const Color highlightDark = Color(0xFF42A5F5);
  static const Color bodyDark = Color(0xFF90CAF9);
  static const Color errorDarkColor = Color(0xFFEF5350);
  static const Color backGroundDark = Color(0xFF2D2D3E);
  static const Color upBackGroundDark = Color(0xFF3A3A4B);
  static const Color unselectedDark = Color(0xFF78909C);
  static const Color dividerDarkColor = Color(0xFF455A64);
  static const Color successDarkColor = Color(0xFF4CAF50);

// shared
  static Color borderColor = const Color(0xffCBCBCB);
  static Color review = const Color(0xffFFA534);
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color baseColor;
  final Color backGround;
  final Color upBackGround;
  final Color main;
  final Color secondaryColor;
  final Color textColor;
  final Color highlight;
  final Color body;
  final Color iconColor;
  final Color dividerColor;
  final Color unselected;
  final Color successColor;
  final Color errorColor;
  final Color borderColor;
  final Color review;
  final Color buttonColor;
  final Color buttonColor2;
  final Color white;
  final Color black;

  final Color profileDividerColor;

  final Color onBoardingColor;

  const AppColors({
    required this.baseColor,
    required this.backGround,
    required this.upBackGround,
    required this.main,
    required this.secondaryColor,
    required this.textColor,
    required this.highlight,
    required this.body,
    required this.iconColor,
    required this.dividerColor,
    required this.unselected,
    required this.successColor,
    required this.errorColor,
    required this.borderColor,
    required this.review,
    required this.buttonColor,
    required this.buttonColor2,
    required this.profileDividerColor,
    required this.onBoardingColor,
    required this.white,
    required this.black,
  });

  @override
  AppColors copyWith({
    Color? baseColor,
    Color? backGround,
    Color? upBackGround,
    Color? main,
    Color? secondaryColor,
    Color? textColor,
    Color? highlight,
    Color? body,
    Color? iconColor,
    Color? dividerColor,
    Color? unselected,
    Color? successColor,
    Color? errorColor,
    Color? borderColor,
    Color? review,
    Color? buttonColor,
    Color? buttonColor2,
    Color? profileDividerColor,
    Color? onBoardingColor,
    Color? white,
    Color? black,
  }) {
    return AppColors(
      baseColor: baseColor ?? this.baseColor,
      backGround: backGround ?? this.backGround,
      upBackGround: upBackGround ?? this.upBackGround,
      main: main ?? this.main,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      textColor: textColor ?? this.textColor,
      highlight: highlight ?? this.highlight,
      body: body ?? this.body,
      iconColor: iconColor ?? this.iconColor,
      dividerColor: dividerColor ?? this.dividerColor,
      unselected: unselected ?? this.unselected,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
      borderColor: borderColor ?? this.borderColor,
      review: review ?? this.review,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonColor2: buttonColor2 ?? this.buttonColor2,
      profileDividerColor: profileDividerColor ?? this.profileDividerColor,
      onBoardingColor: onBoardingColor ?? this.onBoardingColor,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors> other, double t) {
    if (other is! AppColors) {
      return this;
    }
    final appColors = AppColors(
      baseColor: Color.lerp(baseColor, other.baseColor, t) ?? baseColor,
      backGround: Color.lerp(backGround, other.backGround, t) ?? backGround,
      upBackGround:
          Color.lerp(upBackGround, other.upBackGround, t) ?? upBackGround,
      main: Color.lerp(main, other.main, t) ?? main,
      secondaryColor:
          Color.lerp(secondaryColor, other.secondaryColor, t) ?? secondaryColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      highlight: Color.lerp(highlight, other.highlight, t) ?? highlight,
      body: Color.lerp(body, other.body, t) ?? body,
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? iconColor,
      dividerColor:
          Color.lerp(dividerColor, other.dividerColor, t) ?? dividerColor,
      unselected: Color.lerp(unselected, other.unselected, t) ?? unselected,
      successColor:
          Color.lerp(successColor, other.successColor, t) ?? successColor,
      errorColor: Color.lerp(errorColor, other.errorColor, t) ?? errorColor,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      review: Color.lerp(review, other.review, t) ?? review,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t) ?? buttonColor,
      buttonColor2:
          Color.lerp(buttonColor2, other.buttonColor2, t) ?? buttonColor2,
      profileDividerColor:
          Color.lerp(profileDividerColor, other.profileDividerColor, t) ??
              profileDividerColor,
      onBoardingColor: Color.lerp(onBoardingColor, other.onBoardingColor, t) ??
          onBoardingColor,
      white: Color.lerp(white, other.white, t) ?? white,
      black: Color.lerp(black, other.black, t) ?? black,
    );
    ServiceLocator.injectAppColors(appColors: appColors);
    return appColors;
  }
}
