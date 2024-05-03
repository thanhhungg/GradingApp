import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/route/app_route.dart';

import 'student_controller.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final controller = Get.put(StudentController());
  final textController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your student ID ?"),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        controller.isStudentQualify(
                            int.parse(textController.text), 1);
                      } else {
                        Get.snackbar("Error", "Please input your student ID");
                      }
                    },
                    child: const Text(
                      "Join exam",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
