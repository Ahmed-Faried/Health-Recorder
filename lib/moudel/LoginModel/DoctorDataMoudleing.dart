

class DoctorDataModel {
  late String status;
  late String? masg;
  late Data? data;
  late String? token;

  DoctorDataModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    masg = json["Message"] == null ? null : json["Message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    token = json["token"] == null ? null : json["token"] ;
  }
}

class Data {
  late Doctor doctor;

  Data.fromJson(Map<String, dynamic> json) {
    doctor = Doctor.fromJson(json["doctor"]);
  }
}

class Doctor {
  List<dynamic>? pId = [];
  // List<dynamic> X_Ray = [];

  late String id;
  late String firstName;
  late String lastName;
  // late int? age;
  // late String? gender;
  late String department;
  late String email;
  late String address;
  late String password;
  late String phoneNumber;
  String? image ;


  Doctor.fromJson(Map<String, dynamic> json) {
    pId = List<dynamic>.from(json["pId"].map((x) => x));
    // X_Ray = List<dynamic>.from(json["x_ray"].map((x) => x));

    id = json["_id"];
    firstName = json["firstName"];
    lastName = json["lastName"];

    // age = json["age"];
    // gender = json["gender"];
    department = json["department"];
    email = json["email"];
    address = json["address"];
    password = json["password"];
    phoneNumber = json["phoneNumber"];
    image = json["image"];


  }
}
