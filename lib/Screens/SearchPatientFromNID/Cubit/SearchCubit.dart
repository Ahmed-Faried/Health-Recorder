
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/SearchPatientFromNID/Cubit/SearchStates.dart';

import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/remote/dioHelper.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchStates());


  static SearchCubit get(context) {
    return BlocProvider.of(context);
  }

  var Search = TextEditingController();


  // function of getDataFromPatient

   DoctorSearchNID(idP)  {

    emit(SearchStates_LoadingState());

    DioHelper.getData( urlMethod: "$GETALLDATAPATIENTFROMID$idP"  ).then((value) {

      patientDataModelFromNid = PatientDataModel.fromJson(value.data);

      print(" Search wesal   ya 3alme ");
      emit(SearchStates_SuccessState());

    }).catchError((onError){
      print("$GETALLDATAPATIENTFROMID$idP");

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
      emit(SearchStates_ErrorState(onError.response?.data['message'].toString()));
    });
  }


}