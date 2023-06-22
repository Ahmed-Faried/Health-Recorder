
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

  String? Errors ;
  PatientRegisterErrorState(this.Errors);

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

class ChangeDateState extends RegisterPatientStates {}

class ChangeFamilyGeneticState extends RegisterPatientStates {}

class ChronicValueState extends RegisterPatientStates {}

class PatientRegisterHealthLoadingState extends RegisterPatientStates {}

class PatientRegisterHealthSuccessState extends RegisterPatientStates {}

class PatientRegisterHealthErrorState extends RegisterPatientStates {

  String? Errors ;
  PatientRegisterHealthErrorState(this.Errors);

}
