import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Bloc/HomeStates.dart';

class HomePageDoctorScreen extends StatelessWidget {

  HomePageDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
               body: HomeCubit.get(context).DoctorScreens[HomeCubit.get(context).x],
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
      ),
        );
     },
    );
  }
}
