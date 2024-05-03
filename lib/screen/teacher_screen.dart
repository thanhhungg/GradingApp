import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/screen/grading_widget.dart';
import 'package:grading_client/screen/teacher_controller.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  final controller = Get.put(TeacherController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Container(
        width: double.infinity,
        child: Obx(
          ()=> ListView(
            children: [
              ...controller.asigns.value.map((e) => GradingWidget(title: e.title,asignment: e,))
            ],
          ),
        ),
      ),
    );
  }
}
