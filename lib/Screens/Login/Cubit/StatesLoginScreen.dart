import 'package:shop_app/moudel/LoginModel/DoctorDataMoudleing.dart';
import 'package:shop_app/moudel/LoginModel/PatientDataMoudleing.dart';

abstract class LoginScreenStates {}

class InitialStateLoginScreen extends LoginScreenStates {}

class  LoginDoctorScreenLoadingState extends LoginScreenStates {}

class LoginDoctorScreenSuccessState extends LoginScreenStates {

  final DoctorDataModel  doctorDataModel ;

  LoginDoctorScreenSuccessState(this.doctorDataModel);
}

class LoginDoctorScreenErrorState extends LoginScreenStates {

  final String error ;

  LoginDoctorScreenErrorState(this.error);

}

class  LoginPatientScreenLoadingState extends LoginScreenStates {}

class LoginPatientScreenSuccessState extends LoginScreenStates {

  final PatientDataModel  patientDataModel ;

  LoginPatientScreenSuccessState(this.patientDataModel);
}

class LoginPatientScreenErrorState extends LoginScreenStates {

  final String? error ;

  LoginPatientScreenErrorState(this.error);

}

class  PatientScreenLoadingState extends LoginScreenStates {}

class PatientScreenSuccessState extends LoginScreenStates {


}

class PatientScreenErrorState extends LoginScreenStates {

}

class  DoctorScreenLoadingState extends LoginScreenStates {}

class DoctorScreenSuccessState extends LoginScreenStates {


}

class DoctorScreenErrorState extends LoginScreenStates {

}

class ChangeCheckBoxState extends LoginScreenStates {}

class ChangePasswordIconRegister extends LoginScreenStates {}

class BloodTypeChangeState extends LoginScreenStates {}







