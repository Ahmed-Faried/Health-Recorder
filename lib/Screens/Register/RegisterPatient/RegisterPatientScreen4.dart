import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Network/local/shared_preferences.dart';
import '../RegisterDr/RegisterDrScreen.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';


class Registr4 extends StatelessWidget {
  Registr4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: DropdownButton(
                    underline: Container() ,
                    icon: Icon(Icons.list,color: Colors.black,),
                    borderRadius: BorderRadius.circular(20),
                    hint: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          color: HexColor("#5DCEC8"),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Center(child: const Text('Register' , style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )))
                    ),
                    elevation: 8,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    menuMaxHeight: 130,

                    items:
                    [
                      DropdownMenuItem(
                        alignment:AlignmentDirectional.bottomCenter,
                        value: 'Page 1',
                        child:    TextButton(
                            onPressed:(){
                              CacheHelper.RemveData(key:'token') ;
                              CacheHelper.RemveData(key:'department') ;
                              CacheHelper.RemveData(key:'id') ;
                              CacheHelper.RemveData(key:'idDoctor') ;


                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(HexColor("#5DCEC8")),
                              elevation: MaterialStateProperty.all(2),
                              shadowColor: MaterialStateProperty.all(Colors.grey),
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' Doctor ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),),
                              ],
                            )),
                      ),
                      DropdownMenuItem(
                        value: 'Page 2',
                        child:  TextButton(
                            onPressed:(){
                              CacheHelper.RemveData(key:'token') ;
                              CacheHelper.RemveData(key:'department') ;
                              CacheHelper.RemveData(key:'id') ;
                              CacheHelper.RemveData(key:'idDoctor') ;


                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(HexColor("#5DCEC8")),
                              elevation: MaterialStateProperty.all(2),
                              shadowColor: MaterialStateProperty.all(Colors.grey),
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(' Patient ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),),
                              ],
                            )),
                      ),
                    ],
                    onChanged: (Object? value) {

                    },

                  ),
                ),
              ],
          ),
        );
      },
    );
  }
}
