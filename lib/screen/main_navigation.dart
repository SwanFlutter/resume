// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/background_colors.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.to;

    return Scaffold(
      extendBody: true,
      body: BackgroundColors(child: Obx(() => controller.currentPage)),
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
  final NavigationController _navigationController = NavigationController.to;
  final BottomNavigationController _bottomNavController =
      BottomNavigationController.to;

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
    _bottomNavController.toggleExpand();
    setState(() {});
  }

  void _onItemTapped(int index) {
    _navigationController.changePage(index + 1); // +1 because index 0 is Home
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.all(12.0),
      duration: 1.seconds,
      curve: Curves.easeInOut,
      height: _bottomNavController.isExpanded ? 161.0 : 63.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(253, 222, 230, 1),
            Color.fromRGBO(255, 255, 255, 1),
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
          child: _bottomNavController.isExpanded
              ? fullBottomNavigationBar()
              : miniBottomNavigationBar(),
        ),
      ),
    );
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
                        SvgPicture.asset(
                          navigationController.nav[0],
                          width: 16.0,
                          height: 16.0,
                          color: _navigationController.currentIndex == 0
                              ? Colors.pink
                              : Color(0xFF04070E),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Home",
                          style: TextStyleHelper.label10W400RegularOpenSans
                              .copyWith(
                                color: _navigationController.currentIndex == 0
                                    ? Colors.pink
                                    : AppThemeColors.colorFF0407,
                                height: 1.60,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        navigationController.nav[1],
                        width: 16.0,
                        height: 16.0,
                        color: _navigationController.currentIndex == 0
                            ? Colors.pink
                            : AppThemeColors.navColorIcon,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Exit",
                        style: TextStyleHelper.label10W400RegularOpenSans
                            .copyWith(color: AppThemeColors.navColorIcon),
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
                      _navigationController.navToCompany();
                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          navigationController.nav[2],
                          width: 24.0,
                          height: 24.0,
                          color: _navigationController.currentIndex == 4
                              ? Colors.pink
                              : AppThemeColors.navColorIcon,
                        ),
                        Text(
                          "Company",
                          style: TextStyleHelper.body12W400RegularOpenSans
                              .copyWith(
                                color: _navigationController.currentIndex == 4
                                    ? Colors.pink
                                    : AppThemeColors.navColorIcon,
                              ),
                        ),
                      ],
                    ).paddingOnly(left: 0.0),
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
                        SvgPicture.asset(
                          navigationController.nav[3],
                          width: 24.0,
                          height: 24.0,
                          color: _navigationController.currentIndex == 5
                              ? Colors.pink
                              : AppThemeColors.navColorIcon,
                        ),
                        Text(
                          "Setting",
                          style: TextStyleHelper.body12W400RegularOpenSans
                              .copyWith(
                                color: _navigationController.currentIndex == 5
                                    ? Colors.pink
                                    : AppThemeColors.navColorIcon,
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
                  _buildNavItem(navigationController.nav[4], "Dashboard", 0),
                  _buildNavItem(navigationController.nav[5], "Resume", 1),
                  _buildNavItem(navigationController.nav[6], "Jobs", 2),
                  GestureDetector(
                    onTap: _toggleExpand,
                    child: SvgPicture.asset(
                      navigationController.nav[7],
                      width: 24.0,
                      height: 24.0,
                      color: _bottomNavController.isExpanded
                          ? Colors.pink
                          : AppThemeColors.navColorIcon,
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
          _buildNavItem(navigationController.nav[4], "Dashboard", 0),
          _buildNavItem(navigationController.nav[5], "Resume", 1),
          _buildNavItem(navigationController.nav[6], "Jobs", 2),
          GestureDetector(
            onTap: _toggleExpand,
            child: SvgPicture.asset(
              navigationController.nav[7],
              width: 24.0,
              height: 24.0,
              color: _bottomNavController.isExpanded
                  ? Colors.pink
                  : Color(0xFF04070E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    final isSelected = _navigationController.currentIndex == index + 1;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24.0,
            height: 24.0,
            color: isSelected ? Colors.pink : AppThemeColors.navColorIcon,
          ),

          Text(
            label,
            style: TextStyleHelper.body12W400RegularOpenSans.copyWith(
              color: isSelected ? Colors.pink : AppThemeColors.navColorIcon,
            ),
          ),
        ],
      ),
    );
  }
}
