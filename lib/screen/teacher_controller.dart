import 'dart:convert';

import 'package:get/get.dart';
import 'package:grading_client/model/asignment.dart';
import 'package:grading_client/service/handle_exception.dart';

import '../service/api_service.dart';

class TeacherController extends GetxController {
  Rx<List<Asignment>> asigns = Rx<List<Asignment>>([]);

  @override
  void onReady() {
    super.onReady();
    getAll();
  }

  void getAll() async {
    try {
      final response = await ApiService().get("/asignment/all/pending");
      final jsonResult = jsonDecode(jsonEncode(response.data)) as List<dynamic>;
      asigns.value = jsonResult
          .map((e) => Asignment.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      handleException(e);
    }
  }
}
