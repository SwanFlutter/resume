// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/config/extentions/extension_on_flutter.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/themes/theme.dart'
    hide backgroudColorFeild, AppThemeColors;
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:theme_master/theme_master.dart';

class ResumehInfo extends StatefulWidget {
  const ResumehInfo({super.key});
  @override
  State<ResumehInfo> createState() => _ResumehInfoState();
}

class _ResumehInfoState extends State<ResumehInfo> {
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
                LogoWidget(),
                AppBarWidget(
                  title: "Resume Info",
                  imageIcon: "assets/reuomeh/personalcard.svg",
                  onPressed: () {
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 12) {
                      navigationController.navToResume();
                    } else {
                      Get.back();
                    }
                  },
                ),

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
                                Avatar(
                                  text: "Sajjad",
                                  radius: 35,
                                  randomColor: false,
                                  randomGradient: true,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            CardBox(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Personal Information",
                                        style:
                                            context.theme.brightness ==
                                                Brightness.dark
                                            ? TextStyleHelper
                                                  .title14W400RegularOpenSansDark
                                            : TextStyleHelper
                                                  .title14W400RegularOpenSans,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: context.height * 0.01),
                                  RowCard(
                                    imageIcon:
                                        "assets/reuomeh/info/profile-tick.svg",
                                    text: 'Female',
                                    imageIcon1:
                                        "assets/reuomeh/info/shield.svg",
                                    text1: 'None',
                                  ),
                                  SizedBox(height: context.height * 0.01),
                                  RowCard(
                                    imageIcon:
                                        "assets/reuomeh/info/calendar-2.svg",
                                    text: '2000/19/10',
                                    imageIcon1: "assets/reuomeh/info/heart.svg",
                                    text1: 'Single',
                                  ),
                                  SizedBox(height: context.height * 0.01),
                                  DescriotionView(
                                    width: context.width,
                                    height: context.height * 0.14,
                                  ),
                                ],
                              ).paddingAll(8.0),
                            ).paddingSymmetric(horizontal: 16.0),
                            SizedBox(height: context.height * 0.01),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: CardBox(
                                width: context.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Contact Information",
                                      style:
                                          context.theme.brightness ==
                                              Brightness.dark
                                          ? TextStyleHelper
                                                .title14W400RegularOpenSansDark
                                          : TextStyleHelper
                                                .title14W400RegularOpenSans,
                                    ).paddingOnly(top: 8.0),
                                    SizedBox(height: context.height * 0.01),
                                    RowCard(
                                      imageIcon:
                                          "assets/reuomeh/info/gps-slash.svg",
                                      text: "4311469391",
                                      imageIcon1:
                                          "assets/reuomeh/info/flag.svg",
                                      text1: "Iran",
                                    ),
                                    SizedBox(height: context.height * 0.01),
                                    RowCard(
                                      imageIcon:
                                          "assets/reuomeh/info/profile.svg",
                                      text: "Eva",
                                      imageIcon1:
                                          "assets/reuomeh/info/profile.svg",
                                      text1: "Rabinson",
                                    ),
                                  ],
                                ).paddingAll(8.0).paddingOnly(bottom: 8.0),
                              ),
                            ),
                            SizedBox(height: context.height * 0.01),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: CardBox(
                                width: context.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CardInfoView(
                                            icon: Icons.language,
                                            text: "Iran",
                                            height: context.height * 0.045,
                                          ),
                                        ),
                                        SizedBox(width: context.width * 0.01),
                                        Expanded(
                                          child: CardInfoView(
                                            icon: Icons.language,
                                            text: "Qazvin",
                                            height: context.height * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: context.height * 0.01),

                                    CardInfoView(
                                      icon: Icons.language,
                                      text: "Sazman varzesh Qazvin",
                                      width: context.width * 0.9,
                                      height: context.height * 0.045,
                                    ),
                                  ],
                                ).paddingAll(8.0).paddingOnly(bottom: 8.0),
                              ),
                            ),
                            SizedBox(height: context.height * 0.01),
                            // four
                            CardBox(
                              width: context.width,
                              child: Column(
                                children: [
                                  RowCard1(
                                    imageIcon:
                                        "assets/reuomeh/info/profile.svg",
                                    text: "Monimum salary",
                                    price: "20000",
                                  ),
                                  SizedBox(height: context.height * 0.01),
                                  RowCard1(
                                    imageIcon:
                                        "assets/reuomeh/info/profile.svg",
                                    text: "Monimum salary",
                                    price: "20000",
                                  ),
                                  SizedBox(height: context.height * 0.01),
                                  RowCard1(
                                    imageIcon:
                                        "assets/reuomeh/info/profile.svg",
                                    text: "Monimum salary",
                                    price: "20000",
                                  ),
                                ],
                              ).paddingAll(8.0),
                            ).paddingSymmetric(horizontal: 16.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: context.height * 0.115,
            right: 22.0,
            child: FloatingActionButton(
              onPressed: () {
                final navigationController = NavigationController.to;
                navigationController.navToResumeEdite();
              },
              backgroundColor: AppThemeColors.addFabColor,
              elevation: 0,
              shape: CircleBorder(),
              child: Image.asset("assets/edite.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class RowCard1 extends StatelessWidget {
  final String imageIcon;
  final String text;
  final String price;
  const RowCard1({
    super.key,
    required this.imageIcon,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: backgroudColorFeild,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(imageIcon, width: 14.0, height: 14.0),
          SizedBox(width: 2),
          Text(text, style: TextStyleHelper.label10W600SemiBoldOpenSans),
          Spacer(),
          Text(
            "\$$price".toNumberFormat(),
            style: TextStyleHelper.label10W600SemiBoldOpenSans,
          ),
        ],
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  final String imageIcon;
  final String text;
  final String imageIcon1;
  final String text1;
  const RowCard({
    super.key,
    required this.imageIcon,
    required this.text,
    required this.imageIcon1,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CardInfoView(
            imageIcon: imageIcon,
            text: text,
            height: context.height * 0.045,
          ),
        ),
        SizedBox(width: context.width * 0.01),
        Expanded(
          child: CardInfoView(
            imageIcon: imageIcon1,
            text: text1,
            height: context.height * 0.045,
          ),
        ),
      ],
    );
  }
}

class DescriotionView extends StatelessWidget {
  final String description;
  final double width;
  final double height;
  const DescriotionView({
    super.key,
    this.width = 292,
    this.height = 96,
    this.description =
        "I Dedicated and disciplined martial artist with 12 years of experience in Kung Fu. achieving a deep understanding of martial arts techniques and philosophies. As a top national and provincial referee, I ensure fair play and uphold the integrity of the sport during competitions. Additionally, I serve as a coach, where I guide and mentor athletes.",
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Descriptions",
            style: TextStyleHelper.label10W700BoldOpenSans,
          ).paddingOnly(top: 8.0),
          SizedBox(height: 4.0),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(colors: backgroudColorFeild),
            ),
            child: SelectableText(
              description,
              textAlign: TextAlign.start,

              style: TextStyleHelper.label10W400RegularOpenSans,
            ).paddingAll(5.0),
          ),
        ],
      ),
    );
  }
}

