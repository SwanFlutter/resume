// Extensions for Padding
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';

// Extensions for Margin

// Extension for Visibility
extension VisibilityExtension on Widget {
  // Conditionally display the widget based on the isVisible flag.
  Widget visible(bool isVisible) {
    return isVisible ? this : const SizedBox.shrink();
  }
}

// Extension for Rotation
extension RotationExtension on Widget {
  // Rotates the widget by a specified number of degrees.
  Widget rotate(double degrees) {
    return Transform.rotate(angle: degrees * pi / 180, child: this);
  }
}

// Extension for Scaling
extension ScaleExtension on Widget {
  // Scales the widget by a specified factor.
  Widget scale(double scaleFactor) {
    return Transform.scale(scale: scaleFactor, child: this);
  }
}

// Extension for Border
extension BorderExtension on Widget {
  // Adds a border to the widget with customizable color and width.
  Widget withBorder({Color color = Colors.black, double width = 1.0}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
      ),
      child: this,
    );
  }
}

// Extensions for accessing Theme and Screen Size
extension ContextExtensions on Widget {
  // Access the Theme of the current context
  ThemeData theme(BuildContext context) => Theme.of(context);

  // Access the Text Theme of the current context
  static TextTheme textTheme(BuildContext context) =>
      Theme.of(context).textTheme;

  // Access the screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Access the screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Determine if the device is a mobile
  static bool isMobile(BuildContext context) => screenWidth(context) < 600;

  // Determine if the device is a tablet
  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1024;

  // Determine if the device is a laptop
  static bool isLaptop(BuildContext context) =>
      screenWidth(context) >= 1024 && screenWidth(context) < 1440;

  // Determine if the device is a TV or large screen
  static bool isTV(BuildContext context) => screenWidth(context) >= 1440;

  // Example usage of responsive size based on device type
  static double responsiveFontSize({
    required Size size,
    required double mobile,
    required double tablet,
    required double laptop,
    required double desktop,
    required double tv,
  }) {
    double width = size.width;

    if (width < 600) {
      return mobile; // Mobile
    } else if (width < 900) {
      return tablet; // Tablet
    } else if (width < 1200) {
      return laptop; // Laptop
    } else if (width < 1920) {
      return desktop; // Desktop
    } else {
      return tv; // TV or very large screens
    }
  }
}

/// Extension on the `Widget` class to provide number formatting functionality.
/// This extension adds a method to format an integer into a string with comma separators.
///
/// Example usage:
/// ```dart
/// final myWidget = MyWidget();
/// String formattedNumber = myWidget.toNumberFormatting(1234567);
/// print(formattedNumber); // Output: "1,234,567"
/// ```
extension ConvertFormating on Widget {
  String toNumberFormatting(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }
}

/// Extension on the `String` class to provide string to number formatting functionality.
/// This extension attempts to parse the string as an integer and then formats it with comma separators.
/// If parsing fails, it returns the original string.
///
/// Example usage:
/// ```dart
/// String numberString = "1234567";
/// String formattedString = numberString.toStringFormatting();
/// print(formattedString); // Output: "1,234,567"
///
/// String invalidNumberString = "abc123";
/// String result = invalidNumberString.toStringFormatting();
/// print(result); // Output: "abc123"
/// ```
extension StringFormatting on String {
  String toStringFormatting() {
    try {
      // Attempt to convert String to int
      final number = int.parse(this);
      final formatter = NumberFormat('#,###');
      return formatter.format(number);
    } catch (e) {
      // Return the original string if conversion fails
      return this;
    }
  }
}

extension StringNumberFormatting on String {
  /// Formats the number within the string.
  /// This method assumes the string contains a number prefixed with a dollar sign.
  ///
  /// Example usage:
  /// ```dart
  /// Text("\\$20000".toNumberFormat())
  /// ```
  /// This will return a string with the formatted number: "\$20,000".
  String toNumberFormat() {
    // Extract the numeric part from the string
    final numberRegex = RegExp(r'\d+');
    final match = numberRegex.firstMatch(this);
    if (match != null) {
      final number = int.parse(match.group(0)!);
      final formatter = NumberFormat('#,###');
      final formattedNumber = formatter.format(number);

      // Replace the numeric part with the formatted number
      return replaceAll(match.group(0)!, formattedNumber);
    }
    // Return the original string if no number is found
    return this;
  }
}

extension ResponsiveTextExtension on BuildContext {
  // Get screen size
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Get device type
  DeviceType get deviceType {
    if (screenWidth < 600) return DeviceType.mobile;
    if (screenWidth < 900) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  // Get responsive font size based on screen width
  double getResponsiveFontSize(double fontSize) {
    double scaleFactor = screenWidth / 375; // Base width is iPhone SE

    switch (deviceType) {
      case DeviceType.mobile:
        return fontSize * scaleFactor.clamp(0.8, 1.2);
      case DeviceType.tablet:
        return fontSize * scaleFactor.clamp(1.1, 1.4);
      case DeviceType.desktop:
        return fontSize * scaleFactor.clamp(1.3, 1.6);
    }
  }

  // Get text style with responsive size
  TextStyle getResponsiveTextStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    double? height,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: getResponsiveFontSize(fontSize),
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
      height: height,
      fontFamily: fontFamily,
    );
  }
}

// Enum for device types
enum DeviceType { mobile, tablet, desktop }

class ResponsiveHelpers {
  // ارتفاع و عرض استاندارد (معمولاً iPhone 11 Pro)
  static final double _baseWidth = Get.width;
  static final double _baseHeight = Get.height;

  // روش اول: ساده و مستقیم (پیشنهادی)
  static double h({required double pixels}) {
    var re = (pixels / _baseHeight) * 100 * 7.96;
    return re;
  }

  static double w(double pixels) {
    return (Get.width * pixels) / _baseWidth;
  }

  // روش دوم: با roundToDouble (اگه می‌خوای عدد صحیح باشه)
  static double hRounded(double pixels) {
    return ((Get.height * pixels) / _baseHeight).roundToDouble();
  }

  static double wRounded(double pixels) {
    return ((Get.width * pixels) / _baseWidth).roundToDouble();
  }

  // روش سوم: با حداقل و حداکثر محدودیت
  static double hSafe(double pixels, {double? minHeight, double? maxHeight}) {
    double result = (Get.height * pixels) / _baseHeight;

    if (minHeight != null && result < minHeight) {
      return minHeight;
    }
    if (maxHeight != null && result > maxHeight) {
      return maxHeight;
    }

    return result;
  }

  // روش چهارم: بر اساس تراکم پیکسل
  static double hWithDensity(double pixels) {
    double pixelRatio = Get.pixelRatio;
    double baseRatio = (Get.height * pixels) / _baseHeight;

    // تنظیم بر اساس تراکم پیکسل
    return baseRatio / (pixelRatio > 2.0 ? 1.2 : 1.0);
  }
}

// Extension برای استفاده راحت‌تر
extension ResponsiveInt on int {
  double get h => ResponsiveHelpers.h(pixels: toDouble());
  double get w => ResponsiveHelpers.w(toDouble());
  double get hr => ResponsiveHelpers.hRounded(toDouble());
  double get wr => ResponsiveHelpers.wRounded(toDouble());
}

extension ResponsiveDouble on double {
  double get h => ResponsiveHelpers.h(pixels: this);
  double get w => ResponsiveHelpers.w(this);
  double get hr => ResponsiveHelpers.hRounded(this);
  double get wr => ResponsiveHelpers.wRounded(this);
}
