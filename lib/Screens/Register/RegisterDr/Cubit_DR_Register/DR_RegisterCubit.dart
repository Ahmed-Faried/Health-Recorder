import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Components/const.dart';
import '../../../../Network/Endpoint/EndPoint.dart';
import '../../../../Network/remote/dioHelper.dart';
import '../../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import 'DR_RegisterStates.dart';

class DR_Cubit_Register extends Cubit<RegisterDR_States> {
  DR_Cubit_Register() : super(InitialDrRegisterStates());

  static DR_Cubit_Register get(context) {
    return BlocProvider.of(context);
  }

  var firstNameDoctorController = TextEditingController();
  var lastNameDoctorController = TextEditingController();
  var passwordDoctorController = TextEditingController();
  var emailDoctorController = TextEditingController();
  var departDoctorController = TextEditingController();
  var addressDoctorController = TextEditingController();
  var numberDoctorController = TextEditingController();



  bool checkBoxValue = false;

  void changeCheckBox(value) {
    checkBoxValue = !checkBoxValue;
    emit(ChangeCheckBoxColorState());
  }

  DoctorRegister({
    required firstName,
    required lastName,
    required password,
    required email,
    required depart,
    required address,
    required number,
  }) {
    emit(DoctorRegisterLoadingState());

    DioHelper.postData(
        path: RegisterDoctorApi,
        data: {
      'firstName': firstName,
      'lastName': lastName,
      // 'age': "99",
      // 'gender': "mail",
      'department': depart,
      'email': email,
      'address': address,
      'password': password,
      'phoneNumber': number,

    }).then((value) async {

        print(value.statusMessage);

        doctorDataModel = DoctorDataModel.fromJson(value.data);

        print(" Register Done Ya Zmely ");

        print(doctorDataModel?.data?.doctor.id);

        print(doctorDataModel?.status);



        emit(DoctorRegisterSuccessState(doctorDataModel!));

    }).catchError((onError) {
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

      emit(DoctorRegisterErrorState(onError.response?.data['message'].toString()));

      print(onError.toString());
      print("eslam errrrrrrrrror eslam server eslam or net ");
    });
  }



  //
  // PatientRegister(
  //
  //     // String firstName,
  //     // String lastName,
  //     // String bloodType,
  //     // String gender,
  //     // String  password,
  //     // String email,
  //     // String number,
  //     // String National_ID,
  //      {required BuildContext context}
  //
  //     ) {
  //   emit(PatientRegisterLoadingState());
  //
  //   DioHelper.postData(path: RegisterPatientApi,
  //       data: {
  //         'firstName':"firstName",
  //         'lastName': "lastName",
  //         'age': 57,
  //         "bloodType": "A+",
  //         'gender': "mail",
  //         'email': "asbhbds@as.com",
  //         'password': "157412541254",
  //         'phoneNumber': "07236547895",
  //         "National_ID" :"17512584545444"
  //       }).then((value) async {
  //
  //     print(value.statusMessage);
  //
  //     patientDataModel = PatientDataModel.fromJson(value.data);
  //
  //     print(" Register Done Ya Zmely ");
  //
  //     print(patientDataModel?.data?.pationt?.id);
  //
  //     print(patientDataModel?.status);
  //
  //     print("$nationalIDPatientController , $firstNamePatientController ,$lastNamePatientController ,$agePatientController,$bloodTypePatientController,$genderPatientController");
  //
  //
  //     toastShow(msg: "tamam Patient", state: toastStates.SUCCESS);
  //
  //     navigateAndFinish(context, HomePagePatientScreen());
  //
  //     emit(PatientRegisterSuccessState());
  //
  //   }).catchError((onError) {
  //     print(
  //         "${firstNamePatientController.text}\n"
  //         "${lastNamePatientController.text} \n"
  //         "${agePatientController.text}\n"
  //         "${bloodTypePatientController.text}\n"
  //         "${genderPatientController.text}\n"
  //         "${emailPatientController.text}\n"
  //         "${passwordPatientController.text}\n"
  //         "${numberPatientController.text}\n"
  //         "${nationalIDPatientController.text}\n"
  //
  //     );
  //     toastShow(msg: "no Filed empty Patient", state: toastStates.ERROR);
  //
  //     emit(PatientRegisterErrorState());
  //
  //     print(onError.toString());
  //     print(" Patient eslam errrrrrrrrror eslam server eslam or net ");
  //   });
  // }

  //
  //  PatientRegister({
  //   required  firstName,
  //   required  lastName,
  //   required  age,
  //   required  bloodType,
  //   required  gender,
  //   required  password,
  //   required  email,
  //   required  number,
  //   required  National_ID,
  // }) {
  //   emit(PatientRegisterLoadingState());
  //
  //   DioHelper.postData(
  //       path: RegisterPatientApi,
  //       data: {
  //         'firstName': firstName,
  //         'lastName': lastName,
  //         'age': age,
  //         'bloodType': bloodType,
  //         'gender': gender,
  //         'email': email,
  //         'password': password,
  //         'phoneNumber': number,
  //         'National_ID': National_ID
  //       }).then((value) async {
  //     toastShow(msg: "tamam Patient", state: toastStates.SUCCESS);
  //
  //     patientDataModel = PatientDataModel.fromJson(value.data);
  //     print(patientDataModel?.status);
  //   emit(PatientRegisterSuccessState());
  //   }).catchError((onError) {
  //     toastShow(msg: "خطأ في التسجيل", state: toastStates.ERROR);
  //     print(
  //               "${firstNamePatientController.text}\n"
  //               "${lastNamePatientController.text} \n"
  //               "${agePatientController.text}\n"
  //               "${bloodTypePatientController.text}\n"
  //               "${genderPatientController.text}\n"
  //               "${emailPatientController.text}\n"
  //               "${passwordPatientController.text}\n"
  //               "${numberPatientController.text}\n"
  //               "${nationalIDPatientController.text}\n"
  //
  //           );
  //
  //     print(onError);
  //     emit(PatientRegisterErrorState());
  //
  //   });
  // }
  //



















  bool isPassword = true ;
  IconData showPassword = Icons.visibility_off_rounded ;

  void changePasswordRegister(){
    isPassword =  ! isPassword ;
    showPassword = isPassword ? Icons.visibility_off_rounded : Icons.visibility ;

    emit(ChangePasswordIconRegister());
  }










}
