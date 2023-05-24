abstract class ProfileStates {}

class InitialProfileStates extends ProfileStates {}

class DoctorUpdateLoadingState extends ProfileStates {}

class DoctorUpdateSuccessState extends ProfileStates {


}

class DoctorUpdateErrorState extends ProfileStates {

}

class PatientUpdateLoadingState extends ProfileStates {}

class PatientUpdateSuccessState extends ProfileStates {


}

class PatientUpdateErrorState extends ProfileStates {

}
