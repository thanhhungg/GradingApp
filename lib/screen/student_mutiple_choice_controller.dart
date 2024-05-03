import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:grading_client/dialog/dialog_helper.dart';
import 'package:grading_client/screen/student_multiple_choice_screen.dart';
import 'package:grading_client/service/api_service.dart';
import 'package:grading_client/service/handle_exception.dart';

class StudentMultipleChoiceController extends GetxController {
  Choice choice1 = Choice.A;
  Choice choice2 = Choice.A;
  Choice choice3 = Choice.A;
  Choice choice4 = Choice.A;
  Choice choice5 = Choice.A;
  Choice choice6 = Choice.A;
  Choice choice7 = Choice.A;
  Choice choice8 = Choice.A;
  Choice choice9 = Choice.A;
  Choice choice10 = Choice.A;

  void submit() async {
    final mutipleData =
        "1-${choice1.name.toLowerCase()},"
        "2-${choice2.name.toLowerCase()},"
        "3-${choice3.name.toLowerCase()},"
        "4-${choice4.name.toLowerCase()},"
        "5-${choice5.name.toLowerCase()},"
        "6-${choice6.name.toLowerCase()},"
        "7-${choice7.name.toLowerCase()},"
        "8-${choice8.name.toLowerCase()},"
        "9-${choice9.name.toLowerCase()},"
        "10-${choice10.name.toLowerCase()}";
    try {
      final data = {
        "file": "",
        "type": "tn",
        "student_id": 1,
        "dataMultipleChoice" : mutipleData
      };
      DialogHelper.showLoading();
      await ApiService()
          .post("/asignment/upload/db", data: FormData.fromMap(data));
      DialogHelper.hideDialog();
    } catch (e) {
      DialogHelper.hideDialog();
      handleException(e);
    }
  }
}
