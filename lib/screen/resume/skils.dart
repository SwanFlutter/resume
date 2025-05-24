import 'package:flutter/material.dart';

class Skils extends StatelessWidget {
  const Skils({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = ExpansibleController();
    return Scaffold(
      appBar: AppBar(title: Text('Skils')),
      body: Column(
        children: [
          Center(child: Text('Skils')),
          Expansible(
            controller: controller,
            headerBuilder: (context, animation) =>
                ListTile(title: Text("..عنوان")),
            bodyBuilder: (context, animation) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Text(
                  "I am a dedicated and disciplined martial artist with 12 years of experience in Kung Fu, achieving a deep understanding of martial arts techniques and philosophies. As a top national and provincial referee, I ensure fair play and uphold the integrity of the sport during competitions. Additionally, I serve as a coach, where I guide and mentor athletes.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        onTap: (value) {
          // Handle navigation item tap
        },
        currentIndex: 1,
        backgroundColor: Colors.amber, // رنگ پس‌زمینه
        selectedItemColor: Colors.black, // رنگ آیکون و متن برای آیتم انتخاب شده
        unselectedItemColor:
            Colors.black, // رنگ آیکون و متن برای آیتم‌های انتخاب نشده
        selectedIconTheme: IconThemeData(
          size: 30,
        ), // اندازه آیکون برای آیتم انتخاب شده
        unselectedIconTheme: IconThemeData(
          size: 25,
        ), // اندازه آیکون برای آیتم‌های انتخاب نشده

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
