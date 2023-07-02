// // To parse this JSON data, do
// //
// //     final doctorModel = doctorModelFromJson(jsonString);
//
// import 'dart:convert';
//
// // DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));
// //
// // String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());
//
// class DoctorModel {
//
//
//   String? status;
//   int? results;
//   Data? data;
//
//   DoctorModel.fromJson(Map<String, dynamic> json)
//   {
//     status = json["status"];
//     results = json["results"];
//     data =  json["data"] == null ? null : Data.fromJson(json["data"]);
//   }
//
// }
//
// class Data {
//
//   List<Doctor>? doctors = [];
//
//    Data.fromJson(Map<String, dynamic> json) {
//      doctors = json["doctors"] == null ? [] : List<Doctor>.from(
//          json["doctors"]!.map((x) => Doctor.fromJson(x)));
//
//    }
//
// }
//
// class Doctor {
//
//
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? phoneNumber;
//   String? address;
//   String? password;
//   String? email;
//   String? department;
//   int? age;
//
//    Doctor.fromJson(Map<String, dynamic> json) {
//      id = json["_id"];
//      firstName = json["firstName"];
//      lastName = json["lastName"];
//      phoneNumber = json["phoneNumber"];
//      address = json["address"];
//      password = json["password"];
//      email = json["email"];
//      department = json["department"];
//      age = json["age"];
//
//
//    }
// }
