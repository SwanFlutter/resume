import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class Achivement extends StatelessWidget {
  const Achivement({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: context.width,
              height: context.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoWidget(),
                  AppBarWidget(
                    title: "Achievements and accolades",
                    imageIcon: "assets/reuomeh/cup-star-svgrepo-com 1.svg",
                    onPressed: () {
                      if (navigationController.currentIndex >= 6 &&
                          navigationController.currentIndex <= 12) {
                        navigationController
                            .navToResume(); // Return to Resume Page
                      } else {
                        Get.back(); // Return to the previous page
                      }
                    },
                  ),
                  SizedBox(height: 21),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return CardBox(
                          width: context.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                spacing: 1.0,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "assets/reuomeh/cup-star-svgrepo-com 1.svg",
                                    width: 14,
                                    height: 14,
                                  ),

                                  Text(
                                    "Best Referee",
                                    style: TextStyleHelper
                                        .title14W600RegularOpenSans
                                        .copyWith(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Top 5 Product Design Lead in the world !",
                                style: TextStyle(
                                  color: const Color(0xFF064368),
                                  fontSize: 10,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2024",
                                    style: TextStyleHelper
                                        .label10W600SemiBoldOpenSans,
                                  ),

                                  Text(
                                    "Iran - Tehran".toUpperCase(),
                                    style: TextStyleHelper
                                        .label10W600SemiBoldOpenSans,
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 3.0),
                            ],
                          ).paddingAll(8.0),
                        ).paddingOnly(left: 16, right: 16.0, bottom: 8.0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.ease,
            bottom: 0.0,
            right: 16.0,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppThemeColors.addFabColor,
              shape: StadiumBorder(),
              onPressed: () {
                navigationController.navToAddNewAchivement();
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
