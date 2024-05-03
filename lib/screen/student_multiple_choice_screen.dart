import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/screen/radio_widget.dart';
import 'package:grading_client/screen/student_mutiple_choice_controller.dart';

final listQuestion = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

enum Choice { A, B, C, D }

class StudentMultipleChoiceScreen extends StatefulWidget {
  const StudentMultipleChoiceScreen({Key? key}) : super(key: key);

  @override
  State<StudentMultipleChoiceScreen> createState() =>
      _StudentMultipleChoiceScreenState();
}

class _StudentMultipleChoiceScreenState
    extends State<StudentMultipleChoiceScreen> {
  final controller = Get.put(StudentMultipleChoiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Exam"),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              RadioWidget(
                question: "Câu 1: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice1 = value;
                },
              ),
              RadioWidget(
                question: "Câu 2: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice2 = value;
                },
              ),
              RadioWidget(
                question: "Câu 3: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice3 = value;
                },
              ),
              RadioWidget(
                question: "Câu 4: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice4 = value;
                },
              ),
              RadioWidget(
                question: "Câu 5: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice5 = value;
                },
              ),
              RadioWidget(
                question: "Câu 6: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice6 = value;
                },
              ),
              RadioWidget(
                question: "Câu 7: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice7 = value;
                },
              ),
              RadioWidget(
                question: "Câu 8: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice8 = value;
                },
              ),
              RadioWidget(
                question: "Câu 9: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice9 = value;
                },
              ),
              RadioWidget(
                question: "Câu 10: 1+1 = ?",
                contentA: "A. 2",
                contentB: "B. 3",
                contentC: "C. 4",
                contentD: "D. 5",
                valueCallBack: (Choice value) {
                  controller.choice10 = value;
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: MaterialButton(
                  onPressed: () {
                    controller.submit();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
