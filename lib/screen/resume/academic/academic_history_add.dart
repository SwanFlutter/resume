import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/academic_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class AcademicHistoryAdd extends StatelessWidget {
  const AcademicHistoryAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Add New Academic History",
                  imageIcon: "assets/reuomeh/personalcard.svg",
                  onPressed: () {
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 19) {
                      navigationController
                          .navToAcademicHistory(); // Return to Resume Page
                    } else {
                      Get.back(); // Return to the previous page
                    }
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CardBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: context.height * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "general Information",
                                    style: TextStyleHelper
                                        .title14W600RegularOpenSans,
                                  ),
                                ],
                              ),
                              SizedBox(height: context.height * 0.01),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      width: context.width,
                                      label: "Degree *",
                                      hint: "Designer",
                                      controllerInstance:
                                          TextEditingController(),
                                    ),
                                  ),
                                  SizedBox(width: context.width * 0.01),
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      width: context.width,
                                      label: "Place of Study *",
                                      hint: "Apple, Google, etc.",
                                      controllerInstance:
                                          TextEditingController(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: context.height * 0.01),
                              // ردیف سوم
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      label: "start Date*",
                                      controllerInstance:
                                          TextEditingController(),
                                      hint: "YYYY/MM/DD",
                                      width: context.width,
                                      prefixIcon: true,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      label: "Quit Date",
                                      controllerInstance:
                                          TextEditingController(),
                                      hint: "YYYY/MM/DD",
                                      width: context.width,

                                      prefixIcon: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: context.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: Checkbox.adaptive(
                                      checkColor: AppThemeColors.colorFF9999,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          4.0,
                                        ),
                                      ),
                                      side: WidgetStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                          width: 1.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Flexible(
                                    child: Text(
                                      "I am currently In This Course",
                                      style: TextStyleHelper
                                          .title14W400RegularOpenSans
                                          .copyWith(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ).paddingOnly(left: 5.0, bottom: 8.0),
                            ],
                          ).paddingAll(8.0),
                        ).paddingSymmetric(horizontal: 16.0),
                        SizedBox(height: context.height * 0.01),
                        CardBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: context.height * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Detail Information",
                                    style: TextStyleHelper
                                        .title14W600RegularOpenSans,
                                  ),
                                ],
                              ),
                              SizedBox(height: context.height * 0.01),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      width: context.width,
                                      label: "Thesis title *",
                                      hint: "Describe Text",
                                      controllerInstance:
                                          TextEditingController(),
                                    ),
                                  ),
                                  SizedBox(width: context.width * 0.01),
                                  Expanded(
                                    child: GetBuilder<AcademicController>(
                                      builder: (controller) {
                                        return CustomDropdownWidget(
                                          width: context.width,
                                          controller: controller,
                                          label: 'Field of Study',
                                          dropdownId: 'Field of Study',
                                          title: controller.title,
                                          titleList: controller.academicLevels,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: context.height * 0.01),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      width: context.width,
                                      label: "GPA *",
                                      hint: "Describe Text",
                                      controllerInstance:
                                          TextEditingController(),
                                    ),
                                  ),
                                  SizedBox(width: context.width * 0.01),
                                  Expanded(
                                    child: GetBuilder<AcademicController>(
                                      builder: (controller) {
                                        return CustomDropdownWidget(
                                          width: context.width,
                                          controller: controller,
                                          label: 'University Type *',
                                          dropdownId: 'University Type',
                                          title: controller.titleUniversity,
                                          titleList: controller.universityList,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: context.height * 0.01),
                              CustomFieldsWidget(
                                width: context.width,
                                label: "City *",
                                hint: "Qazvin, Tehran, etc.",
                                controllerInstance: TextEditingController(),
                              ),
                              SizedBox(height: context.height * 0.01),

                              CustomFieldsWidget(
                                controllerInstance: TextEditingController(),
                                label: 'Description *',
                                hint: "Description",
                                width: context.width,
                                height: context.height * 0.1,
                                vertical: 8.0,
                                maxLines: 6,
                              ),
                            ],
                          ).paddingAll(8.0),
                        ).paddingSymmetric(horizontal: 16.0),
                        SizedBox(height: context.height * 0.15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.ease,
            bottom: 0.0,
            right: 16.0,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppThemeColors.editeFabColor,
              shape: StadiumBorder(),
              onPressed: () {
                navigationController.navToAchievement();
              },
              child: Image.asset("assets/Vector.png", width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }
}
