import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/remote/dioHelper.dart';
import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import 'DoctorStates.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(InitialDoctorStates());


  static DoctorCubit get(context) {
    return BlocProvider.of(context);
  }


  void getData_Doctor(id){

    emit(Data_DoctorFromID_LoadingState());

    DioHelper.getData( urlMethod: "$GETALLDATADOCTORFROMID$id" ).then((value) {

      doctorDataModel = DoctorDataModel.fromJson(value.data);
      try {
        doctorDataModel = DoctorDataModel.fromJson(value.data);
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

    }).catchError((onError){
      print(onError.toString());
      emit(Data_DoctorFromID_ErrorState());
    });
  }


}