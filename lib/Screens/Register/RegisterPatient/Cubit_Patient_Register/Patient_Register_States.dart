
import '../../../../moudel/LoginModel/PatientDataMoudleing.dart';

abstract class RegisterPatientStates {}

class InitialPatientRegisterStates extends RegisterPatientStates {}

class ChangeCheckBoxColorState extends RegisterPatientStates {}


class PatientRegisterLoadingState extends RegisterPatientStates {}

class PatientRegisterSuccessState extends RegisterPatientStates {


  final PatientDataModel  patientDataModel ;

  PatientRegisterSuccessState(this.patientDataModel);
}

class PatientRegisterErrorState extends RegisterPatientStates {

  String? Error ;
  PatientRegisterErrorState(this.Error);

}

class ChangePasswordIconRegister extends RegisterPatientStates {}

class ImagePatientRegister extends RegisterPatientStates {}

class AlertPatientRegister extends RegisterPatientStates {}

class IsLastPageTruePatientRegister extends RegisterPatientStates {}

class IsLastPageFalsePatientRegister extends RegisterPatientStates {}

class SubmitPatientRegister extends RegisterPatientStates {}

class BloodTypeChangeState extends RegisterPatientStates {}

class BloodTypeIndexChangeState extends RegisterPatientStates {}

class ChangeGenderTypeState extends RegisterPatientStates {}
