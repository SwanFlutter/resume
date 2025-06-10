import 'package:flutter/material.dart';

const BoxShadow resumeBoxShadow = BoxShadow(
  color: Color.fromRGBO(8, 14, 28, 0.3),
  spreadRadius: 0,
  blurRadius: 4,
  offset: Offset(0, 1.25),
  blurStyle: BlurStyle.solid,
);

const BoxShadow resumeBoxShadowDark = BoxShadow(
  color: Color.fromRGBO(21, 36, 70, 1.0),
  spreadRadius: 0,
  blurRadius: 4,
  offset: Offset(0, 1.25),
  blurStyle: BlurStyle.solid,
);

const BoxShadow bottomNavbarBoxShadow = BoxShadow(
  color: Color.fromRGBO(8, 14, 28, 0.3),
  spreadRadius: 0,
  blurRadius: 3,
  offset: Offset(0, 1.0),
  blurStyle: BlurStyle.solid,
);
const BoxShadow bottomNavbarBoxShadowDark = BoxShadow(
  color: Color.fromRGBO(21, 36, 70, 1.0),
  spreadRadius: 0,
  blurRadius: 3,
  offset: Offset(0, 1.0),
  blurStyle: BlurStyle.solid,
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
  Color.fromRGBO(255, 242, 245, 1),
  Color.fromRGBO(255, 255, 255, 1),

  /*Color(0xFFFEDEE6),
  Color.fromRGBO(255, 255, 255, 0.6),*/
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

const Color backgroudColorFeildDark = Color.fromRGBO(4, 66, 92, 0.4);

// App Theme Colors
class AppThemeColors {
  static const Color colorFF0000 = Color.fromRGBO(0, 0, 0, 1); // Black
  static const Color colorFF0407 = Color.fromRGBO(4, 7, 14, 1); // Dark text
  static const Color colorFF9999 = Color.fromRGBO(153, 153, 153, 1);
  static const Color navColorIcon = Color.fromRGBO(7, 14, 7, 0.5);
  static const Color addFabColor = Color.fromRGBO(30, 51, 99, 1);
  static const Color editeFabColor = Color.fromRGBO(253, 27, 81, 1);
  static const Color titleFieldTextcolor = Color.fromRGBO(7, 14, 7, 1);
}

// App Theme instance

/// TextStyle Helper integrated with theme colors
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles for Light Theme
  static TextStyle get title20W400RegularOpenSans => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14W400RegularOpenSans => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14W500RegularOpenSans => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14W600RegularOpenSans => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title10W700RegularOpenSans => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  // Dark Theme Title Styles
  static TextStyle get title20W400RegularOpenSansDark => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get title14W400RegularOpenSansDark => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get title14W500RegularOpenSansDark => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get title14W600RegularOpenSansDark => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get title10W700RegularOpenSansDark => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  // Body Styles for Light Theme
  static TextStyle get body10W400RegularOpenSans => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body12W400RegularOpenSans => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body14W400RegularOpenSans => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body14W500MediumOpenSans => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  // Dark Theme Body Styles
  static TextStyle get body10W400RegularOpenSansDark => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get body12W400RegularOpenSansDark => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get body14W400RegularOpenSansDark => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get body14W500MediumOpenSansDark => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  // Label Styles
  static TextStyle get label10W700BoldOpenSans => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get label10W400RegularOpenSans => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF9999,
  );

  static TextStyle get label10W600SemiBoldOpenSans => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get label8W400RegularOpenSans => const TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF0407,
  );

  // Dark Theme Label Styles
  static TextStyle get label10W700BoldOpenSansDark => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get label10W400RegularOpenSansDark => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: AppThemeColors.colorFF9999, // No change for hint color
  );

  static TextStyle get label10W600SemiBoldOpenSansDark => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get label8W400RegularOpenSansDark => const TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  // CV Button Styles
  static TextStyle get cvButtonLargeOpenSans => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );

  static TextStyle get cvButtonSmallOpenSans => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );
}
