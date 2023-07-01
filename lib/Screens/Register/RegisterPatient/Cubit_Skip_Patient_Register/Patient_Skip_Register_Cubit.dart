
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Patient_Skip_Register_States.dart';

class Patient_Skip_RegisterCubit extends Cubit<RegisterSkipPatientStates> {
  Patient_Skip_RegisterCubit() : super(InitialPatientSkipRegisterStates());

  static Patient_Skip_RegisterCubit get(context) {
    return BlocProvider.of(context);
  }







}
