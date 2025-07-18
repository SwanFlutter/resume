import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/config/extentions/extension_on_flutter.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/login_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/controller/theme_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:theme_master/theme_master.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isExpanded = false;

  final NavigationController _navigationController = NavigationController.to;
  final BottomNavigationController _bottomNavController =
      BottomNavigationController.to;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        borderRadius: BorderRadius.circular(12.0),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: context.theme.brightness == Brightness.dark
                  ? Color.fromRGBO(51, 51, 51, 1)
                  : Color.fromRGBO(229, 229, 229, 1),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: context.bottomNavigationBarGradientColors,
            ),
            boxShadow: context.theme.brightness == Brightness.dark
                ? [resumeBoxShadowDark]
                : [resumeBoxShadow],
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.width,
              height: isExpanded ? context.height * 0.24 : 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: context.theme.brightness == Brightness.dark
                      ? Color.fromRGBO(51, 51, 51, 1)
                      : Color.fromRGBO(229, 229, 229, 1),
                ),
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
                padding: EdgeInsets.only(
                  right: context.width * 0.062,
                  left: context.width * 0.062,
                  bottom: 8.0,
                  top: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ردیف اول آیکون‌ها (بالا)
                    if (isExpanded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                            onTap: () {
                              _navigationController.navToHome();
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 2.0,
                              ),
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      navigationController.nav[0],
                                      width: 16.0,
                                      height: 16.0,
                                      colorFilter: ColorFilter.mode(
                                        _navigationController.currentIndex == 0
                                            ? Colors.pink
                                            : Theme.of(context).brightness ==
                                                  Brightness.dark
                                            ? Colors.white
                                            : const Color(0xFF04070E),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
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
                          Spacer(),
                          GetBuilder<ThemeControllers>(
                            builder: (controller) {
                              return InkResponse(
                                onTap: () => controller.toggleTheme(),
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0,
                                    vertical: 2.0,
                                  ),
                                  child: SvgPicture.asset(
                                    navigationController.nav[10],
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
                                ),
                              );
                            },
                          ),
                          SizedBox(width: context.width * 0.032),
                          InkResponse(
                            onTap: () {
                              // Add logout functionality
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 2.0,
                              ),
                              child: SvgPicture.asset(
                                navigationController.nav[9],
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
                            ),
                          ),
                          SizedBox(width: context.width * 0.032),
                          InkResponse(
                            onTap: () {
                              // Add logout functionality
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 2.0,
                              ),
                              child: SvgPicture.asset(
                                navigationController.nav[8],
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
                            ),
                          ),
                          SizedBox(width: context.width * 0.032),
                          InkResponse(
                            onTap: () {
                              LoginController.to.logout();
                              LoginController.to.update();
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 2.0,
                              ),
                              child: SvgPicture.asset(
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
                            ),
                          ),
                        ],
                      ),
                    if (isExpanded) Spacer(),
                    // ردیف دوم آیکون‌ها (وسط)
                    if (isExpanded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                            onTap: () {
                              _navigationController.navToCompany();
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
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
                                        _navigationController.currentIndex == 4
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
                                            fontSize: ResponsiveFontSize(
                                              8.0,
                                            ).ssp,
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
                          InkResponse(
                            onTap: () {
                              _navigationController.navigateToSettings();
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
                                        _navigationController.currentIndex == 5
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
                                            fontSize: ResponsiveFontSize(
                                              8.0,
                                            ).ssp,
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
                          Visibility(
                            visible: false,
                            maintainSize: true, // فضا را حفظ می‌کند
                            maintainAnimation:
                                true, // انیمیشن را حفظ می‌کند (اجباری)
                            maintainState: true, // state را حفظ می‌کند
                            child: Icon(Icons.star),
                          ),
                          Visibility(
                            visible: false,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: Icon(Icons.star),
                          ),
                        ],
                      ),
                    if (isExpanded) Spacer(),
                    // ردیف سوم آیکون‌ها (پایین، همان ردیف اصلی)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavItem(
                          _navigationController.nav[4],
                          "Dashboard",
                          1,
                        ),
                        _buildNavItem(
                          _navigationController.nav[5],
                          "Resume",
                          2,
                        ),
                        _buildNavItem(_navigationController.nav[6], "Jobs", 3),
                        InkResponse(
                          onTap: _toggleExpand,
                          child: SvgPicture.asset(
                            navigationController.nav[7],
                            width: 34.0,
                            height: 34.0,
                            colorFilter: ColorFilter.mode(
                              isExpanded
                                  ? Colors.pink
                                  : Theme.of(context).brightness ==
                                        Brightness.dark
                                  ? Colors.white
                                  : AppThemeColors.navColorIcon,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    final isSelected = _navigationController.currentIndex == index;
    return InkResponse(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
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
