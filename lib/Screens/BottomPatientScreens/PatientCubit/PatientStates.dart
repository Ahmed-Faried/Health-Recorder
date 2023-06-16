abstract class PatientStates {}

class InitialPatientStates extends PatientStates {}

class Data_PatientFromID_SuccessState extends PatientStates {}

class Data_PatientFromID_ErrorState extends PatientStates {}

class Data_PatientFromID_LoadingState extends PatientStates {}
