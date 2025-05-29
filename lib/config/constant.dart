import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

const List<Color> fieldColor = [
  /// background: linear-gradient(267.34deg, #FBF1EF -3.51%, #FCF8F8 31.64%, #F9F0F0 66.79%, #FCF4F3 101.93%);
];

const List<Color> backgroundColors = [
  Color(0xFFFEDEE6),
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(255, 255, 255, 0.6),
];

double calculateHeightPercentage({
  required BuildContext context,
  required double fixedHeight,
}) {
  // Get the screen height
  double screenHeight = MediaQuery.of(context).size.height;

  // Calculate the percentage of the fixed height relative to the screen height
  double heightPercentage = fixedHeight / screenHeight;

  print("Height Percentage: $heightPercentage");

  return heightPercentage;
}

// App Theme Colors
class AppThemeColors {
  static const Color colorFF0000 = Color(0xFF000000); // Black
  static const Color colorFF0407 = Color(0xFF04070E); // Dark text
  static const Color colorFF9999 = Color(0xFF999999); // Gray text
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

  static TextStyle get title20RegularOpenSans => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,

    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get title14RegularOpenSans => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,

    color: AppThemeColors.colorFF0407,
  );

  // Body Styles
  // Standard text styles for body content

  static TextStyle get body14RegularOpenSans => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,

    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body12RegularOpenSans => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Open Sans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get body14MediumOpenSans => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Open Sans',
    color: AppThemeColors.colorFF0407,
  );

  // Label Styles
  // Small text styles for labels, captions, and hints

  static TextStyle get label10BoldOpenSans => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: 'Open Sans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get label10RegularOpenSans => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'Open Sans',
    color: AppThemeColors.colorFF9999,
  );

  static TextStyle get label10SemiBoldOpenSans => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'Open Sans',
    color: AppThemeColors.colorFF0407,
  );

  static TextStyle get label8RegularOpenSans => TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w400,

    color: AppThemeColors.colorFF0407,
  );

  // CV Button Styles
  static TextStyle get cvButtonLargeOpenSans =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  static TextStyle get cvButtonSmallOpenSans => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Open Sans',
    color: Colors.white,
  );
}
