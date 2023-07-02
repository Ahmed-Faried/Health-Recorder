import 'package:dio/dio.dart';
class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://eslamsaber8-healthrecorder.onrender.com/api/',
      //eslam talet  //https://nice-rose-yak-ring.cyclic.app/api/
      //eslam tany  //https://eslamsaber8-healthrecorder.onrender.com/api/
      //eslam      //https://joyous-cormorant.cyclic.app/api/
      //abdo       //https://student.valuxapps.com/api/
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String urlMethod,
  }) async {
    return await dio.get(
      urlMethod,
    );
  }

  static Future<Response> postData({
    required String path,
    dynamic data,
  }) async {
    return dio.post(path, data: data);
  }

  static Future<Response> update({
    required String path,
    dynamic data,
  }) async {
    return dio.patch(path, data: data);
  }

//   static Future<Response> getData ({
//
//     required String urlMethod,
//     String lang = 'en',
//     dynamic query ,
//     dynamic token ,
//
// }) async {
//
//     dio.options.headers ={
//       'Content-Type' : 'application/json' ,
//       'lang' : lang ,
//       'Authorization' : token??'',
//     };
//
//     return await dio.get(
//         urlMethod,
//         queryParameters: query
//     ) ;
//   }
//
//
//   static Future<Response> postData  ({
//     required String path,
//     required dynamic data ,
//     String lang = 'en',
//     dynamic query ,
//     dynamic token ,
//
// }) async {
//
//     dio.options.headers = {
//
//       'lang' : lang ,
//       'Content-Type' : 'application/json' ,
//       'Authorization' : token??'',
//     };
//
//     return dio.post(
//       path ,
//       data: data
//     ) ;
//
//   }
//
//
}

//api/v1/Equipments
// https://newsapi.org/v2/top-headlines?county=eg%&category=business&apikey=5cc91775b2d245af9622a59b109cbf6e
