import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

const Color resumeCardColorBoeder = Color.fromRGBO(253, 27, 81, 0.2);
const Color resumeCardColorBoederDark = Color.fromRGBO(253, 27, 81, 0.2);

const Color iconColors = Colors.black;
const Color iconColorsDark = Colors.white;
const Color iconColorsDark1 = Colors.white;

const BoxShadow resumeBoxShadow = BoxShadow(
  color: Color.fromRGBO(8, 14, 28, 0.25),
  spreadRadius: 1,
  blurRadius: 4,
  offset: Offset(0, 1.25),
);

const BoxShadow resumeBoxShadowDark = BoxShadow(
  color: Color.fromRGBO(21, 36, 70, 0.5),
  spreadRadius: 1,
  blurRadius: 4,
  offset: Offset(0, 1.25),
);

const List<Color> logoWidgetColor = [
  Color.fromRGBO(254, 222, 230, 0.8),
  Color.fromRGBO(220, 240, 249, 0.8),
];

const List<Color> logoWidgetColorDark = [
  Color.fromRGBO(36, 3, 1, 1),
  Color.fromRGBO(1, 22, 30, 1),
];

const List<Color> resumeCardColor = [
  Colors.white,
  Color.fromRGBO(254, 222, 230, 1),
];

const List<Color> resumehCardColorDark = [
  Color.fromRGBO(36, 3, 1, 1),
  Color.fromRGBO(3, 49, 52, 1),
];

const List<Color> backgroundColors = [
  Color(0xFFFEDEE6),
  Color.fromRGBO(255, 255, 255, 0.6),
];

const List<Color> backgroundColorsDark = [
  Color.fromRGBO(36, 3, 1, 1),
  Color.fromRGBO(1, 22, 30, 1),
];

const List<Color> backgroudColorFeild = [
  Color.fromRGBO(251, 241, 239, 1),
  Color.fromRGBO(252, 248, 248, 1),
  Color.fromRGBO(249, 240, 240, 1),
  Color.fromRGBO(252, 244, 243, 1),
];

const List<Color> backgroudColorFeildDark = [
  Color.fromRGBO(251, 241, 239, 1),
  Color.fromRGBO(252, 248, 248, 1),
  Color.fromRGBO(249, 240, 240, 1),
  Color.fromRGBO(252, 244, 243, 1),
];

// App Theme Colors
class AppThemeColors {
  static const Color colorFF0000 = Color.fromRGBO(0, 0, 0, 1); // Black
  static const Color colorFF0407 = Color.fromRGBO(4, 7, 14, 1); // Dark text
  static const Color colorFF9999 = Color.fromRGBO(
    153,
    153,
    153,
    1,
  ); // Gray text
  static const Color navColorIcon = Color.fromRGBO(7, 14, 7, 0.5);
  static const Color addFabColor = Color.fromRGBO(30, 51, 99, 1);
  static const Color editeFabColor = Color.fromRGBO(253, 27, 81, 1);
  static const Color titleFieldTextcolor = Color.fromRGBO(7, 14, 7, 1);
}

// App Theme instance
final appTheme = AppThemeColors();

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  static TextStyle get title20W400RegularOpenSans => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14W400RegularOpenSans => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14W500RegularOpenSans => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14W600RegularOpenSans => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title10W700RegularOpenSans => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );
  // Body Styles
  // Standard text styles for body content

  static TextStyle get body10W400RegularOpenSans => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body12W400RegularOpenSans => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.black,
  );

  static TextStyle get body14W400RegularOpenSans => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body14W500MediumOpenSans => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  // Label Styles
  // Small text styles for labels, captions, and hints

  static TextStyle get label10W700BoldOpenSans => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get label10W400RegularOpenSans => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF9999,
  );

  static TextStyle get label10W600SemiBoldOpenSans => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get label8W400RegularOpenSans => TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  // CV Button Styles
  static TextStyle get cvButtonLargeOpenSans => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get cvButtonSmallOpenSans => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );
}
