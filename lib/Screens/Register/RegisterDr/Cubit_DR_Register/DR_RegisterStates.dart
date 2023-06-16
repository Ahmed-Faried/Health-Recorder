import '../../../../moudel/LoginModel/DoctorDataMoudleing.dart';


abstract class RegisterDR_States {}

class InitialDrRegisterStates extends RegisterDR_States {}

class ChangeCheckBoxColorState extends RegisterDR_States {}

class DoctorRegisterLoadingState extends RegisterDR_States {}

class DoctorRegisterSuccessState extends RegisterDR_States {

  final DoctorDataModel  doctorDataModel ;

  DoctorRegisterSuccessState(this.doctorDataModel);
}

class DoctorRegisterErrorState extends RegisterDR_States {}

class ChangePasswordIconRegister extends RegisterDR_States {}
