import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/custom/custom_progress_indicator.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class SoftSkillsPage extends StatelessWidget {
  SoftSkillsPage({super.key});

  final List<Map<String, dynamic>> skills = [
    {
      'name': 'Mind Mapping',
      'level': 'B',
      'grad': '30%',
      'date': '2023',
      'progress': 80,
      'color': Color.fromRGBO(34, 173, 92, 1),
    },
    {
      'name': 'Focus',
      'level': 'C',
      'grad': '30%',
      'date': '2023',
      'progress': 20,
      'color': Colors.red,
    },
    {
      'name': 'Mind Mapping',
      'level': 'B',
      'grad': '30%',
      'date': '2023',
      'progress': 80,
      'color': Colors.green,
    },
    {
      'name': 'Focus',
      'level': 'C',
      'grad': '30%',
      'date': '2023',
      'progress': 20,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavController = BottomNavigationController.to;

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              LogoWidget(),
              AppBarWidget(
                title: "Soft Skills",
                imageIcon: 'assets/star.png',
                isSearch: true,
                onPressed: () {
                  if (navigationController.currentIndex >= 6 &&
                      navigationController.currentIndex <= 15) {
                    navigationController.navToSkills();
                  } else {
                    Get.back();
                  }
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: skills.length,

                  itemBuilder: (context, index) {
                    final skill = skills[index];
                    return CardBoxWidget(
                      height: context.height * 0.11,
                      boxShadow: context.theme.brightness == Brightness.dark
                          ? [resumeBoxShadowDark]
                          : [resumeBoxShadow],
                      isBorder: true,
                      isSkils: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 8.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/skills-svgrepo.svg",
                                        width: 14.0,
                                        height: 14.0,
                                        colorFilter: ColorFilter.mode(
                                          context.theme.brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : AppThemeColors
                                                    .titleFieldTextcolor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        skill['name'],
                                        style:
                                            context.theme.brightness ==
                                                Brightness.dark
                                            ? TextStyleHelper
                                                  .title12W600RegularOpenSansDark
                                            : TextStyleHelper
                                                  .title12W600RegularOpenSans,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildInfoItem(
                                        'Level:',
                                        skill['level'],
                                        context,
                                      ),
                                      _buildInfoItem(
                                        'Grad:',
                                        skill['grad'],
                                        context,
                                      ),
                                      _buildInfoItem(
                                        'Date:',
                                        skill['date'],
                                        context,
                                      ),
                                    ],
                                  ),
                                ],
                              ).paddingOnly(top: 12.0, bottom: 8.0, left: 8.0),
                            ),
                            const SizedBox(width: 8),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomProgressIndicator(
                                  progress: skill['progress'],
                                  gradientColors: [
                                    skill['color'],
                                    skill['color'].withOpacity(0.7),
                                    skill['color'].withOpacity(0.5),
                                  ],
                                  size: 65,
                                  showDoubleProgress: true,
                                  secondaryProgress: skill['progress'],
                                  strokeWidth: 4,
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: skill['color'],
                                  ),
                                ).paddingOnly(left: 0),
                              ],
                            ),
                          ],
                        ).paddingOnly(right: 15.0),
                      ),
                    ).marginOnly(
                      bottom: context.height * 0.013,
                      right: context.width * 0.04,
                      left: context.width * 0.04,
                    );
                  },
                ),
              ),
            ],
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeInOutCubic,
              bottom: bottomNavController.isExpanded
                  ? bottomNavController.fabBottomPosition(context)
                  : context.height * 0.0015,
              right: context.height * 0.022,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppThemeColors.addFabColor,
                shape: const StadiumBorder(),
                onPressed: () {
                  navigationController.navToAddNewHardSkillsPage();
                },
                child: Image.asset(
                  "assets/isIconOnly.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).brightness == Brightness.dark
              ? TextStyleHelper.label10W400RegularOpenSansDark.copyWith(
                  color: AppThemeColors.gray,
                )
              : TextStyleHelper.label10W400RegularOpenSans.copyWith(
                  color: AppThemeColors.gray,
                ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: Theme.of(context).brightness == Brightness.dark
              ? TextStyleHelper.label10W600SemiBoldOpenSansDark
              : TextStyleHelper.label10W600SemiBoldOpenSans,
        ),
      ],
    );
  }
}
