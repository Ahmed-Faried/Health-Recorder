import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';

import '../../BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';


class RegisterPatientScreen5 extends StatelessWidget {
  RegisterPatientScreen5({Key? key}) : super(key: key);

  var formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;

    return BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
      listener: (context ,state ) {},

      builder: (context ,state ) { return Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: const Image(
                image: AssetImage('assets/bot-L1.png'),
                alignment: Alignment.bottomLeft,
                width: 100,
                height: 300,
                fit: BoxFit.contain,
              ),
            ), // Image bot-L.png
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: const Image(
                image: AssetImage('assets/top.png'),
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.colorDodge,
              ),
            ), // Image top.png
            Form(
              key: formKey4,
              child: Padding(
                padding: const EdgeInsets.all(18.0), //Padding all Screen
                child: SingleChildScrollView(
                  child: Column(
                    children:
                    [
                       SizedBox(
                        height: height*.0825,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Create account",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "surgical history ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    wordSpacing: 1,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                       SizedBox(
                        height: height*.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        [
                          Text(" Have you had surgery previously ? " , style: TextStyle( fontSize: 16 ),),

                        ],
                      ),
                       SizedBox(
                        height: height*.015,
                      ),
                      FieldFromRegistr(
                        controller: Patient_RegisterCubit.get(context).surgeryController,
                        type: TextInputType.text,
                        onSubmit: () {},
                        onChanged: () {},
                        onTap: () {},
                        suffixPressed: () {},
                        validator: (vaule) {
                          if (vaule!.isEmpty) {
                            toastShow(
                                msg: 'Regular medicine isEmpty',
                                state: toastStates.WARNING);
                            return "*" ;
                          }
                        },
                        label: 'Surgery type',
                        prefix: Icons.bar_chart_sharp ,
                      ),
                       SizedBox(
                        height: height*.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        [
                          Text(" Date of surgery" , style: TextStyle( fontSize: 16 ),),

                        ],
                      ),

                      // TextFormField(
                      //   decoration:  InputDecoration(
                      //
                      //     label: Text(' Date'),
                      //     prefix: Padding(
                      //       padding: EdgeInsets.only(right: 8.0  ),
                      //       child: Icon(Icons.date_range),
                      //     ),
                      //   ),
                      //   controller: dateController,
                      //   keyboardType: TextInputType.none,
                      //   onTap: () {
                      //     showDatePicker(
                      //       context: context,
                      //       initialDate: DateTime.now(),
                      //       firstDate:DateTime(1923),
                      //       lastDate: DateTime(2024),
                      //     ).then((value) {
                      //       dateController.text = DateFormat('MMM d, y').format(value!);
                      //       if (kDebugMode) {
                      //         print(dateController.text =
                      //             DateFormat.yMMMd().format(value));
                      //       }
                      //     });
                      //   },
                      //   style: TextStyle(color: Colors.black),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Time Must Not be Null';
                      //     }
                      //     return null;
                      //   },
                      // ),
                       SizedBox(
                        height: height*.015,
                      ),
                      InkWell(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 60,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white ,
                              boxShadow:  [
                            BoxShadow(
                            color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(2, 2),
                            ),
                            ],
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric( horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${Patient_RegisterCubit.get(context).Date}"),
                                  Icon(Icons.arrow_drop_down_sharp)
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:DateTime(1923),
                            lastDate: DateTime(2024),
                          ).then((value) {
                            Patient_RegisterCubit.get(context).DateChange(value);

                          });
                        },
                      ),
                       SizedBox(
                        height: height*.345,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Container(
                              width: 85,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: HexColor("#68DED7"),
                              ),
                              child:Center(child:  Text("Skip" ,style: TextStyle(color: Colors.white ,fontSize: 13),)) ,
                            ),
                            onTap: () {
                              navigateTo(context, HomePagePatientScreen());

                            },
                          ),
                          Spacer(),
                          ConditionalBuilder(
                            condition: true ,
                            builder: (BuildContext context) {
                              return InkWell(
                                child: Container(
                                  width: 65,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: HexColor("#68DED7"),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                 if (formKey4.currentState!.validate()) {
      Patient_RegisterCubit
          .get(context)
          .controller
          .nextPage(
          duration: const Duration(
            milliseconds: 1500,
          ),
          curve: Curves.fastLinearToSlowEaseIn);
    }
                                },
                              );
                            },
                            fallback: (BuildContext context) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ), // Ui Screen

          ],
        ),
      );},

    );

  }
}
