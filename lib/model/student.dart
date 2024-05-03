class Student {
  int? id;
  String? name;
  String? studentId;
  double? chuyenCan;
  double? baiTap;
  double? thucHanh;
  double? cuoiKy;

  Student(
      {this.id,
        this.name,
        this.studentId,
        this.chuyenCan,
        this.baiTap,
        this.thucHanh,
        this.cuoiKy});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    studentId = json['studentId'];
    chuyenCan = json['chuyenCan'];
    baiTap = json['baiTap'];
    thucHanh = json['thucHanh'];
    cuoiKy = json['cuoiKy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['studentId'] = this.studentId;
    data['chuyenCan'] = this.chuyenCan;
    data['baiTap'] = this.baiTap;
    data['thucHanh'] = this.thucHanh;
    data['cuoiKy'] = this.cuoiKy;
    return data;
  }
}