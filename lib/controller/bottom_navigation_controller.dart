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

  // Calculate navigation bar height based on screen size and expansion state
  double navigationHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    
    // Base height calculation
    double baseHeight = screenHeight * 0.08; // 8% of screen height
    
    // Adjust for different screen sizes
    if (screenWidth < 360) { // Small phones
      baseHeight = screenHeight * 0.09;
    } else if (screenWidth > 600) { // Tablets
      baseHeight = screenHeight * 0.07;
    }
    
    // Adjust for pixel ratio
    if (pixelRatio > 2.0) {
      baseHeight *= 0.9; // Slightly smaller on high-density screens
    }
    
    // Return expanded or collapsed height
    return _isExpanded.value ? baseHeight * 1.5 : baseHeight;
  }

  // Calculate FAB position to be consistently above navigation bar
  double fabBottomPosition(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final navHeight = navigationHeight(context);
    final safePadding = MediaQuery.of(context).padding.bottom;
    
    // Calculate base spacing (15% of navigation height)
    final baseSpacing = navHeight * 0.15;
    
    // Add extra padding for devices with bottom safe area
    final extraPadding = safePadding > 0 ? safePadding * 0.5 : 0;
    
    return navHeight + baseSpacing + extraPadding;
  }
}
