import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/theme_controller.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  double _textSize = 1.0;

  late ThemeControllers themeController;

  @override
  void initState() {
    super.initState();
    themeController = Get.find<ThemeControllers>();
  }

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
          AppBarWidget(title: "Settings"),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildSectionTitle("Account"),
                _buildSettingItem(
                  icon: Icons.person,
                  title: "Profile Information",
                  subtitle: "Change your personal information",
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.lock,
                  title: "Password",
                  subtitle: "Change your password",
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.email,
                  title: "Email",
                  subtitle: "Change your email address",
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSectionTitle("Preferences"),
                _buildSwitchItem(
                  icon: Icons.notifications,
                  title: "Notifications",
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                GetBuilder<ThemeControllers>(
                  builder: (controller) {
                    return _buildSwitchItem(
                      icon: Icons.dark_mode,
                      title: "Dark Mode",
                      value: controller.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        if (value) {
                          controller.setDarkTheme();
                        } else {
                          controller.setLightTheme();
                        }
                      },
                    );
                  },
                ),
                _buildSwitchItem(
                  icon: Icons.location_on,
                  title: "Location Services",
                  value: _locationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _locationEnabled = value;
                    });
                  },
                ),
                _buildSliderItem(
                  icon: Icons.text_fields,
                  title: "Text Size",
                  value: _textSize,
                  min: 0.8,
                  max: 1.2,
                  onChanged: (value) {
                    setState(() {
                      _textSize = value;
                    });
                  },
                ),
                _buildDivider(),
                _buildSectionTitle("Support"),
                _buildSettingItem(
                  icon: Icons.help,
                  title: "Help Center",
                  subtitle: "Get help with the app",
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.feedback,
                  title: "Feedback",
                  subtitle: "Send feedback to improve the app",
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.privacy_tip,
                  title: "Privacy Policy",
                  subtitle: "Read our privacy policy",
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.description,
                  title: "Terms of Service",
                  subtitle: "Read our terms of service",
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSettingItem(
                  icon: Icons.logout,
                  title: "Logout",
                  subtitle: "Sign out of your account",
                  onTap: () {},
                  isDestructive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withValues(alpha: 0.1)
              : Colors.pink.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : Colors.pink),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDestructive ? Colors.red : null,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.pink.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.pink),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.pink,
      ),
    );
  }

  Widget _buildSliderItem({
    required IconData icon,
    required String title,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.pink.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.pink),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Slider(
        value: value,
        min: min,
        max: max,
        divisions: 4,
        activeColor: Colors.pink,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 32, thickness: 1);
  }
}
