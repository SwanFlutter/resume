// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class ResumehInfo extends StatefulWidget {
  const ResumehInfo({super.key});
  @override
  State<ResumehInfo> createState() => _ResumehInfoState();
}

class _ResumehInfoState extends State<ResumehInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Stack(
        children: [
          // محتوای اصلی صفحه
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Resume Info",
                  onPressed: () {
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 12) {
                      navigationController
                          .navToResume(); // برگشت به Resume Page
                    } else {
                      // در غیر این صورت از Get.back استفاده کن
                      Get.back();
                    }
                  },
                ),
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
                MeiddelBoxInfo(
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
                ).paddingSymmetric(horizontal: 16.0),
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
                        style: TextStyleHelper.body14W500MediumOpenSans,
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
                SizedBox(height: 20.0), // فضای اضافی در انتها
              ],
            ),
          ),
          // FloatingActionButton شناور در گوشه با تنظیم هوشمند موقعیت
          AnimatedPositioned(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            bottom: 25, // فاصله ثابت از پایین (بالای bottom navigation)
            right: 16, // فاصله از راست
            child: FloatingActionButton(
              onPressed: () {
                final navigationController = NavigationController.to;
                navigationController.navToResumeEdite();
              },
              backgroundColor: AppThemeColors.addFabColor,
              shape: CircleBorder(),
              child: Image.asset("assets/edite.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class MeiddelBoxInfo extends StatelessWidget {
  final String title;
  final List<CardInfoView> cardInfoViews;
  final String description;

  const MeiddelBoxInfo({
    super.key,
    required this.title,
    required this.cardInfoViews,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
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
            style: TextStyleHelper.title14W400RegularOpenSans,
          ).paddingOnly(top: 10),
          SizedBox(height: 5),
          Wrap(spacing: 5, runSpacing: 5, children: cardInfoViews),
          Text(
            "Descriptions",
            style: TextStyleHelper.body14W500MediumOpenSans,
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
              textAlign: TextAlign.justify,
              style: TextStyleHelper.body12W400RegularOpenSans.copyWith(
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
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

class ResumeInfoPage extends StatelessWidget {
  const ResumeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Info'),
        backgroundColor: Colors.blue[100],
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
              'https://via.placeholder.com/50', // Replace with your logo URL
              height: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ), // Replace with your image URL
                  ),
                  SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.female),
                              SizedBox(width: 8),
                              Text('Female'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 8),
                              Text('2000/19/10'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text('Single'),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Descriptions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'I dedicated and disciplined martial artist with 12 years of experience in Kung Fu, achieving a deep understanding of martial arts techniques and philosophies. As a top national and provincial referee, I ensure fair play and uphold the integrity of the sport during competitions. Additionally, I serve as a coach, where I guide and mentor athletes.',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 8),
                              Text('+4311469391'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text('Iranian'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description, color: Colors.red),
            label: 'Resume',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
        ],
      ),
    );
  }
}
