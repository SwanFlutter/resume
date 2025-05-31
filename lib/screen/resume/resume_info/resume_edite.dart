import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/controller/resume_controller.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/date_text_field_widget.dart';
import 'package:resume/widgets/resume/descriptions_edite_info_widget.dart';
import 'package:resume/widgets/resume/gender_feild_widget.dart';

class ResumeEdite extends StatelessWidget {
  const ResumeEdite({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Stack(
        children: [
          // محتوای اصلی صفحه
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100), // فضای کافی برای FAB
            child: Column(
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Resume Edite",
                  onPressed: () {
                    final navigationController = NavigationController.to;
                    // اگر در صفحات فرعی Resume هستیم، برگرد به Resume Page
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 12) {
                      navigationController
                          .navToResumeInfo(); // برگشت به Resume Page
                    } else {
                      // در غیر این صورت از Get.back استفاده کن
                      Get.back();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Avatar.profile(
                      text: "Sajjad",
                      radius: 40,
                      randomColor: false,
                      randomGradient: true,
                      backgroundColorCamera: Color.fromRGBO(30, 51, 99, 1),
                      icon: Icons.camera,
                      useMaterialColorForGradient: true,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 288,
                  height: 289,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: context.theme.colorScheme.onPrimary,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 3,

                        blurStyle: BlurStyle.normal,
                        color: Color.fromRGBO(8, 14, 28, 0.2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ).paddingOnly(top: 10),
                      SizedBox(height: 5),
                      GetBuilder<ResumeController>(
                        builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 5,
                                runSpacing: 10,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GenderFeildWidget(
                                        controller: controller,
                                        label: 'Gender *',
                                      ),
                                    ],
                                  ),
                                  CustomFieldsWidget(
                                    label: 'MilitaryStatusWidget *',
                                    controllerInstance: controller.text1,
                                    hint: 'Describe Text',
                                  ),

                                  // RegularTextFieldWidget
                                  DateTextFieldWidget(
                                    controller: controller,
                                    label: 'Date Of Birth *',
                                  ),

                                  CustomFieldsWidget(
                                    label: 'Marital Status *',
                                    controllerInstance: controller.text3,
                                    hint: 'Describe Text',
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Descriptions",
                                style:
                                    TextStyleHelper.title10W700RegularOpenSans,
                              ).paddingOnly(top: 8.0),
                              SizedBox(height: 4),
                              DescriptionsEditeInfoWidget(
                                controller: controller,
                                hint: "Write your description here...",
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ).paddingOnly(left: 5.0, right: 10.0),
                ),
                SizedBox(height: 20.0), // فضای اضافی در انتها
              ],
            ),
          ),
          // FloatingActionButton شناور در گوشه
          Positioned(
            bottom: 15, // فاصله از پایین (بالای bottom navigation)
            right: 16, // فاصله از راست
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppThemeColors.editeFabColor,
              shape: StadiumBorder(),
              child: Image.asset(
                "assets/Vector.png",
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
