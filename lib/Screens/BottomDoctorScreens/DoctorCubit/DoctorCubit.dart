import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../Network/remote/dioHelper.dart';
import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../../../moudel/Mashro3tany/PatientModel/PatientIDMoudleing.dart';
import 'DoctorStates.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(InitialDoctorStates());


  static DoctorCubit get(context) {
    return BlocProvider.of(context);
  }


   getData_Doctor() {
    emit(Data_DoctorFromID_LoadingState());
     var id = CacheHelper.getData(key:'idDoctor') ;
    DioHelper.getData(urlMethod: "$GETALLDATADOCTORFROMID$id").then((value) async {
      doctorDataModel = DoctorDataModel.fromJson(value.data);
     ss.addAll(doctorDataModel?.data?.doctor.pId as Iterable);
      getAllPatientConnected(ss);

      print(ss);




      print(" Data El Doctor Gat tany ya 3alee ");
      emit(Data_DoctorFromID_SuccessState());
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
      print(onError.toString());
      emit(Data_DoctorFromID_ErrorState());
    });
  }




   getPatientFormNID({

    Nid ,}) {

    emit(Data_PatientFromNID_LoadingState());
    DioHelper.getData(
      urlMethod: "$GetPatientFromNID$Nid",
    ).then((value)  {

      DataPatientID.add(PatientDataModel.fromJson(value.data) );
      print("DataPatientID = " );
      print(DataPatientID);

      emit(Data_PatientFromNID_SuccessState());
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

      emit(Data_PatientFromNID_ErrorState());
      print("errrrrrrrrror server or net Data_PatientFromID_ErrorState ");
    });
  }



 getAllPatientConnected (List<dynamic> X) async {

  for(int  i = 0 ; i < X.length  ; i++   ){



  await getPatientFormNID(Nid: X[i]);
  print("getAllPatientConnected  X[i] = ""${X[i]}");
  // print(DataPatientID[i] );

  }
  print("ba3ed el for  $DataPatientID");

  return DataPatientID ;

}


////////////////////
    getData_Patient({id})  {

    emit(Data_Patient_LoadingState());

    DioHelper.getData( urlMethod: "$GetPatientFromNID$id"  ).then((value)  {

     patientDataModel = PatientDataModel.fromJson(value.data);
      print(" Data El patient Gat tany ya 3alee ");
      emit(Data_Patient_SuccessState());

    }).catchError((onError){
      print("$GETALLDATAPATIENTFROMID$id");

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
      emit(Data_Patient_ErrorState());
    });


  }


/*Patient*/


// function of getDataFromPatient


}