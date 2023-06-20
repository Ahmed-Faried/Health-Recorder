import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../Network/remote/dioHelper.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';
import 'PatientStates.dart';

class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() : super(InitialPatientStates());


  static PatientCubit get(context) {
    return BlocProvider.of(context);
  }



  // function of getDataFromPatient
  void getData_Patient()  {

    emit(Data_PatientFromID_LoadingState());
      String idP = CacheHelper.getData(key:'National_ID') ;
    DioHelper.getData( urlMethod: "$GETALLDATAPATIENTFROMID$idP"  ).then((value) {

      patientDataModel = PatientDataModel.fromJson(value.data);

      print(" Data El patient Gat tany ya 3alee ");
      emit(Data_PatientFromID_SuccessState());

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
      emit(Data_PatientFromID_ErrorState());
    });
  }

}