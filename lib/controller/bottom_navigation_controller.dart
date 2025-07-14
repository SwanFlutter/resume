import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

class BottomNavigationController extends GetXController {
  static BottomNavigationController get to =>
      Get.find<BottomNavigationController>();

  final RxBool _isExpanded = false.obs;
  bool get isExpanded => _isExpanded.value;

  void toggleExpand() {
    _isExpanded.value = !_isExpanded.value;
  }

  final GlobalKey positionedKey = GlobalKey();
  final RxDouble bottomNavBarTop = 0.0.obs;

  void updateBottomNavBarPosition() {
    final RenderBox? renderBox =
        positionedKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final Offset position = renderBox.localToGlobal(Offset.zero);
      bottomNavBarTop.value = position.dy;
      //    print('لبه بالایی نوار ناوبری: ${bottomNavBarTop.value}');
    }
  }

  double fabBottomPosition(BuildContext context) {
    // فاصله ثابت 10 پیکسل بالاتر از لبه بالایی نوار ناوبری
    return bottomNavBarTop.value + context.height * 0.15;
  }
}
