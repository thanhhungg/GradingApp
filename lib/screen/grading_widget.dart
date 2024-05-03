import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:grading_client/model/asignment.dart';
import 'package:grading_client/service/api_service.dart';
import 'package:grading_client/service/handle_exception.dart';

class GradingWidget extends StatefulWidget {
  const GradingWidget({Key? key, this.title, this.controller, this.asignment}) : super(key: key);
  final String? title;
  final TextEditingController? controller;
  final Asignment? asignment;
  @override
  State<GradingWidget> createState() => _GradingWidgetState();
}

class _GradingWidgetState extends State<GradingWidget> {
  final textController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text(widget.asignment?.title ?? "default.pdf"),
          SizedBox(height: 30,),
          MaterialButton(
            onPressed: () {
            },
            child: const Text(
              "See Detail",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          TextField(
            controller: textController,
            keyboardType: TextInputType.number,
          ),
          MaterialButton(
            onPressed: () async {
              try{
                await ApiService().post("/asignment/mark/${widget.asignment?.id}",data: FormData.fromMap({"score":double.parse(textController.text)}));
              }catch (e){
                handleException(e);
              }
            },
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),

        ],
      ),
    );
  }
}
