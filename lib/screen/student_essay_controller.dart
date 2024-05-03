import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart' hide FormData;
import 'package:grading_client/dialog/dialog_helper.dart';
import 'package:grading_client/service/api_service.dart';
import 'package:grading_client/service/handle_exception.dart';
import 'package:path_provider/path_provider.dart';

class StudentEssayController extends GetxController {
  File file = File("");
  void uploadFile() async {
    try {
      // FormData formData = new FormData({
      //   "file" : "",
      //   "type":"tl",
      //   "student_id":"1",
      // });

      final data = {
        "file": "",
        "type": "tl",
        "student_id": 1,
      };
      DialogHelper.showLoading();
      await ApiService()
          .post("/task/grading/upload", data: FormData.fromMap(data));
      DialogHelper.hideDialog();
    } catch (e) {
      DialogHelper.hideDialog();
      handleException(e);
    }
    // var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // var length = await imageFile.length();
    //
    // var uri = Uri.parse(uploadURL);
    //
    // var request = new http.MultipartRequest("POST", uri);
    // var multipartFile = new http.MultipartFile('file', stream, length,
    //     filename: basename(imageFile.path));
    // //contentType: new MediaType('image', 'png'));
    //
    // request.files.add(multipartFile);
    // var response = await request.send();
    // print(response.statusCode);
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print(value);
    // });
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path ?? "");
    } else {
      // User canceled the picker
    }
  }
}
