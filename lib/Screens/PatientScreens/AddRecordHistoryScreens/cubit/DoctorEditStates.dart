abstract class DoctorEditStates  {}

class InitialDoctorEditStates extends DoctorEditStates {}

class DoctorEditLoadingStates extends DoctorEditStates {}

class DoctorEditSuccessStates extends DoctorEditStates {}

class DoctorEditErrorStates extends DoctorEditStates {}


class chronic_DiseasesEdit_LoadingStates extends DoctorEditStates {}

class chronic_DiseasesEdit_SuccessStates extends DoctorEditStates {}

class chronic_DiseasesEdit_ErrorStates extends DoctorEditStates {

  var ErrorChronic ;
  chronic_DiseasesEdit_ErrorStates(this.ErrorChronic);
}


class Health_problems_LoadingStates extends DoctorEditStates {}

class Health_problems_SuccessStates extends DoctorEditStates {}

class Health_problems_ErrorStates extends DoctorEditStates {
  var ErrorHealth_problems ;
  Health_problems_ErrorStates(this.ErrorHealth_problems);
}


class Surgical_operations_LoadingStates extends DoctorEditStates {}

class Surgical_operations_SuccessStates extends DoctorEditStates {}

class Surgical_operations_ErrorStates extends DoctorEditStates {
  var ErrorSurgical_operations ;
  Surgical_operations_ErrorStates(this.ErrorSurgical_operations);
}


class Hereditary_diseases_LoadingStates extends DoctorEditStates {}

class Hereditary_diseases_SuccessStates extends DoctorEditStates {}

class Hereditary_diseases_ErrorStates extends DoctorEditStates {
  var ErrorHereditary_diseases ;
  Hereditary_diseases_ErrorStates(this.ErrorHereditary_diseases);
}

class diagonas_LoadingStates extends DoctorEditStates {}

class diagonas_SuccessStates extends DoctorEditStates {}

class diagonas_ErrorStates extends DoctorEditStates {
  var diagonas_Error ;
  diagonas_ErrorStates(this.diagonas_Error);
}


