
import '../../../../moudel/LoginModel/PatientDataMoudleing.dart';

abstract class RegisterPatientStates {}

class InitialPatientRegisterStates extends RegisterPatientStates {}

class ChangeCheckBoxColorState extends RegisterPatientStates {}


class PatientRegisterLoadingState extends RegisterPatientStates {}

class PatientRegisterSuccessState extends RegisterPatientStates {


  final PatientDataModel  patientDataModel ;

  PatientRegisterSuccessState(this.patientDataModel);
}

class PatientRegisterErrorState extends RegisterPatientStates {}

class ChangePasswordIconRegister extends RegisterPatientStates {}
