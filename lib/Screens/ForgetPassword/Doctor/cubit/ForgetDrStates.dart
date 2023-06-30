abstract class ForgetPassDoctorStates {}

class InitialForgetPassDoctorStates extends ForgetPassDoctorStates {}

class ForgetPassDoctorLoadingStates extends ForgetPassDoctorStates {}

class ForgetPassDoctorSuccessStates extends ForgetPassDoctorStates {

  String? SuccessChangePassDoctor ;
  ForgetPassDoctorSuccessStates(this.SuccessChangePassDoctor);
}

class ForgetPassDoctorErrorStates extends ForgetPassDoctorStates {


  String? ErrorChangePassDoctor ;
  ForgetPassDoctorErrorStates(this.ErrorChangePassDoctor);
}
