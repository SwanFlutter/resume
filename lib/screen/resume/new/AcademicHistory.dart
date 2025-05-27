import 'package:flutter/material.dart';

class AcademicHistory extends StatelessWidget {
  const AcademicHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic History'),
        leading: Icon(Icons.arrow_back),
        actions: [Icon(Icons.search)],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.pink.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Academic history items
          _buildAcademicItem(
            title: 'Software Developer',
            duration: '2018 - Now',
            degree: 'Bachelor',
            institution: 'TEHRAN UNIVERSITY',
            isCurrent: true,
          ),
          _buildAcademicItem(
            title: 'Product Design',
            duration: '2014 - 2018',
            degree: 'Diploma',
            institution: 'DR.HESABI SCHOOL',
          ),
          _buildAcademicItem(
            title: 'Product Design',
            duration: '2016 - 2020',
            degree: 'Master Of Science',
            institution: 'KINGS COLLEGE',
          ),
          _buildAcademicItem(
            title: 'Product Design',
            duration: '2014 - 2018',
            degree: 'Diploma',
            institution: 'DR.HESABI SCHOOL',
          ),
          _buildAcademicItem(
            title: 'Software Developer',
            duration: '2016',
            degree: 'PHD',
            institution: 'TEHRAN UNIVERSITY',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Resume'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.pink,
      ),
    );
  }

  // Method to build each academic item
  Widget _buildAcademicItem({
    required String title,
    required String duration,
    required String degree,
    required String institution,
    bool isCurrent = false,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (isCurrent)
                  Icon(Icons.circle, color: Colors.green, size: 12),
                SizedBox(width: 8.0),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text(duration),
              ],
            ),
            SizedBox(height: 8.0),
            Text(degree),
            Text(institution),
          ],
        ),
      ),
    );
  }
}
