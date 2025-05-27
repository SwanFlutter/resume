import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/widgets/experience/card_experience_widget.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class JobExperience extends StatelessWidget {
  const JobExperience({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Column(
        children: [
          LogoWidget(isSearch: true),
          AppbarWidget(title: "Job Experience", icon: Icons.badge_outlined),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual item count
              itemBuilder: (context, index) {
                return CardExperienceWidget(
                  title: "Founder & Ceo",
                  subtitle: "2018_now",
                  isOnline: true,
                  typeState: "Full-Time",
                  country: "UAE - Dubai",
                  school: "Hooragency",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
