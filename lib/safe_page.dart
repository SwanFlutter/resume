import 'package:flutter/material.dart';
import 'package:resume/controller/login_controller.dart';
import 'package:resume/screen/login_page.dart';
import 'package:resume/screen/main_navigation.dart';

class CheckAuthPage extends StatefulWidget {
  const CheckAuthPage({super.key});

  @override
  _CheckAuthPageState createState() => _CheckAuthPageState();
}

class _CheckAuthPageState extends State<CheckAuthPage> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    print('Is user logged in? ${LoginController.to.islogin}');
  }

  void checkLoginStatus() {
    LoginController.to.loadCookie();
    LoginController.to.update();
  }

  @override
  Widget build(BuildContext context) {
    return LoginController.to.islogin ? MainNavigation() : LoginPage();
  }
}
