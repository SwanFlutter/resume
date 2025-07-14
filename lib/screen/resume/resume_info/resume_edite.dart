import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/controller/resume_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box_widget.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/global/title_card_box_widget.dart';
import 'package:resume/widgets/resume/courses/date_text_field_cours_widget.dart';

class ResumeEdite extends StatelessWidget {
  const ResumeEdite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              children: [
                const LogoWidget(),
                AppBarWidget(
                  title: "Resume Edit",
                  imageIcon: "assets/reuomeh/personalcard.svg",
                  onPressed: () {
                    final navigationController = NavigationController.to;
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 12) {
                      navigationController.navToResumeInfo();
                    } else {
                      Get.back();
                    }
                  },
                ),

                // Scrollable content
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Avatar.profile(
                                  text: "Sajjad",
                                  radius: context.height * 0.04,
                                  randomColor: false,
                                  randomGradient: true,
                                  backgroundColorCamera: const Color.fromRGBO(
                                    30,
                                    51,
                                    99,
                                    1,
                                  ),
                                  icon: Icons.camera,
                                  useMaterialColorForGradient: true,
                                  iconColor: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: context.height * 0.01),
                            // box Personal Information
                            CardBoxWidget(
                              width: context.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TitleCardBoxWidget(
                                    title: "Personal Information",
                                  ),
                                  SizedBox(height: context.height * 0.02),
                                  GetBuilder<ResumeController>(
                                    builder: (controller) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomDropdownWidget(
                                                  width: context.width,
                                                  controller: controller,
                                                  label: "Gender *",
                                                  dropdownId: 'Gender',
                                                  title: controller.gender,
                                                  titleList:
                                                      controller.genderList,
                                                  height:
                                                      context.height * 0.045,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Military Status *',
                                                  hint: 'Describe Text',
                                                  controllerInstance:
                                                      controller.militaryStatus,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CupertioDateField(
                                                  hint: "Edit Date",
                                                  label: 'Date of Birth *',
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Marital Status *',
                                                  hint: 'Describe Text',
                                                  controllerInstance:
                                                      controller.maritalStatus,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          CustomFieldsWidget(
                                            label: "Descriptions",
                                            hintAlignment: Alignment.topLeft,
                                            controllerInstance:
                                                controller.description,
                                            width: context.width,
                                            hint: " Description",
                                            height: context.height * 0.1,
                                            maxLines: 5,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ).paddingAll(8.0),
                            ),
                            SizedBox(height: context.height * 0.01),

                            // box Contact Information
                            CardBoxWidget(
                              width: context.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TitleCardBoxWidget(
                                    title: "Contact Information",
                                  ),
                                  SizedBox(height: context.height * 0.02),
                                  GetBuilder<ResumeController>(
                                    builder: (controller) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'First Name *',
                                                  hint: 'Eva',
                                                  controllerInstance:
                                                      controller.firstname,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Last Name *',
                                                  hint: 'Robbins',
                                                  controllerInstance:
                                                      controller.lastname,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'National Code *',
                                                  hint: '32563212565',
                                                  controllerInstance:
                                                      controller.nationalCode,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Nationality *',
                                                  hint: 'Iranian',
                                                  controllerInstance:
                                                      controller.nationality,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ).paddingAll(8.0),
                            ),
                            SizedBox(height: context.height * 0.01),
                            // box Job Preferences
                            CardBoxWidget(
                              width: context.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TitleCardBoxWidget(title: "Job Preferences"),
                                  SizedBox(height: context.height * 0.02),
                                  GetBuilder<ResumeController>(
                                    builder: (controller) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Working Category *',
                                                  hint: 'Manager',
                                                  controllerInstance: controller
                                                      .workingCategory,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Minimal Salary *',
                                                  hint: '5000000',
                                                  controllerInstance:
                                                      controller.minimalSalary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          CustomFieldsWidget(
                                            width: context.width,
                                            label: 'Orgianizatiolonal *',
                                            hint: 'Category',
                                            controllerInstance:
                                                controller.orgianizatiolonal,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ).paddingAll(8.0),
                            ),
                            SizedBox(height: context.height * 0.01),
                            // box addreses
                            CardBoxWidget(
                              width: context.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TitleCardBoxWidget(title: "Addreses"),
                                  SizedBox(height: context.height * 0.02),
                                  GetBuilder<ResumeController>(
                                    builder: (controller) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'Country *',
                                                  hint: 'Iran',
                                                  controllerInstance:
                                                      controller.country,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: CustomFieldsWidget(
                                                  width: context.width,
                                                  label: 'City *',
                                                  hint: 'Qazvin',
                                                  controllerInstance:
                                                      controller.city,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          CustomFieldsWidget(
                                            width: context.width,
                                            label: 'Addreses *',
                                            hint: 'Address',
                                            controllerInstance:
                                                controller.addreses,
                                            height: context.height * 0.045,
                                          ),
                                          SizedBox(
                                            height: context.height * 0.02,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ).paddingAll(8.0),
                            ),
                            SizedBox(height: context.height * 0.03),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Non-scrollable content
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1300),
              curve: Curves.easeInOutCubic,
              bottom: bottomNavController.isExpanded
                  ? bottomNavController.fabBottomPosition(context)
                  : bottomNavController.bottomNavBarTop.value,
              right: context.height * 0.022,
              child: FloatingActionButton(
                onPressed: () {
                  final navigationController = NavigationController.to;
                  navigationController.navToResumeEdite();
                },
                backgroundColor: AppThemeColors.editeFabColor,
                elevation: 0,
                shape: const StadiumBorder(),
                child: Image.asset(
                  "assets/Vector.png",
                  width: 24.0,
                  height: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/** floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppThemeColors.editeFabColor,
        shape: const StadiumBorder(),
        child: Image.asset("assets/Vector.png", width: 24.0, height: 24.0),
      ), */