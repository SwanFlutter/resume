import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/add_new_hard_skills_controller.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/widgets/resume/skil/custom_expanded_chip.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class AddNewHardSkillsPage extends StatefulWidget {
  const AddNewHardSkillsPage({super.key});

  @override
  State<AddNewHardSkillsPage> createState() => _AddNewHardSkillsPageState();
}

class _AddNewHardSkillsPageState extends State<AddNewHardSkillsPage> {
  final bottomNavController = BottomNavigationController.to;

  final List<List<String>> skills = [
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
  ];

  final List<String> industrial = [
    'Software',
    'Technology',
    'Natural resource jobs',
    'Office',
  ];

  final List<String> field = [
    'Technology',
    'Software',
    'Natural resource jobs',
    'Office',
  ];

  bool isSkillsExpanded = true;

  // Add state management for selected skills - one Set for each row
  final List<Set<String>> selectedSkillsRows = [
    <String>{},
    <String>{},
    <String>{},
  ];
  final Set<String> selectedIndustrial = <String>{};
  final Set<String> selectedField = <String>{};

  @override
  Widget build(BuildContext context) {
    final addNewHardSkillsController = AddNewHardSkillsController.to;
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Add New Hard Skills",
                  imageIcon: 'assets/star.png',
                  isSearch: true,
                  onPressed: () {
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 16) {
                      navigationController.navToSkills();
                    } else {
                      Get.back();
                    }
                  },
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            CustomExpandedChip(
                              addNewHardSkillsController:
                                  addNewHardSkillsController,
                              title: "Skills *",
                            ),
                            SizedBox(height: context.height * 0.02),
                            CustomExpandedChip(
                              addNewHardSkillsController:
                                  addNewHardSkillsController,
                              title: "Industrial *",
                              isExpandedIcon: false,
                            ),
                            SizedBox(height: context.height * 0.02),
                            CustomExpandedChip(
                              addNewHardSkillsController:
                                  addNewHardSkillsController,
                              title: "Industrial *",
                              isExpandedIcon: false,
                            ),
                          ],
                        ),
                      ),
                      // FloatingActionButton
                      Obx(
                        () => AnimatedPositioned(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOutCubic,
                          bottom: bottomNavController.isExpanded
                              ? bottomNavController.fabBottomPosition(context)
                              : context.width * 0.04,
                          right: context.height * 0.022,
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: AppThemeColors.addFabColor,
                            shape: const StadiumBorder(),
                            onPressed: () {
                              // ذخیره اسکیل‌های انتخاب شده
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
