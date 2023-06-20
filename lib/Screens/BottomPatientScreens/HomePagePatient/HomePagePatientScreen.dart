import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Bloc/HomeStates.dart';

class HomePagePatientScreen extends StatelessWidget {

  HomePagePatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark//or set color with: Color(0xFF0000FF)
    ));

    return  BlocConsumer<HomeCubit , HomeStates>(
      listener:(context ,state){} ,
      builder: (context ,state){
        return SafeArea(
          child: Scaffold(

            backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: Text(ShopAppCubit.get(context).Titles[ShopAppCubit.get(context).x], style: TextStyle(
          //     color: Colors.white
          //   ),),
          // ),
               body: HomeCubit.get(context).PatientScreens[HomeCubit.get(context).x],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: HomeCubit.get(context).x,
              onTap: (index) {
                HomeCubit.get(context).changedBottomBar(index);
              },
              items:  const
              [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner),   label:  'QrCode'),
                BottomNavigationBarItem(icon: Icon(Icons.person),   label:  'Account'),
              ]

          ),
      ),
        );
     },
    );
  }
}
