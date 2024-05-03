import 'package:flutter/material.dart';
import 'package:grading_client/screen/student_multiple_choice_screen.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget(
      {Key? key,
      this.contentA,
      this.contentB,
      this.contentC,
      this.contentD,
      this.question,
      this.valueCallBack})
      : super(key: key);
  final String? contentA;
  final String? contentB;
  final String? contentC;
  final String? contentD;
  final String? question;
  final Function? valueCallBack;
  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  Choice _value = Choice.A;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  widget.question ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ListTile(
            title: Text(widget.contentA ?? ""),
            leading: Radio(
              value: Choice.A,
              groupValue: _value,
              onChanged: (Choice? value) {
                setState(() {
                  _value = value ?? Choice.A;
                  callBack();
                });
              },
            ),
          ),
          ListTile(
            title: Text(widget.contentB ?? ""),
            leading: Radio(
              value: Choice.B,
              groupValue: _value,
              onChanged: (Choice? value) {
                setState(() {
                  _value = value ?? Choice.A;
                  callBack();
                });
              },
            ),
          ),
          ListTile(
            title: Text(widget.contentC ?? ""),
            leading: Radio(
              value: Choice.C,
              groupValue: _value,
              onChanged: (Choice? value) {
                setState(() {
                  _value = value ?? Choice.A;
                  callBack();
                });
              },
            ),
          ),
          ListTile(
            title: Text(widget.contentD ?? ""),
            leading: Radio(
              value: Choice.D,
              groupValue: _value,
              onChanged: (Choice? value) {
                setState(() {
                  _value = value ?? Choice.A;
                  callBack();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void callBack() {
    widget.valueCallBack?.call(_value);
  }
}
