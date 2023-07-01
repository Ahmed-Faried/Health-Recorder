import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/const.dart';
import 'package:shop_app/Screens/ForgetPassword/Patient/cubit/ForgetPatientStates.dart';
import 'package:shop_app/moudel/LoginModel/PatientDataMoudleing.dart';

import '../../../../Network/Endpoint/EndPoint.dart';
import '../../../../Network/local/shared_preferences.dart';
import '../../../../Network/remote/dioHelper.dart';

class ForgetPassPatient extends Cubit<ForgetPassPatientStates> {
  ForgetPassPatient() : super(InitialForgetPassPatientStates());


  static ForgetPassPatient get(context) {
    return BlocProvider.of(context);
  }

  var email = TextEditingController() ;
  var National_ID = TextEditingController() ;




  ForgetPassPatientFunction({
    required email,
    required National_ID,

  }) {

       emit(ForgetPassPatientLoadingStates());
    DioHelper.postData(
        path: forget_pass_Patient,
        data: {
          'email': email,
          'National_ID': National_ID,


        }).then((value) async {

      print(value.statusMessage);

    patientDataModel = PatientDataModel.fromJson(value.data);


      CacheHelper.saveData(
          key:'token',
          value:patientDataModel?.token
      );
      CacheHelper.saveData(
          key:'id',
          value: patientDataModel?.data?.pationt!.id

      );
      CacheHelper.saveData(
          key: 'National_ID', value: patientDataModel?.data?.pationt?.nationalId);

      print(" Forget PAss Done Ya Zmely ");

      emit(ForgetPassPatientSuccessStates(patientDataModel?.status));


    }).catchError((onError) {
      if (onError is DioError) {
        if (onError.response != null) {
          print(onError.response?.data);
          print(onError.toString());
          print(onError.type.name);

        } else {
          print(onError.message);
        }
      } else {
        print(onError.toString());
      }

      emit(ForgetPassPatientErrorStates(onError.response!.data['message'].toString()));

      print(onError.toString());
    });
  }


}