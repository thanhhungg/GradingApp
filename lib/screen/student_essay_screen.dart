import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/screen/student_essay_controller.dart';

class StudentEssayScreen extends StatefulWidget {
  const StudentEssayScreen({Key? key}) : super(key: key);

  @override
  State<StudentEssayScreen> createState() => _StudentEssayScreenState();
}

class _StudentEssayScreenState extends State<StudentEssayScreen> {
  final controller = Get.put(StudentEssayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                controller.pickFile();
              },
              child: const Text(
                "Choose A File",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Image.asset("assets/image/IMG_9497.JPG"),
            MaterialButton(
              onPressed: () {
                controller.uploadFile();
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
