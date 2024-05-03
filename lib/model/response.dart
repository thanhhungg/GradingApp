class ResponseApi {
  String? status;
  ResponseApi({this.status});
  ResponseApi.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }
}