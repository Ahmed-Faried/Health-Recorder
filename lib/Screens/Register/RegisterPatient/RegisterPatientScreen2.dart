import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';
import 'dart:io';

class RegisterPatientScreen2 extends StatelessWidget {
  RegisterPatientScreen2({Key? key}) : super(key: key);

  var formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
      listener: (BuildContext context, state) {

      },
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: Colors.white70,
          body: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                color: Colors.white,
                alignment: Alignment.bottomLeft,
                child: const Image(
                  image: AssetImage('assets/bot-L.png'),
                  alignment: Alignment.bottomLeft,
                  width: 200,
                  height: 350,
                  fit: BoxFit.contain,
                ),
              ), // Image bot-L.png
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
                key: formKey1,
                child: Padding(
                  padding: const EdgeInsets.all(18.0), //Padding all Screen
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 45,
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
                          Column(
                            children: [
                              // SizedBox(height: height*0.01,),
                              //if image not null show the image
                              //if image null show text
                              Patient_RegisterCubit.get(context).image != null
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: 86.0,
                                  height: 86.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image(
                                      //to show image, you type like this.
                                      image: FileImage(File(Patient_RegisterCubit.get(context).image!.path)),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height: 300,
                                    ),
                                  ),
                                ),
                              )
                                  : Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:HexColor("E2EFEE"),
                                ),
                                width: 86.0,
                                height: 86.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () {
                                  Patient_RegisterCubit.get(context).myAlert(context);
                                },
                                child: Text(
                                  'Upload profile picture',
                                  style: TextStyle(
                                    color: HexColor("03989E"),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            height: 70,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: PhysicalModel(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    elevation: 2.0,
                                    shadowColor: Colors.grey,
                                    child: TextFormField(
                                      controller:  Patient_RegisterCubit.get(context).firstNamePatientController,
                                      keyboardType: TextInputType.text,
                                      onTap: () {},
                                      onChanged: (vaule) {},
                                      validator: (vaule) {
                                        if (vaule!.isEmpty) {
                                          toastShow(
                                              msg: 'first Name isEmpty',
                                              state: toastStates.WARNING);
                                          return "*" ;
                                        }
                                        return null;
                                      },
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        labelText: "First Name",
                                        labelStyle: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: PhysicalModel(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    elevation: 2.0,
                                    shadowColor: Colors.grey,
                                    child: TextFormField(
                                      controller: Patient_RegisterCubit.get(context).lastNamePatientController,
                                      keyboardType: TextInputType.text,
                                      onTap: () {},
                                      onChanged: (vaule) {},
                                      validator: (vaule) {
                                        if (vaule!.isEmpty) {
                                          toastShow(
                                              msg: 'Last Name isEmpty',
                                              state: toastStates.WARNING);
                                          return "*" ;
                                        }
                                      },
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FieldFromRegistr(
                            controller: Patient_RegisterCubit.get(context).emailPatientController,
                            type: TextInputType.emailAddress,
                            onSubmit: () {},
                            onChanged: () {},
                            onTap: () {},
                            suffixPressed: () {},
                            validator: (vaule) {
                              if (vaule!.isEmpty) {
                                toastShow(
                                    msg: 'email isEmpty',
                                    state: toastStates.WARNING);
                                return "*" ;
                              }
                            },
                            label: 'E-mail',
                            prefix: Icons.email,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FieldFromRegistr(
                            controller: Patient_RegisterCubit.get(context).passwordPatientController,
                            type: TextInputType.visiblePassword,
                            onSubmit: () {},
                            onChanged: () {},
                            onTap: () {},
                            suffixPressed: () {},
                            validator: (vaule) {
                              if (vaule!.isEmpty) {
                                toastShow(
                                    msg: 'password isEmpty',
                                    state: toastStates.WARNING);
                                return "*" ;
                              }
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline_rounded,
                            suffix: IconButton(
                              // hoverColor: Colors.white,
                              // focusColor: Colors.white,
                              // highlightColor: Colors.white,
                              // splashColor: Colors.white,
                              padding: EdgeInsets.only(right: 10),
                              onPressed: () {
                                Patient_RegisterCubit.get(context)
                                    .changePasswordRegister();
                              },
                              icon: Icon(Patient_RegisterCubit.get(context).showPassword),
                            ),
                            obscureText:
                            Patient_RegisterCubit.get(context).isPassword,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FieldFromRegistr(
                            controller: Patient_RegisterCubit.get(context).numberPatientController,
                            type: TextInputType.phone,
                            onSubmit: () {},
                            onChanged: () {},
                            onTap: () {},
                            suffixPressed: () {},
                            validator: (vaule) {
                              if (vaule!.isEmpty) {
                                toastShow(
                                    msg: 'phone isEmpty',
                                    state: toastStates.WARNING);
                                return "*" ;
                              }
                            },
                            label: 'Phone',
                            prefix: Icons.phone_android_rounded,
                          ),
                          const SizedBox(
                            height: 20,
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
                                      if (formKey1.currentState!.validate()){
                                        Patient_RegisterCubit.get(context).controller.nextPage(
                                            duration: const Duration(
                                          milliseconds: 500,
                                        ), curve: Curves.decelerate);
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
    );
  }
}

Widget BloodRadioList(
        {context, required BloodTypeValue, required String title}) =>
    Container(
      width: 90,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellowAccent, // لون الخلفية
        shape: BoxShape.rectangle, // نوع الشكل
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile(
        title: Text(title),
        value: BloodTypeValue,
        groupValue: Patient_RegisterCubit.get(context).containerValues,
        onChanged: (value) {
          Patient_RegisterCubit.get(context).changeBloodType(value);
        },
        dense: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
