import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/HomePageDoctor/HomePageDoctorScreen.dart';
import 'package:shop_app/Screens/BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'package:shop_app/Screens/Edit%20Profile/ProfileCubit/ProfileCubit.dart';
import 'package:shop_app/Screens/Register/RegisterCubit/RegisterCubit.dart';
import 'package:shop_app/Screens/Register/RegisterPatient/RegisterPatientScreen2.dart';
import 'Components/const.dart';
import 'Network/local/shared_preferences.dart';
import 'Network/remote/dioHelper.dart';
import 'Screens/Login/Cubit/CubitLoginScreen.dart';
import 'Screens/Login/LoginDoctorScreen.dart';
import 'Screens/LoginAndRegister/LoginAndRegister.dart';

import 'Screens/Register/RegisterDr/RegisterDrScreen.dart';
import 'bloc/bloc_observer.dart';
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer = MyBlocObserver();
   DioHelper.init();
   await CacheHelper.init();

   Widget widget ;

   var onboarding  = CacheHelper.getData(key:'onBoarding') ;
       token       = CacheHelper.getData(key:'token') ;
       idPatient   = CacheHelper.getData(key:'id') ;
       department  = CacheHelper.getData(key:'department') ;
       isdark      = CacheHelper.getData(key:'isDark') ;
       idDoctor    = CacheHelper.getData(key:'idDoctor') ;


  print("ana el print $isdark");

  print("ana el print $onboarding");

  print("ana el print $token");

  print("ana el print $idPatient");

  print("ana el print $department");

  print("ana el print $idDoctor");


  if(onboarding != null ){

    if(token == null){
      widget = LoginAndRegister();
    }

    else{
      if(department == null ){
        widget = HomePagePatientScreen();
      }else{
        widget = HomePageDoctorScreen();
      }
    }
  }

  else{

    widget = onBoarding();
  }

  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {

    MyApp( {super.key,  required this.startWidget});

   var startWidget ;

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));

    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(create: (BuildContext context) => ProfileCubit()),
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(create: (BuildContext context) => LoginScreenCubit()..getData_Patient(idPatient)..getData_Doctor(idDoctor)),
      ],
      child: MaterialApp(


        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme:     ThemeData(


          scaffoldBackgroundColor: Colors.white,
          useMaterial3 : true,
          appBarTheme:   const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              color: Colors.white,
              elevation: 0.0,
              centerTitle: false,
              titleSpacing: 18,
              shadowColor: Colors.deepOrange,
              scrolledUnderElevation: 0,
              iconTheme: IconThemeData(
                  color: Colors.deepOrange
              )

          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(

              foregroundColor: Colors.red,

              elevation: 0
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor:Colors.red,
            unselectedItemColor:Colors.pink,
          ),
          scrollbarTheme: ScrollbarThemeData(),
          textTheme:  const TextTheme(
            bodyLarge:TextStyle(fontSize: 16,color: Colors.black ),//title Articles
            titleMedium:TextStyle(fontSize: 14,color: Colors.grey ),// discretion Articles
            titleLarge: TextStyle(fontSize: 18 ,color: Colors.black ),//title AppBar
          ),
        ),
        darkTheme: ThemeData(

          scaffoldBackgroundColor: Colors.white,
          useMaterial3 : true,
          primarySwatch: Colors.deepOrange,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              centerTitle : true,
              elevation: 0,
              titleSpacing: 18,
              shadowColor: Colors.grey,
              scrolledUnderElevation: 0,
              iconTheme: IconThemeData(
                  color: Colors.deepOrange
              )
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.red,
              elevation: 0
          ),
          bottomNavigationBarTheme:  BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              elevation: 5,
              selectedItemColor: HexColor("5DCDC6"),
              unselectedItemColor: Colors.grey
          ),
          scrollbarTheme: ScrollbarThemeData(),
          textTheme:  const TextTheme(
            bodyLarge:TextStyle(fontSize: 16,color: Colors.white ),//title Articles
            titleMedium:TextStyle(fontSize: 14,color: Colors.white ),// discretion Articles
            titleLarge: TextStyle(fontSize: 18 ,color: Colors.white ),//title AppBar
          ),
        ),
        themeMode: ThemeMode.dark,
        home: startWidget ,

      ),
    );
  }
}

