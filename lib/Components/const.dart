//  abdullah.ahmed0@gmail.com

import '../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../moudel/LoginModel/PatientDataMoudleing.dart';
import '../moudel/Mashro3tany/PatientModel/PatientIDMoudleing.dart';

String? token = '';
String? department = '';
String? idPatient;
String? National_ID;
String? imagePatient ;
String? imageDoctor;
String? idDoctor;
bool?  isdark;

DoctorDataModel? doctorDataModel;
PatientDataModel? patientDataModel;
PatientDataModel? patientDataModelFromNid;

List<dynamic> ss = []  ;
List<PatientDataModel> DataPatientID =[]  ;

 deleteAllData(){

 doctorDataModel = null ;
 patientDataModel = null ;
 patientDataModelFromNid = null ;
 ss = [] ;
 DataPatientID =[]  ;
 print(doctorDataModel?.data?.doctor.pId);
 print(patientDataModel);
 print(patientDataModelFromNid);
 print(ss);
 print(DataPatientID);
 return doctorDataModel ;

}