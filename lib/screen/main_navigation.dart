// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/widgets/global/background_colors_widget.dart';
import 'package:resume/widgets/global/bottom_navigation_bar.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.to;
    final bottomNavigationController = BottomNavigationController.to;
    final screenHeight = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.bottom;

    // Dynamic bottom padding for content
    final bottomPadding = screenHeight * 0.11;

    // Dynamic bottom padding for navigation bar
    final bottomPaddingNavBar = safePadding > 0
        ? safePadding + (screenHeight * 0.01)
        : screenHeight * 0.015;

    return WillPopScope(
      onWillPop: () async => false, // غیرفعال کردن دکمه back
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Main content - full screen with padding at the bottom
            BackgroundColorsWidget(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: Obx(() => controller.currentPage),
              ),
            ),

            // Bottom navigation bar - positioned at bottom
            Positioned(
              key: bottomNavigationController.positionedKey,
              left: 10,
              right: 10,
              bottom: bottomPaddingNavBar,
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
