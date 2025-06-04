import 'package:get_x_master/get_x_master.dart';

class AcademicController extends GetXController {
  static AcademicController get to => Get.smartFind<AcademicController>();

  final String title = "Choose";
  final String titleUniversity = "Choose";
  final List<String> universityList = [
    "Tehran University",
    "Sharif University",
    "Amirkabir University",
    "Isfahan University",
    "Tabriz University",
    "Shiraz University",
    "Mashhad University",
  ];
  final List<String> academicLevels = [
    "Bachelor",
    "Master",
    "PhD",
    "High School",
    "Diploma",
  ];
}
