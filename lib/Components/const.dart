//  abdullah.ahmed0@gmail.com

import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorCubit.dart';

import '../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../moudel/LoginModel/PatientDataMoudleing.dart';

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

List<PatientDataModel> DataPatientID =[]  ;

 deleteAllData(){

 doctorDataModel = null ;
 patientDataModel = null ;
 patientDataModelFromNid = null ;
 DoctorCubit().ss = [] ;
 DataPatientID =[]  ;
 print(doctorDataModel?.data?.doctor.pId);
 print(patientDataModel);
 print(patientDataModelFromNid);
 print(DataPatientID);
 return doctorDataModel ;

}