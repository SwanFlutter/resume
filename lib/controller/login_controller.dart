import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:get_x_storage/get_x_storage.dart';
import 'package:resume/screen/main_navigation.dart';

class LoginController extends GetXController {
  static LoginController get to => Get.smartFind<LoginController>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;
  final errorMessage = ''.obs;
  String cookie = '';
  bool islogin = false;
  String setCookie = """	
.DOTNETNUKE=4C909CFBCE112BD5EB72E07FD92AEE3E6255BCE8B6E9C882A8928804F32B1D13FCF26A54F3CE62D6627AB9ACA6F3DA84DA3FDF518C05CB89C2C947FCFC540627F722B086E876C9DD0C00CF91; path=/; HttpOnly; SameSite=Lax
""";

  GetXStorage storage = GetXStorage();

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> saveCookie(String cookie) async {
    await storage.write(key: 'cookie', value: cookie);
    update();
  }

  Future<void> loadCookie() async {
    var result = await storage.read(key: 'cookie');
    cookie = result;
    islogin = true;
    update();
  }

  Future<void> logout() async {
    await storage.remove(key: 'cookie');
    update();
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'نام کاربری و رمز عبور را وارد کنید';
      return;
    }
    if (username == '4311690622' && password == 'Nim@4311') {
      await saveCookie(setCookie);
      Get.off('/home');
      Get.snackbar(
        'ورود با موفقیت انجام شد',
        "",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'خطا',
        'خطای ناشناخته',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkAndNavigate();
  }

  Future<void> checkAndNavigate() async {
    var result = await storage.read(key: 'cookie');
    if (result != null && result.toString().isNotEmpty) {
      // Cookie exists, navigate to home
      Get.off(() => MainNavigation());
    }
    // Otherwise, stay on login page
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}





/**Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'نام کاربری و رمز عبور را وارد کنید';
      return;
    }
    GetConnect http = GetConnect();

    var response = await http.post(
      'https://hrlink.hrbox.me:50443/DesktopModules/SSO/api/Login/Login',
      {'UserName': username, 'Password': password},
    );

    var jsonDate = jsonDecode(response.bodyString ?? '{}');

    var message = jsonDate['message'];

    if (response.statusCode == 200 && message != null) {
      String? setCookie = response.headers?['set-cookie'];
      if (setCookie != null && setCookie.isNotEmpty) {
        String cookieValue = setCookie.split(';').first;
        await saveCookie(cookieValue);
        Get.offAllNamed('/home');
        Get.snackbar(
          'ورود با موفقیت انجام شد',
          message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'خطا',
        message ?? 'خطای ناشناخته',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  } */