import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/remote/dioHelper.dart';
import 'package:shop_app/moudel/LoginModel/DoctorDataMoudleing.dart';
import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';
import 'StatesLoginScreen.dart';


class LoginScreenCubit extends Cubit<LoginScreenStates>{
  LoginScreenCubit() : super(InitialStateLoginScreen());


  static LoginScreenCubit get(context){
    return BlocProvider.of(context);
  }


  var userNameController = TextEditingController() ;
  var passwordController = TextEditingController() ;



  DoctorLogin(
  {
    required String email,
    required String password,
  }
)
 {

emit(LoginDoctorScreenLoadingState());
    DioHelper.postData(
        path: GETDATADOCTOR,
        data:
        {
       'email' : email ,
       'password' : password
        }).then((value) async {


          doctorDataModel = DoctorDataModel.fromJson(value.data);

          CacheHelper.saveData(
              key: 'idDoctor', value: doctorDataModel?.data?.doctor.id);
          CacheHelper.saveData(
              key: 'department',
              value: doctorDataModel?.data?.doctor.department);
          CacheHelper.saveData(
              key: 'token', value: doctorDataModel?.token);

          print(doctorDataModel?.data?.doctor.department);
          print(doctorDataModel?.data?.doctor.id);

          emit(LoginDoctorScreenSuccessState(doctorDataModel!));
    }).catchError((onError){
      print(onError.toString());
      if (onError is DioError) {
        if (onError.response != null) {
          // يمكن الوصول إلى البياناتالتي تم إرجاعها من الخادم باستخدام onError.response.data
          print(onError.response?.data);
          print(onError.toString());
          print(onError.type.name);

        } else {
          print(onError.message);
        }
      } else {
        print(onError.toString());
      }
      print("eslam errrrrrrrrror eslam server eslam or net ");
      emit(LoginDoctorScreenErrorState(onError.response!.data['message'].toString()));
    });
 }




   PatientLogin(
      {
        //Patient@signin.com
        //Patient@signin.com
        required String email,
        required String password,}
      )
  {

    emit(LoginPatientScreenLoadingState());
    DioHelper.postData(
        path: GETDATAPATIENT,
        data:
        {
          'email' : email ,
          'password' : password
        }).then((value) async {
      print(value.statusMessage);
       patientDataModel =  PatientDataModel.fromJson(value.data);
      try {
        patientDataModel = PatientDataModel.fromJson(value.data);
      } catch (e) {
        print('Error parsing data: $e');
      }
      if (patientDataModel == null) {
        print('Data conversion error');
      } else {
        print('Data conversion successful');
      }
      print(patientDataModel?.data);
      print(patientDataModel?.data?.pationt?.id);


      emit(LoginPatientScreenSuccessState(patientDataModel!));
    }).catchError((onError){

      if (onError is DioError) {
        if (onError.response != null) {

          print(onError.response?.data);
          print("---------------------------");
          print(onError.toString());
          print("---------------------------");

          print(onError.type.name);

        } else {
          print(onError.message);
        }
      } else {
        print(onError.toString());
      }

      print(onError.toString());
      print("eslam errrrrrrrrror eslam server eslam or net ");
      emit(LoginPatientScreenErrorState(onError.response?.data['message'].toString()));
    });
  }




  //
  // // function of getDataFromPatient
  // void getData_Patient(id)  {
  //
  //   emit(PatientScreenLoadingState());
  //
  //   DioHelper.getData( urlMethod: "$GETALLDATAPATIENTFROMID$id"  ).then((value) {
  //
  //     patientDataModel = PatientDataModel.fromJson(value.data);
  //
  //     print(" Data El patient Gat tany ya 3alee ");
  //     emit(PatientScreenSuccessState());
  //
  //   }).catchError((onError){
  //     print("$GETALLDATAPATIENTFROMID$id");
  //
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
  //     print(onError.toString());
  //     emit(PatientScreenErrorState());
  //   });
  // }
  //
  //
  // void getData_Doctor(id){
  //
  //   emit(DoctorScreenLoadingState());
  //
  //   DioHelper.getData( urlMethod: "$GETALLDATADOCTORFROMID$id" ).then((value) {
  //
  //     doctorDataModel = DoctorDataModel.fromJson(value.data);
  //     try {
  //       doctorDataModel = DoctorDataModel.fromJson(value.data);
  //     } catch (e) {
  //       print('Error id idi id id id d data: $e');
  //     }
  //     if (doctorDataModel == null) {
  //       print('Data conversion error null id id id id id ');
  //     } else {
  //       print('Data id id id id id id di successful');
  //     }
  //     print(" Data El Doctor Gat tany ya 3alee ");
  //     emit(DoctorScreenSuccessState());
  //
  //   }).catchError((onError){
  //     print(onError.toString());
  //     emit(DoctorScreenErrorState());
  //   });
  // }
  //
  //





  bool isPassword = true ;
  IconData showPassword = Icons.visibility_off_rounded ;

  void changePasswordRegister(){
    isPassword =  ! isPassword ;
    showPassword = isPassword ? Icons.visibility_off_rounded : Icons.visibility ;

    emit(ChangePasswordIconRegister());
  }




}