import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';

class RegisterPatientScreen3 extends StatelessWidget {
  RegisterPatientScreen3({Key? key}) : super(key: key);

  var formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white70,
          body: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              // Container(
              //   color: Colors.white,
              //   alignment: Alignment.bottomLeft,
              //   child: const Image(
              //     image: AssetImage('assets/bot-L.png'),
              //     alignment: Alignment.bottomLeft,
              //     width: 50,
              //     height: 100,
              //     fit: BoxFit.contain,
              //   ),
              // ), // Image bot-L.png
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: const Image(
                  image: AssetImage('assets/top.png'),
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.colorDodge,
                ),
              ), // Image top.png
              Form(
                key: formKey2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0), //Padding all Screen
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 55,
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
                                      "Personal information",
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

                          const SizedBox(
                            height: 10,
                          ),
                          FieldFromRegistr(
                            controller: Patient_RegisterCubit.get(context)
                                .nationalIDPatientController,
                            type: TextInputType.phone,
                            onSubmit: () {},
                            onChanged: () {},
                            onTap: () {},
                            suffixPressed: () {},
                            validator: (vaule) {
                              if (vaule!.isEmpty) {
                                toastShow(
                                    msg: 'id isEmpty',
                                    state: toastStates.WARNING);
                                return "*";
                              }
                            },
                            label: 'National ID',
                            prefix: Icons.credit_card_outlined,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FieldFromRegistr(
                            controller: Patient_RegisterCubit.get(context)
                                .agePatientController,
                            type: TextInputType.number,
                            onSubmit: () {},
                            onChanged: () {},
                            onTap: () {},
                            suffixPressed: () {},
                            validator: (vaule) {
                              if (vaule!.isEmpty) {
                                toastShow(
                                    msg: 'age isEmpty',
                                    state: toastStates.WARNING);
                                return "*";
                              }
                            },
                            label: 'Age',
                            prefix: Icons.calendar_month,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Gender And Blood Type
                          // FieldFromRegistr(
                          //   controller: Patient_RegisterCubit.get(context)
                          //       .genderPatientController,
                          //   type: TextInputType.text,
                          //   onSubmit: () {},
                          //   onChanged: () {},
                          //   onTap: () {},
                          //   suffixPressed: () {},
                          //   validator: (vaule) {
                          //     if (vaule!.isEmpty) {
                          //       toastShow(
                          //           msg: 'gender isEmpty',
                          //           state: toastStates.WARNING);
                          //       return "*";
                          //     }
                          //   },
                          //   label: 'gender',
                          //   prefix: Icons.g_mobiledata_outlined,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // FieldFromRegistr(
                          //   controller: Patient_RegisterCubit.get(context)
                          //       .bloodTypePatientController,
                          //   type: TextInputType.text,
                          //   onSubmit: () {},
                          //   onChanged: () {},
                          //   onTap: () {},
                          //   suffixPressed: () {},
                          //   validator: (vaule) {
                          //     if (vaule!.isEmpty) {
                          //       toastShow(
                          //           msg: 'blood Type isEmpty',
                          //           state: toastStates.WARNING);
                          //       return "*";
                          //     }
                          //   },
                          //   label: 'blood Type',
                          //   prefix: Icons.bloodtype,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  Colors.grey[100],
                                  boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.shade100,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(2, 2),
                                    ),
                                  ],

                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Patient_RegisterCubit.get(context).changeGenderType(0);
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: 4, top: 4 ,bottom: 4 , right: 1),
                                          child: Container(
                                            height: 40,
                                            child: Center(child: Text("Male" , style: TextStyle(fontSize: 15),)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Patient_RegisterCubit.get(context).Gender == "mail" ? Colors.white :  Colors.grey[100],

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Patient_RegisterCubit.get(context).changeGenderType(1);
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.only(right:4, top:4 ,bottom: 4 , left: 1),
                                          child: Container(
                                            height: 40,
                                            child: Center(child: Text("Female", style: TextStyle(fontSize: 15))),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Patient_RegisterCubit.get(context).Gender == "femail" ? Colors.white :  Colors.grey[100],

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ) ,// Gender Male or Female
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bloodtype_sharp,
                                color: HexColor("#5DCDC6"),
                                size: 30,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Blood Type",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  wordSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 150,
                            child: GridView.count(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              children: List.generate(8, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Patient_RegisterCubit.get(context)
                                        .changeBloodType(index);
                                    print(Patient_RegisterCubit.get(context)
                                        .containerValues[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: Patient_RegisterCubit.get(context)
                                          .selectedContainerIndex ==
                                          index
                                          ? HexColor("#5DCDC6")
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow:  [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        Patient_RegisterCubit.get(context)
                                            .containerValues[index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Patient_RegisterCubit.get(context).changeBloodType(-1);
                            },
                            child: Container(
                              width: 192,
                              height: 30,
                              child: Center(child: Text("Don’t know" , style: TextStyle(fontSize: 15),)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Patient_RegisterCubit.get(context).selectedContainerIndex == -1
                                    ? HexColor("#5DCDC6")
                                    : Colors.white,
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Blood type 2 way
                          // Padding(
                          //   padding: EdgeInsets.only(left: 5),
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             Icons.bloodtype,
                          //             color: Colors.red,
                          //             size: 25,
                          //           ),
                          //           Text(
                          //             'Blood Type',
                          //             style: TextStyle(
                          //               fontSize: 16,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: 5),
                          //         child: Row(
                          //           children: [
                          //             TextButton(
                          //               onPressed: () {
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(0);
                          //                 //onPressed for button 1
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs == 0
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.grey[300],
                          //               ),
                          //               child: Text(
                          //                 'A+',
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 5,
                          //             ),
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(1);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs == 1
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'O+',
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 5,
                          //             ),
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(2);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs ==
                          //                             2
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'B+',
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 5,
                          //             ),
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(3);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs ==
                          //                             3
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'AB+',
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: 5),
                          //         child: Row(
                          //           children: [
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(4);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs ==
                          //                             4
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'A-',
                          //               ),
                          //             ),
                          //             SizedBox(width: 5),
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(5);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs == 5
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'O-',
                          //               ),
                          //             ),
                          //             SizedBox(width: 5),
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(6);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs == 6
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'B-',
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 5,
                          //             ),
                          //             TextButton(
                          //               onPressed: () {
                          //                 //onPressed for button 1
                          //                 Patient_RegisterCubit.get(context)
                          //                     .changeindexBloodType(7);
                          //               },
                          //               style: TextButton.styleFrom(
                          //                 foregroundColor: Colors.black,
                          //                 backgroundColor:
                          //                     Patient_RegisterCubit.get(context)
                          //                                 .indexs == 7
                          //                         ? HexColor("#5DCDC6")
                          //                         : Colors.white,
                          //               ),
                          //               child: Text(
                          //                 'AB-',
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 65,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: HexColor("#68DED7"),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  Patient_RegisterCubit.get(context)
                                      .controller
                                      .previousPage(
                                      duration: const Duration(
                                        milliseconds: 1500,
                                      ),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                              ),
                              Spacer(),
                              ConditionalBuilder(
                                condition:
                                state is! PatientRegisterLoadingState,
                                builder: (BuildContext context) {
                                  return InkWell(
                                    child: Container(
                                      width: 65,
                                      height: 35,
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
                                      if (formKey2.currentState!.validate()) {


                                            Patient_RegisterCubit.get(context).PatientRegister(
                                            fristName: Patient_RegisterCubit.get(context).firstNamePatientController.text,
                                            lastName: Patient_RegisterCubit.get(context).lastNamePatientController.text,
                                            bloodType: Patient_RegisterCubit.get(context).containerValues[Patient_RegisterCubit.get(context).selectedContainerIndex] ,
                                            gender: Patient_RegisterCubit.get(context).Gender,
                                            password: Patient_RegisterCubit.get(context).passwordPatientController.text,
                                            email: Patient_RegisterCubit.get(context).emailPatientController.text,
                                            number: Patient_RegisterCubit.get(context).numberPatientController.text,
                                            National_ID: Patient_RegisterCubit.get(context).nationalIDPatientController.text,
                                            age: Patient_RegisterCubit.get(context).agePatientController.text,
                                            context: context ,
                                          );


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
                ),
              ) // Ui Screen
            ],
          ),
        );
      },
      listener: (context, state) {

        if (state is PatientRegisterSuccessState) {
          if (state.patientDataModel.status == "success") {
            toastShow(msg: "تم التسجيل  بنجاح", state: toastStates.SUCCESS);

            Patient_RegisterCubit.get(context)
                .controller
                .nextPage(
                duration: const Duration(
                  milliseconds: 1500,
                ),
                curve: Curves.fastLinearToSlowEaseIn);

          }
        }
        if (state is PatientRegisterErrorState) {
          if (state.Errors != null) {
            toastShow(msg: "${state.Errors}", state: toastStates.ERROR);
          }
        }


      },
    );
  }
}
