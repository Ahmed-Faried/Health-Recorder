

class PatientModelID {
  late String status;
  late DataID? data;

  PatientModelID.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : DataID.fromJson(json["data"]);
  }
}

class DataID {
  late PationtID? pationt;


  DataID.fromJson(Map<String, dynamic> json) {

    pationt = PationtID.fromJson(json['pationt']) ;


  }

}
class PationtID {
  String? id;
  int? age;
  String? bloodType;
  String? fristName;
  String? lastName;
  String? gender;
  String? email;
  String? phoneNumber;
  String? password;


  PationtID.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    age = json["age"];
    bloodType = json["bloodType"];
    fristName = json["fristName"];
    lastName = json["lastName"];
    gender = json["gender"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    password = json["password"];




  }
}
