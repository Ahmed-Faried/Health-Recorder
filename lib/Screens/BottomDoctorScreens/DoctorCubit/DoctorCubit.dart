import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
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


  void getData_Doctor(id) {
    emit(Data_DoctorFromID_LoadingState());

    DioHelper.getData(urlMethod: "$GETALLDATADOCTORFROMID$id").then((value) {
      doctorDataModel = DoctorDataModel.fromJson(value.data);
      try {
        doctorDataModel = DoctorDataModel.fromJson(value.data);

        getAllPatientConnected(doctorDataModel?.data?.doctor.pId);
      } catch (e) {
        print('Error id idi id id id d data: $e');
      }
      if (doctorDataModel == null) {
        print('Data conversion error null id id id id id ');
      } else {
        print('Data id id id id id id di successful');
      }
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



  void getPatientFormNID({

          Nid ,}) {

    emit(Data_PatientFromNID_LoadingState());
    DioHelper.getData(
         urlMethod: "$GetPatientFromNID$Nid",
      ).then((value)  {

      DataPatientID?.add(PatientDataModel.fromJson(value.data));

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




void getAllPatientConnected (List? X){

  for(int  i = 0 ; i > X!.length-1 ; i++   ){
    getPatientFormNID(Nid: X?[i]);
  }

}

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