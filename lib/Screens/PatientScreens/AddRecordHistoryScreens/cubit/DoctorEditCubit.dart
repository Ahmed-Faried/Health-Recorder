
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

  chronic_DiseasesEdit({
    test1,
    test2,


  }) {
    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {
          "chronic_Diseases": [
            {
              "name": test1,
              "medicen": test2 // تحديث حقل medicen للمرض الأول
            }
          ],
          "Health_problems": [
            {
              "name": test3,
              "medicen": test4
            },
          ],
          "Surgical_operations": [
            {
              "name": test5,
              "date": test6
            },
          ],
          "Hereditary_diseases": [
            {
              "name": test7,
              "medicen": test8
            }
          ],
        }
    ).then((value) async {

      print("tamam");



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
      toastShow(msg: "error PatientRegisterHealthErrorState ", state: toastStates.ERROR);
      emit(PatientRegisterHealthErrorState(onError.response?.data['message'].toString()));
    });
  }

  Health_problems({
    test1,
    test2,


  }) {
    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {
          "chronic_Diseases": [
            {
              "name": test1,
              "medicen": test2 // تحديث حقل medicen للمرض الأول
            }
          ],
          "Health_problems": [
            {
              "name": test3,
              "medicen": test4
            },
          ],
          "Surgical_operations": [
            {
              "name": test5,
              "date": test6
            },
          ],
          "Hereditary_diseases": [
            {
              "name": test7,
              "medicen": test8
            }
          ],
        }
    ).then((value) async {

      print("tamam");



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
      toastShow(msg: "error PatientRegisterHealthErrorState ", state: toastStates.ERROR);
      emit(PatientRegisterHealthErrorState(onError.response?.data['message'].toString()));
    });
  }


  Surgical_operations({
    test1,
    test2,


  }) {
    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {
          "chronic_Diseases": [
            {
              "name": test1,
              "medicen": test2 // تحديث حقل medicen للمرض الأول
            }
          ],
          "Health_problems": [
            {
              "name": test3,
              "medicen": test4
            },
          ],
          "Surgical_operations": [
            {
              "name": test5,
              "date": test6
            },
          ],
          "Hereditary_diseases": [
            {
              "name": test7,
              "medicen": test8
            }
          ],
        }
    ).then((value) async {

      print("tamam");



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
      toastShow(msg: "error PatientRegisterHealthErrorState ", state: toastStates.ERROR);
      emit(PatientRegisterHealthErrorState(onError.response?.data['message'].toString()));
    });
  }


  Hereditary_diseases({
    test1,
    test2,


  }) {
    var NID_PAtient  =  CacheHelper.getData(key:'National_ID')   ;
    DioHelper.update(
        path: "$UpdateRegisterPatientHealth$NID_PAtient",
        data: {
          "chronic_Diseases": [
            {
              "name": test1,
              "medicen": test2 // تحديث حقل medicen للمرض الأول
            }
          ],
          "Health_problems": [
            {
              "name": test3,
              "medicen": test4
            },
          ],
          "Surgical_operations": [
            {
              "name": test5,
              "date": test6
            },
          ],
          "Hereditary_diseases": [
            {
              "name": test7,
              "medicen": test8
            }
          ],
        }
    ).then((value) async {

      print("tamam");



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
      toastShow(msg: "error PatientRegisterHealthErrorState ", state: toastStates.ERROR);
      emit(PatientRegisterHealthErrorState(onError.response?.data['message'].toString()));
    });
  }



}