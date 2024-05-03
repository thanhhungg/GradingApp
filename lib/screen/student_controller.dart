import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/dialog/dialog_helper.dart';
import 'package:grading_client/route/app_route.dart';
import 'package:grading_client/service/api_service.dart';
import 'package:grading_client/service/handle_exception.dart';

class StudentController extends GetxController{
  void isStudentQualify(int id,int routeId) async{
    try{
      DialogHelper.showLoading();
      // await ApiService().post("/student/studentQualify/$id");
      await Future.delayed(Duration(seconds: 2));
      DialogHelper.hideDialog();

      routeId == 0?Get.toNamed(RouteName.studentEssay) : Get.toNamed(RouteName.studentMultipleChoice);


    }catch (e){
      DialogHelper.hideDialog();
      handleException(e);
    }
  }
}