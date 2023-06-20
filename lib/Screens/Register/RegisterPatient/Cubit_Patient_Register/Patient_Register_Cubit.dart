import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Components/components.dart';
import '../../../../Components/const.dart';
import '../../../../Network/Endpoint/EndPoint.dart';
import '../../../../Network/remote/dioHelper.dart';
import '../../../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../../../LoginAndRegister/LoginAndRegister.dart';
import '../RegisterPatientScreen1.dart';
import '../RegisterPatientScreen2.dart';
import '../RegisterPatientScreen4.dart';
import 'Patient_Register_States.dart';
import '../RegisterPatientScreen3.dart';

class Patient_RegisterCubit extends Cubit<RegisterPatientStates> {
  Patient_RegisterCubit() : super(InitialPatientRegisterStates());

  static Patient_RegisterCubit get(context) {
    return BlocProvider.of(context);
  }


  List<Widget> RegisterScreens =
  [
    RegisterPatientScreen2(),
    Registr3(),
    Registr4(),


  ];
  var controller = PageController() ;

  bool isLast = false ;


  void submit( context ) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => LoginAndRegister()), (
        route) => false);
    emit(SubmitPatientRegister());
  }


  void isLastPage(index){

    if(index == RegisterScreens.length-1){

        isLast = true ;
     emit(IsLastPageTruePatientRegister());

    }else{

        isLast = false ;
        emit(IsLastPageFalsePatientRegister());


    };

  }

















  var firstNamePatientController = TextEditingController();
  var lastNamePatientController  = TextEditingController();
  var passwordPatientController  = TextEditingController();
  var emailPatientController     = TextEditingController();
  var agePatientController       = TextEditingController();
  var nationalIDPatientController = TextEditingController();
  var numberPatientController     = TextEditingController();
  var genderPatientController     = TextEditingController();
  var bloodTypePatientController  = TextEditingController();


  bool checkBoxValue = false;

  void changeCheckBox(value) {
    checkBoxValue = !checkBoxValue;
    emit(ChangeCheckBoxColorState());
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
  PatientRegister({
    required  fristName,
    required  lastName,
    required  age,
    required  bloodType,
    required  gender,
    required  password,
    required  email,
    required  number,
    required  National_ID,
  }) {
    emit(PatientRegisterLoadingState());

    DioHelper.postData(
        path: RegisterPatientApi,
        data: {
          'fristName': fristName,
          'lastName': lastName,
          'age': age,
          'bloodType': bloodType,
          'gender': gender,
          'email': email,
          'password': password,
          'phoneNumber': number,
          'National_ID': National_ID
        }
    ).then((value) async {
      patientDataModel = PatientDataModel.fromJson(value.data);

      print(patientDataModel?.status);


      emit(PatientRegisterSuccessState(patientDataModel!));
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
      toastShow(msg: "error leh msh 3aref ", state: toastStates.ERROR);
      emit(PatientRegisterErrorState(onError.response?.data['message'].toString()));
    });
  }
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



  XFile? image;



  final ImagePicker picker = ImagePicker();


  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

      image = img;
      emit(ImagePatientRegister());

  }

  void myAlert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('Please choose media \nto select', style: TextStyle(fontSize: 18), textAlign: TextAlign.center,)),
              ],
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(

                    style:  ElevatedButton.styleFrom(

                      backgroundColor: Colors.white,
                    ),
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          Text('From Gallery'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(Icons.camera),
                          Text('From Camera'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }









  bool isPassword = true ;
  IconData showPassword = Icons.visibility_off_rounded ;

  void changePasswordRegister(){
    isPassword =  ! isPassword ;
    showPassword = isPassword ? Icons.visibility_off_rounded : Icons.visibility ;

    emit(ChangePasswordIconRegister());
  }








  int selectedContainerIndex = -1;

  List<String> containerValues = ["A+","A-","B+","B-","AB+","AB-","O+","O-"];


  int indexs = -1;
  Color enableColor = Colors.red;
  Color disableColor = Colors.transparent;

  void changeBloodType(index){
    selectedContainerIndex = index ;
    emit(BloodTypeChangeState());
  }





  void changeindexBloodType(int x){
    indexs = x ;
    emit(BloodTypeIndexChangeState());
  }


  void printsss(){
    print(containerValues[selectedContainerIndex]);
  }

  void printsIndex(){
    print(containerValues[indexs]);
  }




  String Gender = "" ;
  List<String> GenderType = ["mail","femail"];
  Color mark = Colors.blue;
  Color notMark = Colors.transparent;

  void changeGenderType(Z){
    Gender = GenderType[Z];
    emit(ChangeGenderTypeState());
  }

















}