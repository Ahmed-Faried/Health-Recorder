

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/moudel/LoginModel/PatientDataMoudleing.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../Network/remote/dioHelper.dart';
import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import 'ProfileStates.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialProfileStates());


  static ProfileCubit get(context) {
    return BlocProvider.of(context);
  }


  var FirstnameDoctorController = TextEditingController() ;
  var LastnameDoctorController = TextEditingController() ;
  var E_mailDoctorController = TextEditingController() ;
  var AddressDoctorController = TextEditingController() ;
  var ContactnumberDoctorController = TextEditingController() ;




  var firstNamePatientController = TextEditingController();
  var lastNamePatientController  = TextEditingController();
  var passwordPatientController  = TextEditingController();
  var emailPatientController     = TextEditingController();
  var agePatientController       = TextEditingController();
  var nationalIDPatientController = TextEditingController();
  var numberPatientController     = TextEditingController();
  var genderPatientController     = TextEditingController();
  var bloodTypePatientController  = TextEditingController();


  void upData_Doctor({
    required id ,
    required firstName,
    required lastName,
    required email,
    required address,
    required number,

  }
      ){

    emit(DoctorUpdateLoadingState());

    DioHelper.update( path: "$GETALLDATADOCTORFROMID$id" ,

    data:{

      'firstName': firstName,
      'lastName': lastName,
      // 'age': "99",
      // 'gender': "mail",
      // 'department': depart,
      // 'password': password,
      'email': email,
      'address': address,
      'phoneNumber': number,


    } ).then((value) {

      doctorDataModel = DoctorDataModel.fromJson(value.data);
      try {
        doctorDataModel = DoctorDataModel.fromJson(value.data);

        CacheHelper.saveData(key: 'idDoctor', value: doctorDataModel?.data?.doctor.id);
      } catch (e) {
        print('Error update id idi id id id d data: $e');
      }
      if (doctorDataModel == null) {
        print('Data update error null id id id id id ');
      } else {
        print('Data update id id id id id id di successful');
      }
      toastShow(msg: "tamam Doctor", state: toastStates.SUCCESS);
      print(" Data El Doctor update ya 3alee ");
      emit(DoctorUpdateSuccessState());

    }).catchError((onError){
      if (onError is DioError) {
        if (onError.response != null) {

          print(onError.response?.data['massage']);
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
      emit(DoctorUpdateErrorState());
    });
  }





  void upData_Patient({
    required id ,
    required firstName,
    required lastName,
    required email,
    required age,
    required number,

  }
      ){

    emit(PatientUpdateLoadingState());

    DioHelper.update( path: "$GETALLDATAPATIENTFROMID$id" ,

        data:{

          'fristName': firstName,
          'lastName': lastName,
          'age': age,
          'email': email,
          'phoneNumber': number,


        } ).then((value) {

      patientDataModel = PatientDataModel.fromJson(value.data);
      CacheHelper.saveData(key: 'id', value: patientDataModel?.data?.pationt?.id);
      CacheHelper.saveData(key: 'National_ID', value: patientDataModel?.data?.pationt?.nationalId);

      try {
        patientDataModel = PatientDataModel.fromJson(value.data);
      } catch (e) {
        print('Error Patient update id idi id id id d data: $e');
      }
      if (patientDataModel == null) {
        print('Data update error null id id id id id ');
      } else {
        print('Data update id id id id id id di successful');
      }
      toastShow(msg: "tamam Patient", state: toastStates.SUCCESS);
      print(" Data El Patient update ya 3alee ");
      emit(PatientUpdateSuccessState());

    }).catchError((onError){
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
      print(onError.toString());
      emit(PatientUpdateErrorState());
    });
  }




}