class CardInfoView extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double iconSize;
  final double height;
  final double width;
  final String? imageIcon;
  const CardInfoView({
    super.key,
    this.icon,
    required this.text,
    this.iconSize = 14.0,
    this.height = 30,
    this.width = 134,
    this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.getBorderColorByEnum(BorderColor.border2),
        ),
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: context.theme.brightness == Brightness.dark
              ? infoBoxColorDark
              : backgroudColorFeild,
        ),
      ),
      child: Row(
        children: [
          if (imageIcon != null)
            imageIcon!.endsWith('.svg')
                ? SvgPicture.asset(
                    imageIcon!,
                    width: 16.0,
                    height: 16.0,
                    colorFilter: ColorFilter.mode(
                      context.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppThemeColors.titleFieldTextcolor,
                      BlendMode.srcIn,
                    ),
                  )
                : Image.asset(
                    imageIcon!,
                    width: 16.0,
                    height: 16.0,
                    color: context.theme.brightness == Brightness.dark
                        ? Colors.white
                        : AppThemeColors.titleFieldTextcolor,
                  )
          else
            Icon(
              icon,
              size: 14.0,
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : AppThemeColors.titleFieldTextcolor,
            ),
          SizedBox(width: 2),
          Text(
            text,
            style: context.theme.brightness == Brightness.dark
                ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                : TextStyleHelper.label10W600SemiBoldOpenSans,
          ).paddingAll(5.0),
        ],
      ).paddingOnly(left: 5.0),
    );
  }
}
