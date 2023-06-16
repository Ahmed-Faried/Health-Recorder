import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/Endpoint/EndPoint.dart';
import 'package:shop_app/Network/remote/dioHelper.dart';
import '../Components/components.dart';
import '../Components/const.dart';
import '../Network/local/shared_preferences.dart';
import '../Screens/BottomDoctorScreens/AccountDr/AccountDrScreen.dart';
import '../Screens/BottomDoctorScreens/HomeDr/HomeDrScreen.dart';
import '../Screens/BottomPatientScreens/AccountPatient/AccountPatientScreen.dart';
import '../Screens/BottomPatientScreens/HomePatient/HomePatientScreen.dart';
import '../Screens/PatientDetails/PatientDetailsScreen.dart';
import '../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../moudel/LoginModel/PatientDataMoudleing.dart';
import '../moudel/Mashro3tany/PatientModel/PatientIDMoudleing.dart';
import 'HomeStates.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(initialStateShopApp());


  static HomeCubit get(context){
    return BlocProvider.of(context);
  }



  // Home page Doctor Screen
  var searchController = TextEditingController();
  var enterCodeController = TextEditingController();

  //index of NavigationBar
  int x = 0 ;

  //list of BottomNavigationBar
  List<Widget> DoctorScreens =
  [
    HomeDoctorScreen(),
    AccountDoctorScreen(),
  ];

  List<Widget> PatientScreens =
  [
    HomePatientScreen(),
    AccountPatientScreen(),
  ];



  //list of title appBar()
  List<String> Titles =
  [
    "HomeDoctor",
    "Rscreen",

  ];


  //function of ChangedBottomNavigationBar
  void changedBottomBar(int index){
    x = index ;
    emit(changebottomNavbar());
  }


  //valuable of ChangedDarkMode
   bool? isDark = isdark ;

  //function of ChangedDarkMode
   void changedMode()  {
    print(isDark);
    if( isDark == true) {
      isDark = false;
      emit(NotDarkMode());
    }else{
      isDark = true;
       emit(DarkMode());
    }

    print(isDark);
    emit(changedDarkMode());
  }


//
//   //object Doctor data
//   DoctorDataModel? loginDoctorModel ;
//
//
//   //function of getDataFromDoctor
//   void getData_Doctor()  {
//
//     emit(Data_Doctor_LoadingState());
//
//     DioHelper.postData(path: GETALLDATADOCTOR  ).then((value) {
//
//       loginDoctorModel = DoctorDataModel.fromJson(value.data);
//
//       print(" Data El Doctor Gat ");
//       emit(Data_Doctor_SuccessState());
//
//     }).catchError((onError){
//       print(onError.toString());
//       emit(Data_Doctor_ErrorState());
//     });
//   }
//
// //object patient data
//   PatientDataModel? patientDataModel ;
//
//
//   //function of getDataFromPatient
//   void getData_Patient()  {
//
//     emit(Data_Patient_LoadingState());
//
//     DioHelper.postData(path: GETALLDATAPATIENT  ).then((value) {
//
//       patientDataModel = PatientDataModel.fromJson(value.data);
//
//       print(" Data El patient Gat ");
//       emit(Data_Patient_SuccessState());
//
//     }).catchError((onError){
//       print(onError.toString());
//       emit(Data_Patient_ErrorState());
//     });
//   }
//
//
//
//
//   PatientModelID? patientModelFormId ;
//
//
//   void getPatientFormId({
//
//         required String? id ,}) {
//
//     emit(Data_PatientFromID_LoadingState());
//     DioHelper.getData(
//          urlMethod: "$GETALLDATAPATIENT$id",
//       ).then((value)  {
//
//       patientModelFormId = PatientModelID.fromJson(value.data);
//
//       emit(Data_PatientFromID_SuccessState());
//     }).catchError((onError){
//
//       print(onError.toString());
//
//       emit(Data_PatientFromID_ErrorState());
//       print("errrrrrrrrror server or net Data_PatientFromID_ErrorState ");
//     });
//   }
//
//
//
//

/*Patient*/
  //
  //
  // // function of getDataFromPatient
  // void getData_Patient(id)  {
  //
  //   emit(Data_PatientFromID_LoadingState());
  //
  //   DioHelper.getData( urlMethod: "$GETALLDATAPATIENTFROMID$id"  ).then((value) {
  //
  //     patientDataModel = PatientDataModel.fromJson(value.data);
  //
  //     print(" Data El patient Gat tany ya 3alee ");
  //     emit(Data_PatientFromID_SuccessState());
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
  //     emit(Data_PatientFromID_ErrorState());
  //   });
  // }
/*doctor*/
  //
  // void getData_Doctor(id){
  //
  //   emit(Data_DoctorFromID_LoadingState());
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
  //     emit(Data_DoctorFromID_SuccessState());
  //
  //   }).catchError((onError){
  //     print(onError.toString());
  //     emit(Data_DoctorFromID_ErrorState());
  //   });
  // }
  //
  //








  nana(context ,Widget){

    navigateTo(context, Widget) ;
    emit(EditState());
 }



















//function of getDataFrom Mashro3 Tany

// void getHomeData()  {
  //
  //
  //    emit(homeDataLoadingState());
  //
  //     DioHelper.getData(urlMethod: HOME ,token: token ).then((value) {
  //
  //       homeModel = HomeModel.fromJson(value.data);
  //       print("el Data gaaat");
  //     emit(homeDataSuccessState());
  //
  //   }).catchError((onError){
  //     print(onError.toString());
  //     emit(homeDataErrorState());
  //   });
  // }


}