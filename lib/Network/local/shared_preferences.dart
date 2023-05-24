import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static   SharedPreferences  prefs  = SharedPreferences as SharedPreferences ;

 static init() async{

    prefs  = await SharedPreferences.getInstance() ;
  }

   // static   Future<bool> putBoolean({
   //          required String key,
   //          required bool value
   //    }) async{
   //     return await prefs.setBool(key, value) ;
   //    }



  static  dynamic getData({
    required String key,
  }) {
    return prefs.get(key) ;
  }

  static  dynamic RemveData({
    required String key,
  }) {
    return prefs.remove(key) ;
  }



  static   Future<bool> saveData({
    required String key,
    required dynamic value
  }) async{
     if (value is String) return await prefs.setString(key, value) ;
     if (value is bool)   return await prefs.setBool(key, value) ;
     if (value is int)    return await prefs.setInt(key, value) ;
                          return await prefs.setDouble(key, value) ;

  }




}


