abstract class DoctorStates {}

class InitialDoctorStates extends DoctorStates {}

class Data_DoctorFromID_SuccessState extends DoctorStates {}

class Data_DoctorFromID_ErrorState extends DoctorStates {}

class Data_DoctorFromID_LoadingState extends DoctorStates {}

class Data_Patient_SuccessState extends DoctorStates {}

class Data_Patient_ErrorState extends DoctorStates {
  String err ;
  Data_Patient_ErrorState(this.err);
}

class Data_Patient_LoadingState extends DoctorStates {}

class Data_PatientFromNID_SuccessState extends DoctorStates {}

class Data_PatientFromNID_ErrorState extends DoctorStates {
  String err ;
  Data_PatientFromNID_ErrorState(this.err);
}

class Data_PatientFromNID_LoadingState extends DoctorStates {}

class removess extends DoctorStates {}

class removeDataPatientID extends DoctorStates {}
