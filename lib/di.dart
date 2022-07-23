import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ment_track/controllers/surveycontroller.dart';

void configure() {
  Get.put<SurveyController>(SurveyController());
}