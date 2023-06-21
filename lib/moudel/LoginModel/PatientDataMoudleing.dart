// To parse this JSON data, do
//
//     final patientDataModel = patientDataModelFromJson(jsonString);

import 'dart:convert';

import 'PatientDataMoudleing.dart';



class PatientDataModel {
  String? status;
  String? token;
  Data? data;



   PatientDataModel.fromJson(Map<String, dynamic> json){
     status= json["status"];
     token = json["token"];
     data = json["data"] == null ? null : Data.fromJson(json["data"]);
   }


}

class Data {
  Pationt? pationt;



   Data.fromJson(Map<String, dynamic> json) {
     pationt = json["pationt"] == null ? null : Pationt.fromJson(json["pationt"]);
   }


}

class Pationt {
  int? age;
  String? id;
  String? fristName;
  String? lastName;
  String? bloodType;
  String? gender;
  String? email;
  String? password;
  String? phoneNumber;
  String? nationalId;
  String? image ;
  List<HealthProblem>? chronicDiseases;
  List<HealthProblem>? healthProblems;
  List<HealthProblem>? hereditaryDiseases;
  List<SurgicalOperation>? surgicalOperations;
  List<Diagonas>? diagonas;
  List<dynamic>? x_ray = [];



  Pationt.fromJson(Map<String, dynamic> json){
     id=json["_id"];
     fristName= json["fristName"];
     lastName= json["lastName"];
     age= json["age"];
     image = json["image"];
     bloodType= json["bloodType"];
     gender= json["gender"];
     email= json["email"];
     password= json["password"];
     phoneNumber= json["phoneNumber"];
     nationalId = json["National_ID"];
     chronicDiseases = json["chronic_Diseases"] == null ? []       : List<HealthProblem>.from(json["chronic_Diseases"]!.map((x) => HealthProblem.fromJson(x)));
     healthProblems  = json["Health_problems"] == null ? []         : List<HealthProblem>.from(json["Health_problems"]!.map((x) => HealthProblem.fromJson(x)));
     hereditaryDiseases = json["Hereditary_diseases"] == null ? [] : List<HealthProblem>.from(json["Hereditary_diseases"]!.map((x) => HealthProblem.fromJson(x)));
     surgicalOperations = json["Surgical_operations"] == null ? [] : List<SurgicalOperation>.from(json["Surgical_operations"]!.map((x) => SurgicalOperation.fromJson(x)));
     diagonas     = json["diagonas"]    == null ? []              : List<Diagonas>.from(json["diagonas"]!.map((x)=>Diagonas.fromJson(x)));
     x_ray        = json["x_ray"]    == null ? []                 :     List<dynamic>.from(json["x_ray"]!.map((x) => x));



   }

}

class HealthProblem {
  String? id;
  String? name;
  String? medicen;
  

   HealthProblem.fromJson(Map<String, dynamic> json) {
    id= json["_id"];
    name= json["name"];
    medicen= json["medicen"];
}

}

class SurgicalOperation {
  String? id;
  String? name;
  String? date;


   SurgicalOperation.fromJson(Map<String, dynamic> json) {
     id = json["_id"];
     name = json["name"];
     date = json["date"];
   }

}

class Diagonas {
  List<dynamic> Medicine = [];

  String? id;
  String? DoctorName;
  String? date;
  String? Diagnose_condition;


  Diagonas.fromJson(Map<String, dynamic> json) {
    Medicine = List<dynamic>.from(json["Medicine"].map((x) => x));

    id = json["_id"];
    DoctorName = json["DoctorName"] ;
    date = json["date"];
    Diagnose_condition = json["Diagnose_condition"];


  }

}

