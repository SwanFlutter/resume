import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HardSkillsScreen extends StatefulWidget {
  const HardSkillsScreen({super.key});

  @override
  State<HardSkillsScreen> createState() => _HardSkillsScreenState();
}

class _HardSkillsScreenState extends State<HardSkillsScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'HR ',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: 'L',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: 'I',
                style: TextStyle(color: Color(0xFFE91E63)),
              ), // Pink for 'I'
              TextSpan(
                text: 'NK',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        // Handle back action
                      },
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.lightbulb_outline, color: Colors.black87),
                    const SizedBox(width: 8),
                    const Text(
                      'Hard Skills',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                    size: 28,
                  ),
                  onPressed: () {
                    // Handle search action
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                SkillCard(
                  iconData: Icons.brush, // Placeholder for Photoshop
                  iconColor: Color(0xFF0078D4), // Adobe Blue
                  skillName: 'Adobe Photoshop',
                  level: 'B',
                  grad: '30%',
                  date: '2023',
                  progress: 0.40,
                  progressColor: Colors.orangeAccent,
                ),
                SkillCard(
                  iconData: Icons.apps, // Placeholder for Google Workspace
                  iconColor: Color(0xFF34A853), // Google Green
                  skillName: 'Google Workspace',
                  level: 'B',
                  grad: '30%',
                  date: '2023',
                  progress: 0.80,
                  progressColor: Colors.green,
                ),
                SkillCard(
                  iconData: Icons.design_services, // Placeholder for Figma
                  iconColor: Color(0xFFF24E1E), // Figma Red
                  skillName: 'Figma',
                  level: 'B',
                  grad: '30%',
                  date: '2023',
                  progress: 0.10,
                  progressColor: Colors.red,
                ),
                SkillCard(
                  iconData: Icons.apps, // Placeholder for Google Workspace
                  iconColor: Color(0xFF34A853), // Google Green
                  skillName: 'Google Workspace',
                  level: 'B',
                  grad: '30%',
                  date: '2023',
                  progress: 0.80,
                  progressColor: Colors.green,
                ),
                SizedBox(height: 80), // Space for FAB
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB press
        },
        backgroundColor: const Color(0xFF1A237E),
        elevation: 4.0, // Dark blue
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Adjusted to avoid overlap issues
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  color: _selectedIndex == 0
                      ? const Color(0xFFE91E63)
                      : Colors.grey,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: _selectedIndex == 1
                      ? const Color(0xFFE91E63)
                      : Colors.grey,
                ),
                label: 'Resume',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.work_outline,
                  color: _selectedIndex == 2
                      ? const Color(0xFFE91E63)
                      : Colors.grey,
                ),
                label: 'Jobs',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  color: _selectedIndex == 3
                      ? const Color(0xFFE91E63)
                      : Colors.grey,
                ),
                label: 'More',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFFE91E63), // Pink
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, // Handled by container
            elevation: 0,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String skillName;
  final String level;
  final String grad;
  final String date;
  final double progress;
  final Color progressColor;

  const SkillCard({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.skillName,
    required this.level,
    required this.grad,
    required this.date,
    required this.progress,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(iconData, size: 36, color: iconColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Level: $level',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      Text(
                        'Grad: $grad',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      Text(
                        'Date: $date',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 6.0,
              animation: true,
              percent: progress,
              center: Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: progressColor,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: progressColor,
              backgroundColor: progressColor.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
