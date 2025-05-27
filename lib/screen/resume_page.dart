import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/views/home/grid_card_widget.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoWidget(),
          AppbarWidget(title: "Resume Page", backBottom: false),
          GridCardWidget(),
        ],
      ),
    );
  }
}


/*class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidget(),
            AppbarWidget(title: "Resume"),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(
                      title: "Personal Information",
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow("Name", "John Doe"),
                          _buildInfoRow("Email", "john.doe@example.com"),
                          _buildInfoRow("Phone", "+1 234 567 890"),
                          _buildInfoRow("Location", "New York, USA"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: "Education",
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildEducation(
                            degree: "Master of Computer Science",
                            school: "Stanford University",
                            years: "2018 - 2020",
                          ),
                          SizedBox(height: 10),
                          _buildEducation(
                            degree: "Bachelor of Computer Science",
                            school: "MIT",
                            years: "2014 - 2018",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: "Work Experience",
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildExperience(
                            position: "Senior Software Engineer",
                            company: "Google",
                            years: "2020 - Present",
                            description:
                                "Developing and maintaining web applications using Flutter and Dart.",
                          ),
                          SizedBox(height: 10),
                          _buildExperience(
                            position: "Software Engineer",
                            company: "Facebook",
                            years: "2018 - 2020",
                            description:
                                "Worked on mobile applications using React Native.",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: "Skills",
                      content: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildSkill("Flutter"),
                          _buildSkill("Dart"),
                          _buildSkill("React"),
                          _buildSkill("JavaScript"),
                          _buildSkill("Python"),
                          _buildSkill("Java"),
                          _buildSkill("Git"),
                          _buildSkill("Firebase"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
        SizedBox(height: 10),
        content,
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildEducation({
    required String degree,
    required String school,
    required String years,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          degree,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          school,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          years,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildExperience({
    required String position,
    required String company,
    required String years,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          position,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          years,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSkill(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
*/