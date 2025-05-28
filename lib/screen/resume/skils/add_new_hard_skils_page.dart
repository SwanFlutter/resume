import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewHardSkillsPage extends StatelessWidget {
  AddNewHardSkillsPage({super.key});

  final List<List<String>> skills = [
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
  ];

  final List<String> industrial = ['Software', 'Technology', 'Office'];
  final List<String> field = ['Technology', 'Software', 'Office'];

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
                  const Icon(Icons.star_outline, color: Colors.black54),
                  const SizedBox(width: 8),
                  Text(
                    'Add New Soft Skills',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skills
            _buildTagSection(title: 'Skills *', tagsList: skills),
            const SizedBox(height: 12),
            // Industrial
            _buildTagSection(title: 'Industrial *', tags: industrial),
            const SizedBox(height: 12),
            // Field
            _buildTagSection(title: 'Field *', tags: field),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {},
        child: const Icon(Icons.check, size: 36, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTagSection({
    required String title,
    List<List<String>>? tagsList,
    List<String>? tags,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          if (tagsList != null)
            Column(
              children: tagsList
                  .map(
                    (row) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: row.map((tag) => _buildTag(tag)).toList(),
                      ),
                    ),
                  )
                  .toList(),
            ),
          if (tags != null)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: tags.map((tag) => _buildTag(tag)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Chip(
      label: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: const Color(0xFF6C7A89),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            color: Colors.grey.withOpacity(0.10),
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
