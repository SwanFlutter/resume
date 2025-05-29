import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/widgets/custom/custom_progress_indicator.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class SoftSkillsPage extends StatelessWidget {
  SoftSkillsPage({super.key});

  final List<Map<String, dynamic>> skills = [
    {
      'name': 'Mind Mapping',
      'level': 'B',
      'grad': '30%',
      'date': '2023',
      'progress': 80,
      'color': Color.fromRGBO(34, 173, 92, 10),
    },
    {
      'name': 'Focus',
      'level': 'C',
      'grad': '30%',
      'date': '2023',
      'progress': 20,
      'color': Colors.red,
    },
    {
      'name': 'Mind Mapping',
      'level': 'B',
      'grad': '30%',
      'date': '2023',
      'progress': 80,
      'color': Colors.green,
    },
    {
      'name': 'Focus',
      'level': 'C',
      'grad': '30%',
      'date': '2023',
      'progress': 20,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F9),

      body: Column(
        children: [
          LogoWidget(),
          AppBarWidget(
            title: "Soft Skils",
            imageIcon: 'assets/star.png',
            isSearch: true,
          ),
          SizedBox(height: 21),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final skill = skills[index];
              return Container(
                height: 80,

                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(8, 14, 28, 0.3),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.assessment_outlined,
                                  size: 14,
                                  color: AppThemeColors.titleFieldTextcolor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  skill['name'],
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppThemeColors.titleFieldTextcolor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                _buildInfoItem('Level:', skill['level']),
                                const SizedBox(width: 16),
                                _buildInfoItem('Grad:', skill['grad']),
                                const SizedBox(width: 16),
                                _buildInfoItem('Date:', skill['date']),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        alignment: Alignment
                            .center, // این اطمینان می‌دهد که هر دو ویجت در مرکز قرار گیرند
                        children: [
                          // پراگرس دایره‌ای با گرادیانت
                          CustomProgressIndicator(
                            progress: skill['progress'],
                            gradientColors: [
                              skill['color'],
                              skill['color'].withValues(alpha: 0.7),
                              skill['color'].withValues(alpha: 0.5),
                            ],
                            size: 56,
                            showDoubleProgress: true,
                            secondaryProgress: skill['progress'],
                            strokeWidth: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).marginOnly(top: 8.0);
            },
          ).expand(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1A237E),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill, BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.assessment_outlined,
                        size: 14,
                        color: AppThemeColors.titleFieldTextcolor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        skill['name'],
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppThemeColors.titleFieldTextcolor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _buildInfoItem('Level:', skill['level']),
                      const SizedBox(width: 16),
                      _buildInfoItem('Grad:', skill['grad']),
                      const SizedBox(width: 16),
                      _buildInfoItem('Date:', skill['date']),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Stack(
              alignment: Alignment
                  .center, // این اطمینان می‌دهد که هر دو ویجت در مرکز قرار گیرند
              children: [
                // پراگرس دایره‌ای با گرادیانت
                CustomProgressIndicator(
                  progress: skill['progress'],
                  gradientColors: [
                    skill['color'],
                    skill['color'].withValues(alpha: 0.7),
                    skill['color'].withValues(alpha: 0.5),
                  ],
                  size: 56,
                  showDoubleProgress: true,
                  secondaryProgress: skill['progress'],
                  strokeWidth: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 10,
            color: Color.fromRGBO(136, 136, 136, 1),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppThemeColors.titleFieldTextcolor,
          ),
        ),
      ],
    );
  }
}

// کلاس‌های CustomProgressIndicator حذف شدند چون از فایل جداگانه استفاده می‌کنیم
