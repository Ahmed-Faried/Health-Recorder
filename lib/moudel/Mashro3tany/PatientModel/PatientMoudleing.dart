// // To parse this JSON data, do
// //
// //     final patientModel = patientModelFromJson(jsonString);
//
// import 'dart:convert';
// //
// // PatientModel patientModelFromJson(String str) => PatientModel.fromJson(json.decode(str));
// //
// // String patientModelToJson(PatientModel data) => json.encode(data.toJson());
//
// class PatientModel {
//    late String status;
//    late int results;
//    late Data? data;
//
//   PatientModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     results = json["results"] ;
//     data = json["data"] == null ? null : Data.fromJson(json["data"]);
//   }
// }
//
// class Data {
//   List<Pationt> pationts = [];
//
//   Data.fromJson(Map<String, dynamic> json) {
//
//   json['pationts'].forEach((element){
//
//   pationts.add(Pationt.fromJson(element));
//   })  ;
//
//
// }
//
// }
// class Pationt {
//   String? id;
//   int? age;
//   String? bloodType;
//   String? fristName;
//   String? lastName;
//   String? gender;
//   String? email;
//   String? phoneNumber;
//   String? password;
//
//
//   Pationt.fromJson(Map<String, dynamic> json) {
//     id = json["_id"];
//     age = json["age"];
//     bloodType = json["bloodType"];
//     fristName = json["fristName"];
//     lastName = json["lastName"];
//     gender = json["gender"];
//     email = json["email"];
//     phoneNumber = json["phoneNumber"];
//     password = json["password"];
//
//
//
//
//   }
// }
