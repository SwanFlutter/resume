import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/background_colors.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/file_widget.dart';

class EditCreateCourse extends StatelessWidget {
  const EditCreateCourse({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController = BottomNavigationController.to;
    final screenWidth = MediaQuery.of(context).size.width;
    final _ = MediaQuery.of(context).size.height;

    // محاسبه عرض‌های رسپانسیو
    double getFieldWidth() {
      if (screenWidth > 600) {
        return (screenWidth - 64) / 2 - 8; // برای تبلت و دسکتاپ
      } else {
        return screenWidth * 0.42; // برای موبایل
      }
    }

    double getFullWidth() {
      return screenWidth - 32; // کل عرض منهای padding
    }

    return SafeArea(
      child: Stack(
        children: [
          BackgroundColors(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  LogoWidget(),
                  AppBarWidget(
                    title: "Edit Courses",
                    imageIcon: "assets/reuomeh/Academy.svg",
                    onPressed: () {
                      if (navigationController.currentIndex >= 6 &&
                          navigationController.currentIndex <= 13) {
                        navigationController.navToCreateCourses();
                      } else {
                        Get.back();
                      }
                    },
                  ),

                  // کارت اول - اطلاعات کورس
                  Container(
                    width: getFullWidth(),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CardBox(
                      width: getFullWidth(),
                      child: GetBuilder<CoursesController>(
                        init: CoursesController(),
                        builder: (controller) => Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // ردیف اول
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      label: "Type *",
                                      controllerInstance:
                                          TextEditingController(),
                                      hint: "Designer",
                                      width: getFieldWidth(),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: CustomDropdownWidget(
                                      controller: controller,
                                      label: "State *",
                                      dropdownId: "course_title",
                                      width: getFieldWidth(),
                                      height: 32,
                                      title: controller.title,
                                      titleList: controller.titleList,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),

                              // ردیف دوم
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      label: "Course duration (hour) *",
                                      controllerInstance:
                                          TextEditingController(),
                                      hint: "20",
                                      width: getFieldWidth(),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: CustomDropdownWidget(
                                      controller: controller,
                                      label: "Course Level *",
                                      dropdownId: "course_level",
                                      width: getFieldWidth(),
                                      height: 32,
                                      title: controller.courseLevel,
                                      titleList: controller.typeCourseLevel,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),

                              // ردیف سوم
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      label: "Name of the institution *",
                                      controllerInstance:
                                          TextEditingController(),
                                      hint: "Content",
                                      width: getFieldWidth(),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: CustomFieldsWidget(
                                      label: "Date *",
                                      controllerInstance:
                                          TextEditingController(),
                                      hint: "YYYY/MM/DD",
                                      width: getFieldWidth(),

                                      prefixIcon: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              // چک باکس
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
                                          .title14W400RegularOpenSans,
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

                  SizedBox(height: 16.0),

                  // کارت دوم - آپلود و توضیحات
                  Container(
                    width: getFullWidth(),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CardBox(
                      width: getFullWidth(),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // فایل ویجت
                            FileWidget(
                              controllerInstance: TextEditingController(),
                              height: 32,
                            ),
                            SizedBox(height: 16.0),

                            // ردیف چک باکس‌ها
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    "Upload portfolio *",
                                    style: TextStyleHelper
                                        .title10W700RegularOpenSans,
                                  ),
                                  SizedBox(width: 16),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: Checkbox.adaptive(
                                          checkColor:
                                              AppThemeColors.colorFF9999,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          side:
                                              WidgetStateBorderSide.resolveWith(
                                                (states) => BorderSide(
                                                  width: 1.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "By Degree",
                                        style: TextStyleHelper
                                            .label10W400RegularOpenSans,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: Checkbox.adaptive(
                                          checkColor:
                                              AppThemeColors.colorFF9999,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          side:
                                              WidgetStateBorderSide.resolveWith(
                                                (states) => BorderSide(
                                                  width: 1.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "By Certificate",
                                        style: TextStyleHelper
                                            .label10W400RegularOpenSans,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // فیلد محتوا
                            CustomFieldsWidget(
                              width: getFullWidth() - 32,
                              label: "",
                              controllerInstance: TextEditingController(),
                              hint: "Add Content",

                              prefixIcon: false,
                            ),
                            SizedBox(height: 16.0),

                            // فیلد توضیحات
                            CustomFieldsWidget(
                              controllerInstance: TextEditingController(),
                              label: 'Description *',
                              width: getFullWidth() - 32,
                              maxLines: 6,
                              height: 120.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).marginOnly(bottom: 100),
                ],
              ),
            ),
          ),

          // Floating Action Button
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              curve: Curves.ease,
              bottom: bottomNavController.fabBottomPosition,
              right: 16.0,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppThemeColors.editeFabColor,
                shape: StadiumBorder(),
                onPressed: () {
                  navigationController.navToCreateCourses();
                },
                child: Image.asset("assets/edite.png", width: 24, height: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/date_text_field_cours_widget.dart';
import 'package:resume/widgets/resume/courses/file_widget.dart';
import 'package:resume/widgets/resume/courses/type_dropdown_widget.dart';

class CreateCourses extends StatelessWidget {
  const CreateCourses({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LogoWidget(),
          AppBarWidget(title: "Edit Courses", icon: Icons.menu_book),
          Container(
            width: 288,
            height: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: context.theme.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
              ],
            ),
            child: GetBuilder<CoursesController>(
              init: CoursesController(),
              builder: (controller) => Wrap(
                runSpacing: 5,
                spacing: 3,
                children: [
                  CustomFieldsWidget(
                    label: "Type *",
                    controllerInstance: TextEditingController(),
                    hint: "Designer",
                  ),
                  CustomDropdownWidget(
                    controller: controller,
                    label: "State *",
                  ),
                  CustomFieldsWidget(
                    width: context.width,
                    label: "School *",
                    controllerInstance: TextEditingController(),
                    hint: "School",
                  ),
                  DateTextFielCoursdWidget(
                    controller: controller,
                    label: "Date *",
                  ),
                  TypeDropdownWidget(controller: controller, label: "Type *"),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5),
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: Checkbox.adaptive(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "I am currently In This Course",
                        style: TextStyle(
                          color: AppThemeColors.titleFieldTextcolor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 8, vertical: 8),
            ),
          ).paddingOnly(left: 8, right: 8),

          SizedBox(height: 16.0),
          // box two
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: context.theme.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
              ],
            ),
            height: 212,
            width: 288,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FileWidget(controllerInstance: TextEditingController()),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "Upload portfolio *",
                      style: TextStyle(
                        color: AppThemeColors.titleFieldTextcolor,
                        fontWeight: FontWeight.w800,
                        fontSize: 10.0,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: Checkbox.adaptive(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "By Degree",
                      style: TextStyle(
                        color: AppThemeColors.titleFieldTextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0,
                      ),
                    ).paddingOnly(right: 8.0),
                    SizedBox(
                      width: 14,
                      height: 14,

                      child: Checkbox.adaptive(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "By Degree",
                      style: TextStyle(
                        color: AppThemeColors.titleFieldTextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0,
                      ),
                    ).paddingOnly(right: 8.0),
                  ],
                ),
                FileWidget(
                  controllerInstance: TextEditingController(),
                  titel: "",
                ),
                SizedBox(height: 8.0),
                CustomFieldsWidget(
                  controllerInstance: TextEditingController(),
                  label: 'Description *',
                  width: context.width,
                ),
              ],
            ).paddingSymmetric(horizontal: 8.0, vertical: 10.0),
          ).paddingOnly(left: 8.0, right: 8.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add New Course",
        shape: StadiumBorder(),
        backgroundColor: AppThemeColors.editeFabColor,
        child: Image.asset("assets/Vector.png", width: 24, height: 24),
      ),
    );
  }
}
*/
