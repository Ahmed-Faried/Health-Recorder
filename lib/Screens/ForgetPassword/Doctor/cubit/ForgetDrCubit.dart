// //
// ForgetPassDoctor({
//   required firstName,
//
// }) {
//   emit(DoctorRegisterLoadingState());
//
//   DioHelper.postData(
//       path: RegisterDoctorApi,
//       data: {
//         'firstName': firstName,
//         'lastName': lastName,
//         // 'age': "99",
//         // 'gender': "mail",
//         'department': depart,
//         'email': email,
//         'address': address,
//         'password': password,
//         'phoneNumber': number,
//
//       }).then((value) async {
//
//     print(value.statusMessage);
//
//     doctorDataModel = DoctorDataModel.fromJson(value.data);
//
//     print(" Register Done Ya Zmely ");
//
//     print(doctorDataModel?.data?.doctor.id);
//
//     print(doctorDataModel?.status);
//
//
//
//     emit(DoctorRegisterSuccessState(doctorDataModel!));
//
//   }).catchError((onError) {
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
//
//     emit(DoctorRegisterErrorState(onError.response?.data['message'].toString()));
//
//     print(onError.toString());
//     print("eslam errrrrrrrrror eslam server eslam or net ");
//   });
// }
