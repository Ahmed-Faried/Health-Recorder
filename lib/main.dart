
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/HomePageDoctor/HomePageDoctorScreen.dart';
import 'package:shop_app/Screens/BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'package:shop_app/Screens/Edit%20Profile/ProfileCubit/ProfileCubit.dart';
import 'Components/const.dart';
import 'Network/local/shared_preferences.dart';
import 'Network/remote/dioHelper.dart';
import 'OnBoardingScreen/OnBoardingScreen.dart';
import 'Screens/ForgetPassword/Patient/ForgetPasswordPatient.dart';
import 'Screens/Login/Cubit/CubitLoginScreen.dart';
import 'Screens/LoginAndRegister/LoginAndRegister.dart';
import 'Screens/Register/RegisterPatient/Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Screens/Register/RegisterPatient/RegisterPatientScreen1.dart';
import 'Screens/Register/RegisterPatient/RegisterPatientScreen4.dart';
import 'Screens/TEST/test.dart';
import 'Screens/X-ray Patient/X-rayScreen.dart';
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
       National_ID = CacheHelper.getData(key:'National_ID') ;
       imagePatient = CacheHelper.getData(key:'imagePatient') ;
       imageDoctor = CacheHelper.getData(key:'imageDoctor') ;




  print("isdark el print $isdark");

  print("National_ID el print $National_ID");

  print("onBoarding el print $onboarding");

  print("token el print $token");

  print("idPatient el print $idPatient");

  print("department el print $department");

  print("idDoctor el print $idDoctor");


  if(onboarding != null ){

    if(token == null){
      widget = LoginAndRegister();
    } else{
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
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark
    // ));

    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => HomeCubit()),//..getData_Doctor(idDoctor)
        BlocProvider(create: (BuildContext context) => ProfileCubit()),
        // BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(create: (BuildContext context) => LoginScreenCubit()),
        // BlocProvider(create: (BuildContext context) => Patient_RegisterCubit())
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily:'MontaguSlab',
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
        darkTheme: ThemeData(


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
        themeMode: ThemeMode.light,
        home:  AnimatedSplashScreen(
          splash: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset('assets/logo3.png' ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("H" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("37FFF2")),),
                        Text("e" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("38F9ED")),),
                        Text("a" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("38F9EC")),),
                        Text("l" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("39F5E9")),),
                        Text("t" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("3CE2D8")),),
                        Text("h" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("3CE2D8")),),
                        Text(" R" ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("3DDED3")),),
                        Text("e" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("3ED6CC")),),
                        Text("c" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("3ED6CD")),),
                        Text("o" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("41C6BD")),),
                        Text("r" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("42BFB7")),),
                        Text("d" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("44B6AF")),),
                        Text("e" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("44B5AE")),),
                        Text("r" ,style:  TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: HexColor("44B5AE")),),
                      ],
                    ),
                    Container(
                      width: 215,
                      height: 1,
                      color: HexColor("#3AEDE2"),
                    ),
                    Text("YOUR HEALTH IS OUR MISSION", style:  TextStyle(fontSize: 13 ,color: Colors.black)),
                    Container(
                      width: 215,
                      height: 1,
                      color: HexColor("#3AEDE2"),
                    ),

                  ],
                )
              ],
            ),
          ),
          nextScreen: X_rayPatient(),//ForgetPasswordPatient(),//startWidget,
          splashTransition: SplashTransition.slideTransition,
          backgroundColor:  Colors.white, //HexColor('5DCDC6'),
          splashIconSize: 100,
            duration: 10000,
        ) // startWidget ,

      ),
    );
  }
}

