// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/background_colors.dart';
import 'package:theme_master/theme_master.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.to;

    return WillPopScope(
      onWillPop: () async => false, // غیرفعال کردن دکمه back
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Main content - full screen
            BackgroundColors(child: Obx(() => controller.currentPage)),

            // Bottom navigation bar - positioned at bottom
            Positioned(
              left: 10,
              right: 10,
              bottom: 12.0,
              child: BottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  bool isExpanded = false;

  final NavigationController _navigationController = NavigationController.to;
  final BottomNavigationController _bottomNavController =
      BottomNavigationController.to;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOutCubic,
            width: MediaQuery.of(context).size.width,
            height: isExpanded ? context.height * 0.2 : 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: context.bottomNavigationBarGradientColors,
              ),
              boxShadow: context.theme.brightness == Brightness.dark
                  ? [resumeBoxShadowDark]
                  : [resumeBoxShadow],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 10,
                left: 8,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ستون اول
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //  if (isExpanded) // فقط در حالت expanded نمایش داده شود
                        if (isExpanded)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _navigationController.navToHome();
                                setState(() {});
                              },
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                  vertical: 2.0,
                                ),
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        navigationController.nav[0],
                                        width: 16.0,
                                        height: 16.0,
                                        colorFilter: ColorFilter.mode(
                                          _navigationController.currentIndex ==
                                                  0
                                              ? Colors.pink
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Colors.white
                                              : const Color(0xFF04070E),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Home",
                                        style: TextStyleHelper
                                            .label10W400RegularOpenSans
                                            .copyWith(
                                              color:
                                                  _navigationController
                                                          .currentIndex ==
                                                      0
                                                  ? Colors.pink
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Colors.white
                                                  : AppThemeColors.colorFF0407,
                                              fontSize: 8.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // "Company"
                        if (isExpanded)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _navigationController.navToCompany();
                                setState(() {});
                              },
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                  vertical: 2.0,
                                ),
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        navigationController.nav[2],
                                        width: 24.0,
                                        height: 24.0,
                                        colorFilter: ColorFilter.mode(
                                          _navigationController.currentIndex ==
                                                  4
                                              ? Colors.pink
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Colors.white
                                              : AppThemeColors.navColorIcon,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Company",
                                        style: TextStyleHelper
                                            .label8W400RegularOpenSans
                                            .copyWith(
                                              fontSize: 8.0,
                                              color:
                                                  _navigationController
                                                          .currentIndex ==
                                                      4
                                                  ? Colors.pink
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Colors.white
                                                  : AppThemeColors.navColorIcon,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // "Dashboard" همیشه نمایش داده می‌شود
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: _buildNavItem(
                              _navigationController.nav[4],
                              "Dashboard",
                              1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ستون دوم
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isExpanded) const Expanded(child: Text("")),
                        if (isExpanded) // فقط در حالت expanded نمایش داده شود
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _navigationController.navigateToSettings();
                                setState(() {});
                              },
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                  vertical: 2.0,
                                ),
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        navigationController.nav[3],
                                        width: 24.0,
                                        height: 24.0,
                                        colorFilter: ColorFilter.mode(
                                          _navigationController.currentIndex ==
                                                  5
                                              ? Colors.pink
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Colors.white
                                              : AppThemeColors.navColorIcon,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Setting",
                                        style: TextStyleHelper
                                            .label8W400RegularOpenSans
                                            .copyWith(
                                              fontSize: 8.0,
                                              color:
                                                  _navigationController
                                                          .currentIndex ==
                                                      5
                                                  ? Colors.pink
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Colors.white
                                                  : AppThemeColors.navColorIcon,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // "Resume" همیشه نمایش داده می‌شود
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: _buildNavItem(
                              _navigationController.nav[5],
                              "Resume",
                              2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ستون سوم
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isExpanded)
                          const Expanded(child: SizedBox.shrink()),
                        if (isExpanded)
                          const Expanded(child: SizedBox.shrink()),
                        // "Jobs" همیشه نمایش داده می‌شود
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: _buildNavItem(
                              _navigationController.nav[6],
                              "Jobs",
                              3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ستون چهارم
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (isExpanded) // فقط در حالت expanded نمایش داده شود
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // Add logout functionality
                              },
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                  vertical: 2.0,
                                ),
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        navigationController.nav[1],
                                        width: 16.0,
                                        height: 16.0,
                                        colorFilter: ColorFilter.mode(
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : AppThemeColors.navColorIcon,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Logout",
                                        style: TextStyleHelper
                                            .label10W400RegularOpenSans
                                            .copyWith(
                                              color:
                                                  AppThemeColors.navColorIcon,
                                              fontSize: 8.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (isExpanded)
                          const Expanded(child: SizedBox.shrink()),
                        // دکمه expand/collapse همیشه نمایش داده می‌شود
                        Expanded(
                          child: InkWell(
                            onTap: _toggleExpand,
                            child: SvgPicture.asset(
                              navigationController.nav[7],
                              width: 24.0,
                              height: 24.0,
                              colorFilter: ColorFilter.mode(
                                isExpanded
                                    ? Colors.pink
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Colors.white
                                    : const Color(0xFF04070E),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).marginOnly(left: 10, right: 10, bottom: 20),
        ),
      ],
    );
  }

  // تابع کمکی برای ساخت آیتم‌های ناوبری که از قبل داشتید
  Widget _buildNavItem(String icon, String label, int index) {
    final isSelected = _navigationController.currentIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 24.0,
                height: 24.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Colors.pink
                      : Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppThemeColors.navColorIcon,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyleHelper.body12W400RegularOpenSans.copyWith(
                  color: isSelected
                      ? Colors.pink
                      : Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppThemeColors.navColorIcon,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
    // این خط فرض می‌کند _bottomNavController.toggleExpand() هم وجود دارد و حالت expansion را مدیریت می‌کند.
    _bottomNavController.toggleExpand();
  }

  void _onItemTapped(int index) {
    // اینجا index + 1 را به index تغییر دادم تا با _buildNavItem هماهنگ باشد.
    // مطمئن شوید که _navigationController.changePage انتظار چه نوع ایندکسی را دارد (0-based یا 1-based).
    _navigationController.changePage(index);
    setState(() {});
  }
}




/*
class MyBottomMenu extends StatefulWidget {
  const MyBottomMenu({super.key});

  @override
  _MyBottomMenuState createState() => _MyBottomMenuState();
}

class _MyBottomMenuState extends State<MyBottomMenu> {
  final NavigationController _navigationController = NavigationController.to;
  final BottomNavigationController _bottomNavController =
      BottomNavigationController.to;

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
    return Stack(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.all(12.0),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          height: _bottomNavController.isExpanded ? 161.0 : 63.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: context.bottomNavigationBarGradientColors,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4C080E1C),
                blurRadius: 3,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0.0, 0.3),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                      ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: _bottomNavController.isExpanded
                  ? fullBottomNavigationBar()
                  : miniBottomNavigationBar(),
            ),
          ),
        ),
      ],
    );
  }

  Widget fullBottomNavigationBar() {
    return SingleChildScrollView(
      key: const ValueKey('expanded'),
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: 161.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row with Home and Logout
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
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
                              : const Color(0xFF04070E),
                        ),
                        const SizedBox(width: 5),
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
                  GestureDetector(
                    onTap: () {
                      // Add logout functionality
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          navigationController.nav[1],
                          width: 16.0,
                          height: 16.0,
                          color: AppThemeColors.navColorIcon,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Logout",
                          style: TextStyleHelper.label10W400RegularOpenSans
                              .copyWith(color: AppThemeColors.navColorIcon),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Second row with Company, Setting, and two empty spaces
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          style: TextStyleHelper.label8W400RegularOpenSans
                              .copyWith(
                                fontSize: 8.0,
                                color: _navigationController.currentIndex == 4
                                    ? Colors.pink
                                    : AppThemeColors.navColorIcon,
                              ),
                        ),
                      ],
                    ),
                  ),
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
                          style: TextStyleHelper.label8W400RegularOpenSans
                              .copyWith(
                                fontSize: 8.0,
                                color: _navigationController.currentIndex == 5
                                    ? Colors.pink
                                    : AppThemeColors.navColorIcon,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            // Bottom row with Dashboard, Resume, Jobs, and expand button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 8.0,
              ),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget miniBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                  : const Color(0xFF04070E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    final isSelected = _navigationController.currentIndex == index + 1;
    return InkResponse(
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
*/