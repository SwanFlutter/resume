// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/screen/resume/resume_info/resume_edite.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class ResumehInfo extends StatelessWidget {
  const ResumehInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            LogoWidget(),
            AppbarWidget(title: "Resume Info"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(
                  text: "Sajjad",
                  radius: 40,
                  randomColor: false,
                  randomGradient: true,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            MeiddelB0xInfo(
              title: "Personal Information",
              cardInfoViews: [
                CardInfoView(icon: Icons.person_search, text: 'Female'),
                CardInfoView(icon: Icons.security, text: 'None'),
                CardInfoView(
                  icon: Icons.date_range_outlined,
                  text: '2000/19/10',
                ),
                CardInfoView(icon: Icons.favorite_border, text: 'Single'),
              ],
              description:
                  "I Dedicated and disciplined martial artist with 12 years of experience in Kung Fu. achieving a deep understanding of martial arts techniques and philosophies. As a top national and provincial referee, I ensure fair play and uphold the integrity of the sport during competitions. Additionally, I serve as a coach, where I guide and mentor athletes.",
            ),
            SizedBox(height: 10.0),
            Container(
              width: 288,
              height: 111,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Contact Information",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingOnly(top: 8.0),
                  SizedBox(height: 5.0),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      CardInfoView(
                        icon: Icons.location_disabled_rounded,
                        text: "4311469391",
                      ),
                      CardInfoView(icon: Icons.flag_outlined, text: "Iran"),
                      CardInfoView(
                        icon: Icons.location_disabled_rounded,
                        text: "4311469391",
                      ),
                      CardInfoView(
                        icon: Icons.location_disabled_rounded,
                        text: "4311469391",
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 5.0),
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => ResumeEdite()),
        backgroundColor: Color.fromRGBO(30, 51, 99, 1),
        shape: CircleBorder(),
        child: Image.asset("assets/edite.png"),
      ),
    );
  }
}

class MeiddelB0xInfo extends StatelessWidget {
  final String title;
  final List<CardInfoView> cardInfoViews;
  final String description;

  const MeiddelB0xInfo({
    super.key,
    required this.title,
    required this.cardInfoViews,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 229,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ).paddingOnly(top: 10),
          SizedBox(height: 5),
          Wrap(spacing: 5, runSpacing: 5, children: cardInfoViews),
          Text(
            "Descriptions",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
          ).paddingOnly(top: 8.0),
          Container(
            width: 292,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(251, 241, 239, 1),
                  Color.fromRGBO(252, 248, 248, 1),
                  Color.fromRGBO(249, 240, 240, 1),
                  Color.fromRGBO(252, 244, 243, 1),
                ],
              ),
            ),
            child: SelectableText(
              description,
              style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
            ),
          ),
        ],
      ).paddingOnly(left: 5.0, right: 5),
    );
  }
}

class CardInfoView extends StatelessWidget {
  final IconData icon;
  final String text;
  const CardInfoView({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(251, 241, 239, 1),
            Color.fromRGBO(252, 248, 248, 1),
            Color.fromRGBO(249, 240, 240, 1),
            Color.fromRGBO(252, 244, 243, 1),
          ],
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14.0).paddingOnly(left: 5),
          Text(
            text,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
          ).paddingOnly(left: 5.0),
        ],
      ),
    );
  }
}
