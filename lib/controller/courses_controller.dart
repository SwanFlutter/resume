import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';
import 'package:resume/controller/login_controller.dart';
import 'package:resume/model/coures_model.dart';

class CoursesController extends GetXController {
  static CoursesController get to => Get.find<CoursesController>();

  late TextEditingController typeController;
  late TextEditingController stateController;
  late TextEditingController durationController;
  late TextEditingController courseLevelFieldController;
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

  @override
  void onInit() {
    super.onInit();
    typeController = TextEditingController(text: 'Course');
    stateController = TextEditingController(text: 'Ux Research');
    durationController = TextEditingController(text: '3 months');
    courseLevelFieldController = TextEditingController(text: 'Hard');
    nameIntlController = TextEditingController(text: 'International Course');
    dateController = TextEditingController(
      text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
    );
    contentController = TextEditingController(text: 'Course Content');
    descriptionController = TextEditingController(text: 'Course Description');
    dateTime = TextEditingController(
      text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
    );

    typeCourse = "Course";
    title = "Ux Research";
    courseLevel = "Hard";
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
    update();
  }

  String? getDropdownValue(String dropdownId) {
    return dropdownValues[dropdownId];
  }

  void addPost() {
    print(typeController.text);
    print(stateController.text);
    print(durationController.text);
    print(courseLevelFieldController.text);
    print(nameIntlController.text);
    print(dateController.text);
    print(contentController.text);
    print(descriptionController.text);
    if (typeController.text.isEmpty ||
        stateController.text.isEmpty ||
        durationController.text.isEmpty ||
        courseLevelFieldController.text.isEmpty ||
        nameIntlController.text.isEmpty ||
        dateController.text.isEmpty ||
        contentController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
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
      state: stateController.text,
      duration: durationController.text,
      courseLevelField: courseLevelFieldController.text,
      nameIntl: nameIntlController.text,
      date: dateController.text,
      content: contentController.text,
      description: descriptionController.text,
      dateTime: DateTime.parse(dateTime.text),
      checkBox1: checkBox1,
      byDegree: byDegree,
      byCartificate: byCartificate,
    );

    print(body);

    final response = await connect.post(
      'https://hrlink.hrbox.me:50443/DesktopModules/Freelancer/api/Course/Add',
      body.toJson(),
      headers: {
        'Content-Type': 'application/json',
        "set-cookie": LoginController.to.setCookie,
      },
    );

    if (response.isOk) {
      Get.snackbar("Success", "Course added successfully");
      clearFields();
    } else {
      Get.snackbar("Error", "Failed to add course: ${response.statusText}");
    }
  }

  void clearFields() {
    typeController.clear();
    stateController.clear();
    durationController.clear();
    courseLevelFieldController.clear();
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
