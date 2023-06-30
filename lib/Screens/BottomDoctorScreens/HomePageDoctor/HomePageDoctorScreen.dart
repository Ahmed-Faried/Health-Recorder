import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Bloc/HomeStates.dart';

class HomePageDoctorScreen extends StatelessWidget {

  HomePageDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark//or set color with: Color(0xFF0000FF)
    ));

    return  BlocConsumer<HomeCubit , HomeStates>(
      listener:(context ,state){} ,
      builder: (context ,state){
        return Scaffold(

          backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text(ShopAppCubit.get(context).Titles[ShopAppCubit.get(context).x], style: TextStyle(
        //     color: Colors.white
        //   ),),
        // ),
             body: Padding(
               padding: const EdgeInsets.only(top: 19.0),
               child: HomeCubit.get(context).DoctorScreens[HomeCubit.get(context).x],
             ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: HomeCubit.get(context).x,
            onTap: (index) {
              HomeCubit.get(context).changedBottomBar(index);
            },
            items:  const
            [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.person),   label:  'Account'),
            ]

        ),
      );
     },
    );
  }
}
