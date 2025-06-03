import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/file_widget.dart';

class CreateCourses extends StatelessWidget {
  const CreateCourses({super.key});

  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Add New Courses",
                  imageIcon: "assets/reuomeh/Academy.svg",
                  onPressed: () {
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 13) {
                      navigationController.navToCoursesPage();
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
                                    controllerInstance: TextEditingController(),
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
                                    controllerInstance: TextEditingController(),
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
                                    controllerInstance: TextEditingController(),
                                    hint: "Content",
                                    width: getFieldWidth(),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: CustomFieldsWidget(
                                    label: "Date *",
                                    controllerInstance: TextEditingController(),
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
                                      borderRadius: BorderRadius.circular(4.0),
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
                            ).paddingOnly(left: 5.0),
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
                                    SizedBox(width: 5),
                                    Text(
                                      "By Degree",
                                      style: TextStyleHelper
                                          .body10W400RegularOpenSans,
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
                                    SizedBox(width: 5),
                                    Text(
                                      "By Certificate",
                                      style: TextStyleHelper
                                          .body10W400RegularOpenSans,
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
                            hint: "Description",
                            width: getFullWidth() - 32,
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ).marginOnly(bottom: 100),
              ],
            ),
          ),

          // Floating Action Button
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.ease,
            bottom: 0,
            right: 16.0,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppThemeColors.addFabColor,
              shape: StadiumBorder(),
              onPressed: () {
                navigationController.navToEditCreateCourses();
              },
              child: Image.asset(
                "assets/isIconOnly.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
