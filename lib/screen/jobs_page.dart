import 'package:flutter/material.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/background_colors.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColors(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoWidget(),
          AppbarWidget(title: "Jobs"),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _jobs.length,
              itemBuilder: (context, index) {
                final job = _jobs[index];
                return _buildJobCard(job);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(Job job) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Icon(job.icon, color: Colors.pink)),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        job.company,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildJobDetail(Icons.location_on, job.location),
                SizedBox(width: 16),
                _buildJobDetail(Icons.work, job.type),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildJobDetail(Icons.attach_money, job.salary),
                SizedBox(width: 16),
                _buildJobDetail(Icons.calendar_today, job.postedDate),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Job Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              job.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.pink,
                    side: BorderSide(color: Colors.pink),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Save"),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Apply"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}

class Job {
  final String title;
  final String company;
  final String location;
  final String type;
  final String salary;
  final String postedDate;
  final String description;
  final IconData icon;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.salary,
    required this.postedDate,
    required this.description,
    required this.icon,
  });
}

final List<Job> _jobs = [
  Job(
    title: "Flutter Developer",
    company: "Google",
    location: "Mountain View, CA",
    type: "Full-time",
    salary: "\$120,000 - \$150,000",
    postedDate: "2 days ago",
    description:
        "We are looking for a Flutter developer to join our team. You will be responsible for developing and maintaining mobile applications using Flutter.",
    icon: Icons.flutter_dash,
  ),
  Job(
    title: "React Native Developer",
    company: "Facebook",
    location: "Menlo Park, CA",
    type: "Full-time",
    salary: "\$110,000 - \$140,000",
    postedDate: "1 week ago",
    description:
        "Join our team to build cross-platform mobile applications using React Native. Experience with JavaScript and React is required.",
    icon: Icons.code,
  ),
  Job(
    title: "iOS Developer",
    company: "Apple",
    location: "Cupertino, CA",
    type: "Full-time",
    salary: "\$130,000 - \$160,000",
    postedDate: "3 days ago",
    description:
        "We are seeking an experienced iOS developer to join our team. You will be responsible for developing and maintaining iOS applications.",
    icon: Icons.apple,
  ),
  Job(
    title: "Android Developer",
    company: "Samsung",
    location: "San Jose, CA",
    type: "Contract",
    salary: "\$100,000 - \$130,000",
    postedDate: "5 days ago",
    description:
        "Looking for an Android developer to work on our mobile applications. Experience with Kotlin and Java is required.",
    icon: Icons.android,
  ),
];
