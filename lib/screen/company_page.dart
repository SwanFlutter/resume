import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

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
          AppbarWidget(title: "Companies"),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _companies.length,
              itemBuilder: (context, index) {
                final company = _companies[index];
                return _buildCompanyCard(company);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCard(Company company) {
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
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(company.icon, size: 30, color: Colors.pink),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        company.industry,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            company.location,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "About",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              company.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildCompanyDetail(
                  Icons.people,
                  "${company.employees} employees",
                ),
                SizedBox(width: 16),
                _buildCompanyDetail(
                  Icons.calendar_today,
                  "Founded ${company.founded}",
                ),
              ],
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
                  child: Text("View Jobs"),
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
                  child: Text("Follow"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}

class Company {
  final String name;
  final String industry;
  final String location;
  final String description;
  final String employees;
  final String founded;
  final IconData icon;

  Company({
    required this.name,
    required this.industry,
    required this.location,
    required this.description,
    required this.employees,
    required this.founded,
    required this.icon,
  });
}

final List<Company> _companies = [
  Company(
    name: "Google",
    industry: "Technology",
    location: "Mountain View, CA",
    description:
        "Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware.",
    employees: "150,000+",
    founded: "1998",
    icon: Icons.android,
  ),
  Company(
    name: "Apple",
    industry: "Technology",
    location: "Cupertino, CA",
    description:
        "Apple Inc. is an American multinational technology company that designs, develops, and sells consumer electronics, computer software, and online services.",
    employees: "147,000+",
    founded: "1976",
    icon: Icons.apple,
  ),
  Company(
    name: "Microsoft",
    industry: "Technology",
    location: "Redmond, WA",
    description:
        "Microsoft Corporation is an American multinational technology company that develops, manufactures, licenses, supports, and sells computer software, consumer electronics, personal computers, and related services.",
    employees: "181,000+",
    founded: "1975",
    icon: Icons.window,
  ),
  Company(
    name: "Amazon",
    industry: "E-commerce, Cloud Computing",
    location: "Seattle, WA",
    description:
        "Amazon.com, Inc. is an American multinational technology company which focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence.",
    employees: "1,300,000+",
    founded: "1994",
    icon: Icons.shopping_cart,
  ),
];
