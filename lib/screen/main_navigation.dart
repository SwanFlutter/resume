// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/navigation_controller.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.to;

    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: MyBottomMenu(),
    );
  }
}

class MyBottomMenu extends StatefulWidget {
  const MyBottomMenu({super.key});

  @override
  _MyBottomMenuState createState() => _MyBottomMenuState();
}

class _MyBottomMenuState extends State<MyBottomMenu> {
  bool _isExpanded = false;
  final NavigationController _navigationController = NavigationController.to;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _onItemTapped(int index) {
    _navigationController.changePage(index + 1); // +1 because index 0 is Home
    setState(() {});
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _navigationController.currentIndex == index + 1;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.pink : null, size: 24),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.pink : null,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 600.microseconds,
      height: _isExpanded ? 161.0 : 63.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Color(0xFFFEDFE6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: _isExpanded
            ? SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: 161.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Top row with Home and Exit
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _navigationController.navigateToHome();
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color:
                                        _navigationController.currentIndex == 0
                                        ? Colors.pink
                                        : null,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color:
                                          _navigationController.currentIndex ==
                                              0
                                          ? Colors.pink
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app_outlined,
                                  color: Color.fromRGBO(4, 7, 14, 1),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Exit",
                                  style: TextStyle(
                                    color: Color.fromRGBO(4, 7, 14, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).paddingOnly(left: 18.0, right: 18.0, top: 10.0),
                      ),

                      // Second row with Company and Setting
                      SizedBox(
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 18),
                            GestureDetector(
                              onTap: () {
                                _navigationController.navigateToCompany();
                                setState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.business,
                                    color:
                                        _navigationController.currentIndex == 4
                                        ? Colors.pink
                                        : null,
                                  ),
                                  Text(
                                    "Company",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          _navigationController.currentIndex ==
                                              4
                                          ? Colors.pink
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 25),
                            GestureDetector(
                              onTap: () {
                                _navigationController.navigateToSettings();
                                setState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color:
                                        _navigationController.currentIndex == 5
                                        ? Colors.pink
                                        : null,
                                  ),
                                  Text(
                                    "Setting",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          _navigationController.currentIndex ==
                                              5
                                          ? Colors.pink
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bottom row with main navigation
                      SizedBox(
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildNavItem(Icons.dashboard, "Dashboard", 0),
                            _buildNavItem(Icons.description, "Resume", 1),
                            _buildNavItem(Icons.work, "Jobs", 2),
                            GestureDetector(
                              onTap: _toggleExpand,
                              child: Icon(
                                Icons.more_horiz,
                                size: 36,
                                color: _isExpanded ? Colors.pink : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(
                height: 63.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildNavItem(Icons.dashboard, "Dashboard", 0),
                    _buildNavItem(Icons.description, "Resume", 1),
                    _buildNavItem(Icons.work, "Jobs", 2),
                    GestureDetector(
                      onTap: _toggleExpand,
                      child: Icon(
                        Icons.more_horiz,
                        size: 36,
                        color: _isExpanded ? Colors.pink : null,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ).marginOnly(bottom: 20.0, left: 10.0, right: 10.0);
  }
}
