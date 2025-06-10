import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/custom/custom_progress_indicator.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/background_colors.dart';
import 'package:resume/widgets/global/card_box.dart';
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

    return Stack(
      children: [
        SafeArea(
          child: BackgroundColors(
            child: ListView.builder(
              itemCount: skills.length + 3, // Logo, AppBar, bottom padding
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (context, index) {
                if (index == 0) return LogoWidget();
                if (index == 1) {
                  return AppBarWidget(
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
                  );
                }

                if (index == 2) return const SizedBox(height: 21);

                final skill = skills[index - 3];

                return CardBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
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
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    skill['name'],
                                    style: TextStyleHelper
                                        .body12W400RegularOpenSans
                                        .copyWith(
                                          color: AppThemeColors
                                              .titleFieldTextcolor,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildInfoItem('Level:', skill['level']),
                                  const SizedBox(width: 16),
                                  _buildInfoItem('Grad:', skill['grad']),
                                  const SizedBox(width: 16),
                                  _buildInfoItem('Date:', skill['date']),
                                ],
                              ),
                            ],
                          ),
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
                              size: 56,
                              showDoubleProgress: true,
                              secondaryProgress: skill['progress'],
                              strokeWidth: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).marginOnly(bottom: 8.0, right: 16.0, left: 16.0);
              },
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.ease,
            bottom: bottomNavController.fabBottomPosition(context),
            right: 16.0,
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
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
            color: const Color.fromRGBO(136, 136, 136, 1),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
            color: AppThemeColors.titleFieldTextcolor,
          ),
        ),
      ],
    );
  }
}
