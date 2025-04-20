import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/utils/app_colors.dart';
import '../../core/utils/values/fonts.dart';

ThemeData getAppTheme(BuildContext context, bool isLightTheme) {
  return ThemeData(
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        baseColor: isLightTheme ? MyColors.white : MyColors.black,
        backGround:
            isLightTheme ? MyColors.backGround : const Color(0xFF1E1E2C),
        upBackGround:
            isLightTheme ? MyColors.upBackGround : const Color(0xFF2A2A3C),
        main: isLightTheme ? MyColors.main : const Color(0xFF3F8CFF),
        textColor: isLightTheme ? MyColors.textColor : const Color(0xFFEEEEEE),
        highlight: isLightTheme ? MyColors.highlight : const Color(0xFF4A90E2),
        body: isLightTheme ? MyColors.body : const Color(0xFFB0BEC5),
        iconColor: isLightTheme ? MyColors.iconColor : const Color(0xFFB0BEC5),
        dividerColor:
            isLightTheme ? MyColors.dividerColor : const Color(0xFF444654),
        unselected:
            isLightTheme ? MyColors.unselected : const Color(0xFF666666),
        successColor:
            isLightTheme ? MyColors.successColor : const Color(0xFF66BB6A),
        errorColor:
            isLightTheme ? MyColors.errorColor : const Color(0xFFEF5350),
        borderColor: MyColors.borderColor,
        review: MyColors.review,
        buttonColor: MyColors.buttonColor,
        buttonColor2: MyColors.buttonColor2,
        secondaryColor: MyColors.secondaryColor,
        profileDividerColor: MyColors.profileDividerColor,
        onBoardingColor: MyColors.onBoardingColor,
        white: MyColors.white,
        black: MyColors.black,
      )
    ],
    fontFamily: Fonts.primary,
    brightness: isLightTheme ? Brightness.light : Brightness.dark,
    primaryColor: isLightTheme ? MyColors.main : const Color(0xFF3F8CFF),
    unselectedWidgetColor:
        isLightTheme ? MyColors.unselected : const Color(0xFF666666),
    colorScheme: isLightTheme
        ? const ColorScheme.light(
            brightness: Brightness.light,
            primary: MyColors.main,
            error: MyColors.errorColor,
          )
        : const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: Color(0xFF3F8CFF),
            error: Color(0xFFEF5350),
          ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      indent: 4.w,
      endIndent: 4.w,
      color: isLightTheme ? MyColors.dividerColor : const Color(0xFF444654),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(
        isLightTheme ? MyColors.main : const Color(0xFF3F8CFF),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: isLightTheme ? MyColors.main : const Color(0xFF3F8CFF),
    ),
    scaffoldBackgroundColor:
        isLightTheme ? MyColors.white : const Color(0xFF121212),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: isLightTheme ? MyColors.white : const Color(0xFF1E1E2C),
      elevation: 0,
      iconTheme: IconThemeData(
        color: isLightTheme ? MyColors.textColor : const Color(0xFFEEEEEE),
        size: 24.r,
      ),
      titleTextStyle: TextStyle(
        fontFamily: Fonts.primary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: isLightTheme ? MyColors.textColor : const Color(0xFFEEEEEE),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:
          isLightTheme ? MyColors.upBackGround : const Color(0xFF2A2A3C),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: Fonts.primary,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isLightTheme ? MyColors.textColor : const Color(0xFFEEEEEE),
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: Fonts.primary,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isLightTheme ? MyColors.iconColor : const Color(0xFFB0BEC5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(padding: EdgeInsets.zero),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
