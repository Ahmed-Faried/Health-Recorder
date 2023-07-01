


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/moudel/LoginModel/PatientDataMoudleing.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../../../Network/Endpoint/EndPoint.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../Network/remote/dioHelper.dart';
import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import 'ProfileStates.dart';
import 'dart:io';

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





 upData_Image_Doctor({
    required File? Image,


  }
      ) async {
       var    id = CacheHelper.getData(key: "idDoctor");
    emit(DoctorUpdateLoadingState());

       FormData formData = FormData.fromMap({
         'image': await MultipartFile.fromFile(image!.path),
       });

    DioHelper.update( path: "$Update_Doctor_Image$id" ,

        data: formData ,


    ).then((value) {

      doctorDataModel = DoctorDataModel.fromJson(value.data);

        CacheHelper.saveData(key: 'idDoctor', value: doctorDataModel?.data?.doctor.id);

      toastShow(msg: "Update Image Done", state: toastStates.SUCCESS);
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
      print(onError.response?.data);

      emit(DoctorUpdateErrorState());
    });
  }



  final ImagePicker picker = ImagePicker();



  File? image ;


  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    image = File(img!.path);
    upData_Image_Doctor(Image: image);
    emit(ImageUpdateDoctor());

  }



  File? imageP ;


  //we can upload image from camera or from gallery based on parameter
  Future getImageP(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    imageP = File(img!.path);
    upData_Image_patient(imagePatient: imageP);
    emit(ImageUpdateP());

  }




  upData_Image_patient({
    required File? imagePatient,
  }
      ) async {

    var    id = CacheHelper.getData(key: "id");

    emit(PatientUpdateLoadingState());

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imagePatient!.path),
    });

    DioHelper.update( path: "$Update_Patient_Image$id" ,

      data: formData ,


    ).then((value) {

      patientDataModel = PatientDataModel.fromJson(value.data);


      toastShow(msg: "Update Image Done", state: toastStates.SUCCESS);

      emit(PatientUpdateSuccessState());


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
      print(onError.response?.data);

      emit(PatientUpdateErrorState());
    });
  }


  // Future<void> uploadImage(File imageFile) async {
  //   final url = 'https://example.com/upload_image';
  //   final token = CacheHelper.getString(key: 'token') ?? '';
  //   final request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.headers['Authorization'] = 'Bearer $token';
  //   request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
  //
  //   final response = await http.Response.fromStream(await request.send());
  //   if (response.statusCode == 200) {
  //     final jsonResponse = json.decode(response.body);
  //     // handle the response
  //   } else {
  //     throw Exception('Failed to upload image');
  //   }
  // }

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
                      getImage(ImageSource.gallery);

                      Navigator.pop(context);
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
                      getImage(ImageSource.camera);
                      Navigator.pop(context);

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
  void myAlertP(context) {
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
                      getImageP(ImageSource.gallery);

                      Navigator.pop(context);
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
                      getImageP(ImageSource.camera);
                      Navigator.pop(context);

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






}