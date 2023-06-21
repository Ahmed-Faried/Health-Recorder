import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Components/components.dart';
import '../../../../Components/const.dart';
import '../../../../Network/Endpoint/EndPoint.dart';
import '../../../../Network/local/shared_preferences.dart';
import '../../../../Network/remote/dioHelper.dart';
import '../../../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../../../LoginAndRegister/LoginAndRegister.dart';
import '../RegisterPatientScreen1.dart';
import '../RegisterPatientScreen2.dart';
import '../RegisterPatientScreen4.dart';
import 'Patient_Skip_Register_States.dart';
import '../RegisterPatientScreen3.dart';

class Patient_Skip_RegisterCubit extends Cubit<RegisterSkipPatientStates> {
  Patient_Skip_RegisterCubit() : super(InitialPatientSkipRegisterStates());

  static Patient_Skip_RegisterCubit get(context) {
    return BlocProvider.of(context);
  }







}
