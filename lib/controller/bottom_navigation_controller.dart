import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

class BottomNavigationController extends GetXController {
  static BottomNavigationController get to =>
      Get.smartFind<BottomNavigationController>();

  final RxBool _isExpanded = false.obs;
  bool get isExpanded => _isExpanded.value;

  void toggleExpand() {
    _isExpanded.value = !_isExpanded.value;
  }

  // محاسبه ارتفاع navigation bar
  double get navigationHeight => _isExpanded.value ? 161.0 : 63.0;

  // محاسبه موقعیت FAB (فاصله از پایین) - همیشه بالای navigation bar
  double? fabBottomPosition(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (_isExpanded.value) {
      return navigationHeight +
          (screenHeight * 0.0545); // حالت باز: 10% ارتفاع دیوایس
    } else {
      return navigationHeight +
          (screenHeight * 0.065); // حالت ثابت: 6.5% ارتفاع دیوایس
    }
  }
}
