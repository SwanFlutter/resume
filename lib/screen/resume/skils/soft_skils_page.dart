import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume/widgets/custom/custom_progress_indicator.dart';

class SoftSkillsPage extends StatelessWidget {
  SoftSkillsPage({super.key});

  final List<Map<String, dynamic>> skills = [
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD6EAF8), Color(0xFFFDEDEC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    children: [
                      const TextSpan(
                        text: 'HR ',
                        style: TextStyle(color: Color(0xFF1A6CA3)),
                      ),
                      TextSpan(
                        text: 'Li',
                        style: TextStyle(color: Colors.pink[400]),
                      ),
                      const TextSpan(
                        text: 'NK',
                        style: TextStyle(color: Color(0xFF1A6CA3)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const BackButton(),
                  const Icon(Icons.star_outline, color: Colors.black54),
                  const SizedBox(width: 8),
                  Text(
                    'Soft Skills',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black54),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return _buildSkillCard(skill);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1A237E),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
                      const Icon(Icons.assessment_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        skill['name'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
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
                  size: 50,
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
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.10),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.dashboard, 'Dashboard', false),
          _buildNavItem(Icons.assignment_ind, 'Resume', true),
          _buildNavItem(Icons.work_outline, 'Jobs', false),
          _buildNavItem(Icons.more_horiz, '', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool selected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: selected ? Colors.pinkAccent : Colors.grey, size: 28),
        if (label.isNotEmpty)
          Text(
            label,
            style: GoogleFonts.poppins(
              color: selected ? Colors.pinkAccent : Colors.grey,
              fontSize: 13,
            ),
          ),
      ],
    );
  }
}

// کلاس‌های CustomProgressIndicator حذف شدند چون از فایل جداگانه استفاده می‌کنیم
