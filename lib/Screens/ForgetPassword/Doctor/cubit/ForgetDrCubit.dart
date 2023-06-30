



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Components/const.dart';
import 'package:shop_app/Screens/BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'package:shop_app/Screens/ForgetPassword/Patient/cubit/ForgetPatientStates.dart';
import 'package:shop_app/moudel/LoginModel/PatientDataMoudleing.dart';

import '../../../../Network/Endpoint/EndPoint.dart';
import '../../../../Network/local/shared_preferences.dart';
import '../../../../Network/remote/dioHelper.dart';
import '../../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import 'ForgetDrStates.dart';

class ForgetPassDoctor extends Cubit<ForgetPassDoctorStates> {
  ForgetPassDoctor() : super(InitialForgetPassDoctorStates());


  static ForgetPassDoctor get(context) {
    return BlocProvider.of(context);
  }

  var email = TextEditingController() ;
  var phoneNumber = TextEditingController() ;




  ForgetPassDoctorFunction({
    required email,
    required phoneNumber,

  }) {

    emit(ForgetPassDoctorLoadingStates());
    DioHelper.postData(
        path: forget_pass_Doctor,
        data: {
          'email': email,
          'phoneNumber': phoneNumber,


        }).then((value) async {

      print(value.statusMessage);

      doctorDataModel = DoctorDataModel.fromJson(value.data);


      CacheHelper.saveData(
          key: 'idDoctor', value: doctorDataModel?.data?.doctor.id);
      CacheHelper.saveData(
          key: 'department',
          value: doctorDataModel?.data?.doctor.department);
      CacheHelper.saveData(
          key: 'token', value: doctorDataModel?.token);


      print(" Forget PAss Doctor Done Ya Zmely ");

      emit(ForgetPassDoctorSuccessStates(doctorDataModel?.status));


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

      emit(ForgetPassDoctorErrorStates(onError.response!.data['message'].toString()));

      print(onError.toString());
    });
  }


}



// //
// ForgetPassDoctor({
//   required firstName,
//
// }) {
//   emit(DoctorRegisterLoadingState());
//
//   DioHelper.postData(
//       path: RegisterDoctorApi,
//       data: {
//         'firstName': firstName,
//         'lastName': lastName,
//         // 'age': "99",
//         // 'gender': "mail",
//         'department': depart,
//         'email': email,
//         'address': address,
//         'password': password,
//         'phoneNumber': number,
//
//       }).then((value) async {
//
//     print(value.statusMessage);
//
//     doctorDataModel = DoctorDataModel.fromJson(value.data);
//
//     print(" Register Done Ya Zmely ");
//
//     print(doctorDataModel?.data?.doctor.id);
//
//     print(doctorDataModel?.status);
//
//
//
//     emit(DoctorRegisterSuccessState(doctorDataModel!));
//
//   }).catchError((onError) {
//     if (onError is DioError) {
//       if (onError.response != null) {
//         // يمكن الوصول إلى البياناتالتي تم إرجاعها من الخادم باستخدام onError.response.data
//         print(onError.response?.data);
//         print(onError.toString());
//         print(onError.type.name);
//
//       } else {
//         print(onError.message);
//       }
//     } else {
//       print(onError.toString());
//     }
//
//     emit(DoctorRegisterErrorState(onError.response?.data['message'].toString()));
//
//     print(onError.toString());
//     print("eslam errrrrrrrrror eslam server eslam or net ");
//   });
// }
