abstract class ForgetPassPatientStates {}

class InitialForgetPassPatientStates extends ForgetPassPatientStates {}

class ForgetPassPatientLoadingStates extends ForgetPassPatientStates {}

class ForgetPassPatientSuccessStates extends ForgetPassPatientStates {

  String? SuccessChangePassPatient ;
  ForgetPassPatientSuccessStates(this.SuccessChangePassPatient);
}

class ForgetPassPatientErrorStates extends ForgetPassPatientStates {


  String? ErrorChangePassPatient ;
  ForgetPassPatientErrorStates(this.ErrorChangePassPatient);
}
