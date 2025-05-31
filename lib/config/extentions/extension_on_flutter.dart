// Extensions for Padding
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';

extension PaddingExtension on Widget {
  // Adds uniform padding around the widget.
  Widget padAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  // Adds symmetric vertical and horizontal padding to the widget.
  Widget padSymmetric({double vertical = 8.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}

// Extensions for Margin
extension MarginExtension on Widget {
  // Adds uniform margin around the widget.
  Widget marginAll(double value) {
    return Container(margin: EdgeInsets.all(value), child: this);
  }

  // Adds symmetric vertical and horizontal margins to the widget.
  Widget marginSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}

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

extension ConvertFormating on Widget {
  String toNumberFormatting(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }
}

extension StringFormatting on String {
  String toStringFormatting() {
    try {
      // تبدیل String به int یا double
      final number = int.parse(this);
      final formatter = NumberFormat('#,###');
      return formatter.format(number);
    } catch (e) {
      return this;
    }
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
    debugPrint("pixels:$pixels");
    debugPrint("baseHeight:$_baseHeight");
    debugPrint("re:$re");
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
