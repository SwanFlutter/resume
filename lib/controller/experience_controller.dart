import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

class ExperienceController extends GetXController {
  static ExperienceController get to => Get.smartFind<ExperienceController>();

  // TextEditingControllers for experience fields
  late TextEditingController jobTitleController,
      companyController,
      startDateController,
      endDateController,
      descriptionController;

  late String typeStat = "Course";
  late String title = "Full-Time";
  List<String> jobTypeList = [
    "Full-Time",
    "Contract",
    "Apprenticeship",
    "Part-Time",
  ];
  List<String> chooseList = ["choose", "Course", "Job Experience"];
  late String chooseType = "choose";

  @override
  void onInit() {
    jobTitleController = TextEditingController();
    companyController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    jobTitleController.dispose();
    companyController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  // POST: Add new experience
  Future<void> addExperience() async {
    GetConnect connect = GetConnect();
    final body = {
      'job_title': jobTitleController.text,
      'company': companyController.text,
      'start_date': startDateController.text,
      'end_date': endDateController.text,
      'description': descriptionController.text,
      'type': typeStat,
      'job_type': title,
    };
    final response = await connect.post(
      'http://192.168.1.100:8000/api/experience',
      body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.isOk) {
      Get.snackbar("Success", "Experience added successfully");
      clearFields();
    } else {
      Get.snackbar(
        "Error",
        "Failed to add experience: \\${response.statusText}",
      );
    }
  }

  // GET: Fetch all experiences
  Future<List<dynamic>> fetchExperiences() async {
    GetConnect connect = GetConnect();
    final response = await connect.get(
      'http://192.168.1.100:8000/api/experience',
    );
    if (response.isOk && response.body is List) {
      return response.body;
    } else {
      Get.snackbar("Error", "Failed to fetch experiences");
      return [];
    }
  }

  void clearFields() {
    jobTitleController.clear();
    companyController.clear();
    startDateController.clear();
    endDateController.clear();
    descriptionController.clear();
    typeStat = "Course";
    title = "Full-Time";
    chooseType = "choose";
    update();
  }
}
