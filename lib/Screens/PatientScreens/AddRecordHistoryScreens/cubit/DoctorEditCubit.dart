
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/const.dart';
import '../../../../Components/components.dart';
import '../../../../Network/Endpoint/EndPoint.dart';
import '../../../../Network/local/shared_preferences.dart';
import '../../../../Network/remote/dioHelper.dart';
import '../../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import 'DoctorEditStates.dart';

class DoctorEditCubit extends Cubit<DoctorEditStates> {
  DoctorEditCubit() : super(InitialDoctorEditStates());


  static DoctorEditCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController  chronicDiseaseController = TextEditingController();
  TextEditingController regularMedicineChronicDiseaseController = TextEditingController();

  TextEditingController  GeneticDiseasesController = TextEditingController();
  TextEditingController regularMedicineGeneticDiseasesController = TextEditingController();

  TextEditingController  HealthProblemController = TextEditingController();
  TextEditingController regularMedicineHealthProblemController = TextEditingController();

  TextEditingController  SurgicalHistoryController = TextEditingController();
  TextEditingController regularMedicineSurgicalHistoryController = TextEditingController();


  TextEditingController  diagonasController = TextEditingController();
  TextEditingController regularMedicinediagonasController = TextEditingController();




  DateTime now = DateTime.now();

  diagonas({
    DoctorName,
    now,
    Diagnose_condition,
    Medicine,


  }) {
      emit(diagonas_LoadingStates());
    var NID_PAtient  =  CacheHelper.getData(key:'id')   ;
    DioHelper.update(

        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {
          "diagonas": [
            {
              "DoctorName": DoctorName,
              "date": now,
              "Diagnose_condition": Diagnose_condition,
              "Medicine": [Medicine],

            }
          ]
        }
    ).then((value) async {
      emit(diagonas_SuccessStates());


      print("diagonas_ Tamam");



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
      emit(diagonas_ErrorStates(onError.response?.data['message']));
    });
  }


  chronic_DiseasesEdit({
    name,
    medicen,


  }) {

    emit(chronic_DiseasesEdit_LoadingStates());
    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(

        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {
          "chronic_Diseases": [
            {
              "name": name,
              "medicen": medicen
            }
          ],

        }
    ).then((value) async {

      print("chronic_DiseasesEdit Tamam");

      emit(chronic_DiseasesEdit_SuccessStates());


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
      emit(chronic_DiseasesEdit_ErrorStates(onError.response?.data['message']));
    });
  }


  Health_problems({
    name,
    medicen,


  }) {
    emit(Health_problems_LoadingStates());
    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {

          "Health_problems": [
            {
              "name": name,
              "medicen": medicen
            },
          ],

        }
    ).then((value) async {
      emit(Health_problems_LoadingStates());


      print("Health_problems Tamam");



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
      emit(Health_problems_ErrorStates(onError.response?.data['message']));
    });
  }


  Surgical_operations({
    name,
    date,


  }) {
    emit(Surgical_operations_LoadingStates());

    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {

          "Surgical_operations": [
            {
              "name": name,
              "date": date
            },
          ],

        }
    ).then((value) async {
      emit(Surgical_operations_SuccessStates());


      print("tamam");



    }).catchError((onError) {
      if (onError is DioError) {
        if (onError.response != null) {
          // يمكن الوصول إلى البياناتالتي تم إرجاعها من الخادم باستخدام onError.response.data
          print(onError.response?.data);
          print(onError.toString());
          print(onError.type.name);

        }
      }
      emit(Surgical_operations_ErrorStates(onError.response?.data['message']));
    });
  }


  Hereditary_diseases({
    name,
    medicen,


  }) {
    emit(Hereditary_diseases_LoadingStates());

    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {

          "Hereditary_diseases": [
            {
              "name": name,
              "medicen": medicen
            }
          ],
        }
    ).then((value) async {
      emit(Hereditary_diseases_SuccessStates());

      print("Hereditary_diseases Tamam ");

    }).catchError((onError) {
      if (onError is DioError) {
        if (onError.response != null) {
          // يمكن الوصول إلى البياناتالتي تم إرجاعها من الخادم باستخدام onError.response.data
          print(onError.response?.data);
          print(onError.toString());
          print(onError.type.name);

        }
      }
      emit(Hereditary_diseases_ErrorStates(onError.response?.data['message']));
    });
  }



}