import 'package:grading_client/model/student.dart';

class Asignment {
  int? id;
  String? type;
  String? title;
  String? dataMultiChoice;
  String? submitDate;
  Student? student;

  Asignment(
      {this.id,
        this.type,
        this.title,
        this.dataMultiChoice,
        this.submitDate,
        this.student});

  Asignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    dataMultiChoice = json['dataMultiChoice'];
    submitDate = json['submitDate'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['dataMultiChoice'] = this.dataMultiChoice;
    data['submitDate'] = this.submitDate;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}