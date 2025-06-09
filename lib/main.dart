import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/bindings/bindings.dart';
import 'package:resume/controller/theme_controller.dart';
import 'package:resume/screen/main_navigation.dart';
import 'package:resume/themes/theme.dart';
import 'package:theme_master/theme_master.dart';

void main() {
  // Initialize bindings first
  WidgetsFlutterBinding.ensureInitialized();
  MyBindings().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeControllers>(
      builder: (themeController) {
        return ThemeMaster(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: MyBindings(),
            title: 'Rezomeh',
            theme: AppTheme.lightTheme.themeData,
            darkTheme: AppTheme.darkTheme.themeData,
            themeMode: themeController.themeMode,
            home: MainNavigation(),
          ),
        );
      },
    );
  }
}
