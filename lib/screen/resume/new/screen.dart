import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:theme_master/theme_master.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool isExpanded = false;

  final NavigationController _navigationController = NavigationController.to;
  final BottomNavigationController _bottomNavController =
      BottomNavigationController.to;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: 700.milliseconds,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: MediaQuery.of(context).size.width,
            height: isExpanded ? context.height * 0.161 : context.height * 0.07,
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
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 12,
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
                                          AppThemeColors.navColorIcon,
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
                  isSelected ? Colors.pink : AppThemeColors.navColorIcon,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyleHelper.body12W400RegularOpenSans.copyWith(
                  color: isSelected ? Colors.pink : AppThemeColors.navColorIcon,
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




/**Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 242, 245, 1), */