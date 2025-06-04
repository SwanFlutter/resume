import 'package:flutter/material.dart';

class HardSkillsScreen extends StatefulWidget {
  const HardSkillsScreen({super.key});

  @override
  State<HardSkillsScreen> createState() => _HardSkillsScreenState();
}

class _HardSkillsScreenState extends State<HardSkillsScreen> {
  int _selectedIndex = 1; // Default to Resume

  final List<String> _skills = [
    "Languages",
    "Office",
    "Natural resource jobs",
    "Office",
    "Languages",
    "Office",
    "Natural resource jobs",
    "Office",
    "Languages",
    "Office",
    "Natural resource jobs",
    "Office",
  ];
  final List<String> _industrialSkills = ["Software", "Technology", "Office"];
  final List<String> _fieldSkills = ["Technology", "Software", "Office"];

  // Example selected skills for demonstration
  final Set<String> _selectedSkills = {"Languages", "Office"};
  final Set<String> _selectedIndustrial = {"Software"};
  final Set<String> _selectedField = {"Technology", "Office"};

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildSkillChip(String label, Set<String> selectedSet) {
    final bool isSelected = selectedSet.contains(label);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 13,
          ),
        ),
        backgroundColor: isSelected
            ? const Color(0xFFB0BEC5)
            : const Color(
                0xFFECEFF1,
              ), // Light grey for selected, very light for unselected
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    );
  }

  Widget _buildSkillSection(
    String title,
    List<String> skills,
    Set<String> selectedSet, {
    bool isDropdown = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (isDropdown)
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 12.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: skills
                .map((skill) => _buildSkillChip(skill, selectedSet))
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          120.0,
        ), // Combined height for both app bars
        child: Column(
          children: [
            // Custom Top Bar (HR LINK)
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade50,
                    Colors.pink.shade50.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'HR ',
                        style: TextStyle(color: Color(0xFF2A3A7D)),
                      ), // Dark Blue
                      TextSpan(
                        text: 'L',
                        style: TextStyle(color: Colors.pink.shade400),
                      ), // Pink for L
                      const TextSpan(
                        text: 'INK',
                        style: TextStyle(color: Color(0xFF2A3A7D)),
                      ), // Dark Blue
                    ],
                  ),
                ),
              ),
            ),
            // Secondary App Bar
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 20),
                onPressed: () {
                  // Handle back navigation
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.lightbulb_outline,
                    color: Colors.black54,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text('Add New Hard Skills'),
                ],
              ),
              centerTitle: true, // Centers the title row
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, size: 24),
                  onPressed: () {
                    // Handle search action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          bottom: 80,
        ), // Space for FAB and BottomNav
        children: [
          _buildSkillSection(
            "Skills",
            _skills,
            _selectedSkills,
            isDropdown: true,
          ),
          _buildSkillSection(
            "Industrial",
            _industrialSkills,
            _selectedIndustrial,
          ),
          _buildSkillSection("Field", _fieldSkills, _selectedField),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle save action
        },
        backgroundColor: Colors.pink.shade400,
        shape: const CircleBorder(),
        child: const Icon(Icons.check, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_outlined,
              color: _selectedIndex == 0
                  ? Colors.pink.shade400
                  : Colors.grey.shade600,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_ind_outlined,
              color: _selectedIndex == 1
                  ? Colors.pink.shade400
                  : Colors.grey.shade600,
            ),
            label: 'Resume',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_outline,
              color: _selectedIndex == 2
                  ? Colors.pink.shade400
                  : Colors.grey.shade600,
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: _selectedIndex == 3
                  ? Colors.pink.shade400
                  : Colors.grey.shade600,
            ),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink.shade400,
        unselectedItemColor: Colors.grey.shade600,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // To show all labels
        backgroundColor: Colors.white,
        elevation: 8.0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HR Link - Hard Skills')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Skills'),
            TagRow(tags: ['Languages', 'Office', 'Natural resource jobs']),

            SectionTitle(title: 'Industrial'),
            TagRow(tags: ['Software', 'Technology', 'Office']),

            SectionTitle(title: 'Field'),
            TagRow(tags: ['Technology', 'Software', 'Office']),

            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {},
                child: Icon(Icons.check),
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
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Resume'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TagRow extends StatelessWidget {
  final List<String> tags;
  const TagRow({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: tags.map((tag) => Chip(label: Text(tag))).toList(),
    );
  }
}
