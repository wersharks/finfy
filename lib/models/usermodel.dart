class User {
  String? studentId;
  String? name;
  String? rollno;
  String? teachercode;
  String? phoneNo;
  String? schoolname;
  int? fincoin;

  User(
      {this.studentId,
      this.name,
      this.rollno,
      this.teachercode,
      this.phoneNo,
      this.schoolname,
      this.fincoin});

  User.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    name = json['name'];
    rollno = json['rollno'];
    teachercode = json['teachercode'];
    phoneNo = json['phoneNo'];
    schoolname = json['schoolname'];
    fincoin = json['fincoin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['name'] = this.name;
    data['rollno'] = this.rollno;
    data['teachercode'] = this.teachercode;
    data['phoneNo'] = this.phoneNo;
    data['schoolname'] = this.schoolname;
    data['fincoin'] = this.fincoin;
    return data;
  }
}