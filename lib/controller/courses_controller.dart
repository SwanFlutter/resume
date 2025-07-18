import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:resume/controller/login_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/model/coures_model.dart';

class CoursesController extends GetXController {
  static CoursesController get to => Get.find<CoursesController>();

  late TextEditingController typeController;
  late TextEditingController durationController;
  late TextEditingController nameIntlController;
  late TextEditingController dateController;
  late TextEditingController contentController;
  late TextEditingController descriptionController;

  late String typeCourse;
  late String title;
  late String courseLevel;

  bool checkBox1 = false;
  bool byDegree = false;
  bool byCartificate = false;

  Map<String, String?> dropdownValues = {};

  List<String> titleList = ["Ux Research", "Ux Design", "UI Design"];
  List<String> typeCourseList = ["Online Course", "Course", "Regular Course"];
  List<String> typeCourseLevel = ["Hard", "Medium", "Easy"];

  late TextEditingController dateTime;

  File? pickedFile;

  late String? courseLevelFieldController;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      pickedFile = File(picked.path);
      // If you need to call a callback or update UI, do it here
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    typeController = TextEditingController();
    durationController = TextEditingController();
    nameIntlController = TextEditingController();
    dateController = TextEditingController(
      text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
    );
    contentController = TextEditingController();
    descriptionController = TextEditingController();
    dateTime = TextEditingController(
      text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
    );

    typeCourse = "Course";
    title = "Ux Research";
    courseLevel = "Hard";
    courseLevelFieldController = '';
  }

  late Future<List<CouresModel>> future;

  // Add this import for jsonDecode

  Future<List<CouresModel>> fetchCourses() async {
    GetConnect connect = GetConnect(
      timeout: const Duration(seconds: 10),
      maxRedirects: 5,
      followRedirects: true,
    );
    final response = await connect.get(
      'http://192.168.1.106/resume/get_courses.php',
      headers: {
        'Content-Type': 'application/json',
        'Cookie': LoginController.to.setCookie,
      },
    );
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.isOk) {
      // Decode response.body if it's a String
      final Map<String, dynamic> responseData;
      if (response.body is String) {
        responseData = jsonDecode(response.body);
      } else {
        responseData = response.body as Map<String, dynamic>;
      }

      if (responseData['success'] == true && responseData['courses'] is List) {
        return (responseData['courses'] as List)
            .map((json) => CouresModel.fromMap(json))
            .toList();
      }
    }
    return [];
  }

  void setPickedFile(File? file) {
    pickedFile = file;
    update();
  }

  Future<DateTime> pickerTime(BuildContext context) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1985),
      lastDate: DateTime.now(),
    );

    if (picker != null) {
      String formattedDate = DateFormat("yyyy-MM-dd").format(picker);
      dateTime.text = formattedDate;
      update();
    }
    return picker ?? DateTime.now();
  }

  void updateTitle(String newTitle) {
    title = newTitle;
    update();
  }

  void updateDropdownValue(String dropdownId, String value) {
    dropdownValues[dropdownId] = value;
    if (dropdownId == "course_level") {
      courseLevel = value;
    } else if (dropdownId == "course_title") {
      title = value;
    }
    update();
  }

  String? getDropdownValue(String dropdownId) {
    return dropdownValues[dropdownId];
  }

  // اگر CustomDropdownWidget تغییر کند، این متد را اضافه کنید:
  // اگر CustomDropdownWidget تغییر کند، این متد را اضافه کنید:
  void updateCourseLevel(String newLevel) {
    courseLevel = newLevel;
    courseLevelFieldController = newLevel; // هم‌زمان به‌روزرسانی
    update();
  }

  void addPost() {
    print(typeController.text);
    print(durationController.text);
    print(courseLevel); // از courseLevel استفاده کنید
    print(nameIntlController.text);
    print(dateController.text);
    print(descriptionController.text);
    print("title $title");
    if (typeController.text.isEmpty ||
        durationController.text.isEmpty ||
        title.isEmpty || // بررسی title
        courseLevel.isEmpty || // تغییر داده شد
        nameIntlController.text.isEmpty ||
        dateController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      debugPrint("Please fill all fields");
    } else if (dateTime.text.isEmpty) {
      Get.snackbar("Error", "Please select a date");
    } else {
      Get.showOverlay(
        asyncFunction: () => addPostNew(),
        loadingWidget: const Center(child: CircularProgressIndicator()),
      );
    }
  }

  Future<void> addPostNew() async {
    GetConnect connect = GetConnect(
      timeout: const Duration(seconds: 10),
      maxRedirects: 5,
      followRedirects: true,
    );

    CouresModel body = CouresModel(
      type: typeController.text,
      state: title,
      duration: durationController.text,
      courseLevelField: courseLevel, // تغییر داده شد
      description: descriptionController.text,
      dateTime: DateTime.parse(dateTime.text),
      nameIntl: nameIntlController.text,
      content: contentController.text,
      date: dateController.text,
      checkBox1: checkBox1,
      byDegree: byDegree,
      byCartificate: byCartificate,
    );

    print(body);

    final response = await connect.post(
      'http://192.168.1.106/resume/create_course.php',
      body.toJson(),
      headers: {
        'Content-Type': 'application/json',
        "Cookie": LoginController.to.setCookie,
      },
    );

    if (response.isOk && response.body != null && response.statusCode == 200) {
      Get.snackbar("Success", "Course added successfully");
      future = fetchCourses();
      clearFields();
      NavigationController.to.navToCoursesPage();
    } else {
      Get.snackbar("Error", "Failed to add course: ${response.statusText}");
    }
  }

  void clearFields() {
    typeController.clear();
    durationController.clear();
    nameIntlController.clear();
    dateController.clear();
    contentController.clear();
    descriptionController.clear();
    dateTime.clear();

    typeCourse = "Course";
    title = "Ux Research";
    courseLevel = "Hard";

    checkBox1 = false;
    byDegree = false;
    byCartificate = false;

    dropdownValues.clear();
    update();
  }
}
