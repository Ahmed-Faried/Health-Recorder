import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';

class RegisterPatientScreen extends StatelessWidget {
  const RegisterPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => Patient_RegisterCubit() ,
      child: BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return  Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                     // physics: NeverScrollableScrollPhysics(),/ مهم علشان الاسكرول
                      // pageSnapping: false,
                      // allowImplicitScrolling: true,
                      controller: Patient_RegisterCubit.get(context).controller,
                      itemBuilder:  (context , index) => Patient_RegisterCubit.get(context).RegisterScreens[index],
                      itemCount:Patient_RegisterCubit.get(context).RegisterScreens.length,
                      onPageChanged: (index) {
                        Patient_RegisterCubit.get(context).isLastPage(index);
                      }
                    ),
                  ),
                ],
              ) ,
            );
          },

      ),
    );
  }
}
