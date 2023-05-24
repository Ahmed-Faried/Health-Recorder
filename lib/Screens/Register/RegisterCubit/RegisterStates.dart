import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';

abstract class RegisterStates {}

class InitialRegisterStates extends RegisterStates {}

class ChangeCheckBoxColorState extends RegisterStates {}

class DoctorRegisterLoadingState extends RegisterStates {}

class DoctorRegisterSuccessState extends RegisterStates {

  final DoctorDataModel  doctorDataModel ;

  DoctorRegisterSuccessState(this.doctorDataModel);
}

class DoctorRegisterErrorState extends RegisterStates {}

class PatientRegisterLoadingState extends RegisterStates {}

class PatientRegisterSuccessState extends RegisterStates {


  final PatientDataModel  patientDataModel ;

  PatientRegisterSuccessState(this.patientDataModel);
}

class PatientRegisterErrorState extends RegisterStates {}

class ChangePasswordIconRegister extends RegisterStates {}
