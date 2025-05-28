// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
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

  // Static getter برای دسترسی به وضعیت از سایر صفحات

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _onItemTapped(int index) {
    _navigationController.changePage(index + 1); // +1 because index 0 is Home
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 1.seconds,
      curve: Curves.easeInOut,
      height: _isExpanded ? 161.0 : 63.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [0.0, 0.3, 0.6, 1.0],
          colors: [
            //   Color(0xFFFEDEE6),
            Color.fromRGBO(254, 222, 230, 0.6),
            Color.fromRGBO(254, 222, 230, 0.5),
            Color.fromRGBO(254, 222, 230, 0.4),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: AnimatedSwitcher(
          duration: 1.seconds,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(0.0, 0.3), end: Offset.zero)
                  .animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                  ),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: _isExpanded
              ? fullBottomNavigationBar()
              : miniBottomNavigationBar(),
        ),
      ),
    ).marginOnly(bottom: 20.0, left: 10.0, right: 10.0);
  }

  Widget fullBottomNavigationBar() {
    return SingleChildScrollView(
      key: ValueKey('expanded'),
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
                      _navigationController.navToHome();
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: _navigationController.currentIndex == 0
                              ? Colors.pink
                              : navColorIcon,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: _navigationController.currentIndex == 0
                                ? Colors.pink
                                : navColorIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.exit_to_app_outlined, color: navColorIcon),
                      SizedBox(width: 5),
                      Text("Exit", style: TextStyle(color: navColorIcon)),
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
                      _navigationController.navToCompany();
                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.business,
                          color: _navigationController.currentIndex == 4
                              ? Colors.pink
                              : navColorIcon,
                        ),
                        Text(
                          "Company",
                          style: TextStyle(
                            fontSize: 12,
                            color: _navigationController.currentIndex == 4
                                ? Colors.pink
                                : navColorIcon,
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 0.0),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      _navigationController.navigateToSettings();
                      // setState(() {});
                      _navigationController.update();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.settings,
                          color: _navigationController.currentIndex == 5
                              ? Colors.pink
                              : navColorIcon,
                        ),
                        Text(
                          "Setting",
                          style: TextStyle(
                            fontSize: 12,
                            color: _navigationController.currentIndex == 5
                                ? Colors.pink
                                : navColorIcon,
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 18.0),
                  ),
                  Text(""),
                  Text(""),
                ],
              ),
            ).paddingOnly(left: 0),
            //8//////
            // Bottom row with main navigation
            SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ).paddingOnly(right: 18.0),
                ],
              ),
            ),
          ],
        ).paddingOnly(left: 16.0),
      ),
    );
  }

  Widget miniBottomNavigationBar() {
    return SizedBox(
      key: ValueKey('collapsed'),
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
              Icons.more_horiz_outlined,
              size: 45,
              color: _isExpanded ? Colors.pink : titleFieldTextcolor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _navigationController.currentIndex == index + 1;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.pink : titleFieldTextcolor,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.pink : titleFieldTextcolor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
