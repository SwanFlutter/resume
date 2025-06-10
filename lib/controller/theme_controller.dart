import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

class ThemeControllers extends GetXController {
  static ThemeControllers get to => Get.find<ThemeControllers>();

  // Make themeMode reactive
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;

  void toggleTheme() {
    if (_themeMode.value == ThemeMode.light) {
      _themeMode.value = ThemeMode.dark;
    } else {
      _themeMode.value = ThemeMode.light;
    }
    update(); // Update GetBuilder widgets
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode.value = mode;
    update();
  }

  void setLightTheme() {
    _themeMode.value = ThemeMode.light;
    update();
  }

  void setDarkTheme() {
    _themeMode.value = ThemeMode.dark;
    update();
  }

  void setSystemTheme() {
    _themeMode.value = ThemeMode.system;
    update();
  }
}
