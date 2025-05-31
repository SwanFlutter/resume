import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/background_colors.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class Skils extends StatelessWidget {
  const Skils({super.key});
  @override
  Widget build(BuildContext context) {
    return BackgroundColors(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoWidget(),
          AppBarWidget(
            title: "Skills",
            imageIcon: "assets/lamp-charge.png",
            onPressed: () {
              if (navigationController.currentIndex >= 6 &&
                  navigationController.currentIndex <= 12) {
                navigationController.navToResume(); // برگشت به Resume Page
              } else {
                Get.back(); // برگشت به صفحه قبلی
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: CardBox(
                    height: 32,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4C080E1C),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      ),
                    ],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                        SvgPicture.asset(
                          "assets/star.svg",
                          width: 14.0,
                          height: 14.0,
                        ),
                        Text(
                          'Soft Skills',
                          style: TextStyleHelper.body12W400RegularOpenSans,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 4.0),
                  ).marginOnly(bottom: 8.0),
                );
              },
            ).paddingSymmetric(horizontal: 16.0),
          ),
        ],
      ),
    );
  }
}
