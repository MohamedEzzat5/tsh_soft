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
            isLightTheme ? MyColors.backGround : MyColors.backGroundDark,
        upBackGround:
            isLightTheme ? MyColors.upBackGround : MyColors.upBackGroundDark,
        main: isLightTheme ? MyColors.main : MyColors.mainDark,
        textColor: isLightTheme ? MyColors.textColor : MyColors.titleDark,
        highlight: isLightTheme ? MyColors.highlight : MyColors.highlightDark,
        body: isLightTheme ? MyColors.body : MyColors.bodyDark,
        iconColor: isLightTheme ? MyColors.iconColor : MyColors.unselectedDark,
        dividerColor:
            isLightTheme ? MyColors.dividerColor : MyColors.dividerDarkColor,
        unselected:
            isLightTheme ? MyColors.unselected : MyColors.unselectedDark,
        successColor:
            isLightTheme ? MyColors.successColor : MyColors.successDarkColor,
        errorColor:
            isLightTheme ? MyColors.errorColor : MyColors.errorDarkColor,
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
    primaryColor: isLightTheme ? MyColors.main : MyColors.mainDark,
    unselectedWidgetColor:
        isLightTheme ? MyColors.unselected : MyColors.unselectedDark,
    colorScheme: isLightTheme
        ? const ColorScheme.light(
            brightness: Brightness.light,
            primary: MyColors.main,
            error: MyColors.errorColor,
          )
        : const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: MyColors.mainDark,
            error: MyColors.errorDarkColor,
          ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      indent: 4.w,
      endIndent: 4.w,
      color: isLightTheme ? MyColors.dividerColor : MyColors.dividerDarkColor,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(
        isLightTheme ? MyColors.main : MyColors.mainDark,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: isLightTheme ? MyColors.main : MyColors.mainDark,
    ),
    scaffoldBackgroundColor:
        isLightTheme ? MyColors.backGround : MyColors.backGroundDark,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor:
          isLightTheme ? MyColors.backGround : MyColors.upBackGroundDark,
      elevation: 0,
      //centerTitle: true,
      iconTheme: IconThemeData(
        color: isLightTheme ? MyColors.textColor : MyColors.titleDark,
        size: 24.r,
      ),
      titleTextStyle: TextStyle(
        fontFamily: Fonts.primary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: isLightTheme ? MyColors.textColor : MyColors.titleDark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:
          isLightTheme ? MyColors.upBackGround : MyColors.upBackGroundDark,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: Fonts.primary,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isLightTheme ? MyColors.textColor : MyColors.titleDark,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: Fonts.primary,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isLightTheme ? MyColors.iconColor : MyColors.unselectedDark,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
