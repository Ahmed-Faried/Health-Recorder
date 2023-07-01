import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/HomePageDoctor/HomePageDoctorScreen.dart';

import '../../../Components/components.dart';
import '../../../Network/local/shared_preferences.dart';
import 'Cubit_DR_Register/DR_RegisterCubit.dart';
import 'Cubit_DR_Register/DR_RegisterStates.dart';

class RegisterDrScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  RegisterDrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DR_Cubit_Register(),
      child: BlocConsumer<DR_Cubit_Register, RegisterDR_States>(
        listener: (BuildContext context, Object? state) {
          if(state is DoctorRegisterSuccessState ){
            if(state.doctorDataModel.status  == "success"){

              toastShow(
                  msg: "تم تسجيل الدخول بنجاح",
                  state: toastStates.SUCCESS
              );


              CacheHelper.saveData(
                  key:'department',
                  value: state.doctorDataModel.data?.doctor.department
              );
              CacheHelper.saveData(
                  key:'token',
                  value: state.doctorDataModel.token
              );
              CacheHelper.saveData(
                  key:'idDoctor',
                  value: state.doctorDataModel.data?.doctor.id
              ).then((value) {
                navigateAndFinish(context, HomePageDoctorScreen());

              });

            }



          }
          if (state is DoctorRegisterErrorState){
            toastShow(
                msg: state.error,
                state: toastStates.ERROR);

          }
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
                  height: 100,
                  child: const Image(
                    image: AssetImage('assets/top.png'),
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.colorDodge,
                  ),
                ), // Image top.png
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0), //Padding all Screen
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 65,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                            ), // Text Hello
                            const SizedBox(
                              height: 20,
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
                                        controller: DR_Cubit_Register.get(context)
                                            .firstNameDoctorController,
                                        keyboardType: TextInputType.text,
                                        onTap: () {},
                                        onChanged: (vaule) {},
                                        validator: (vaule) {
                                          if (vaule!.isEmpty) {
                                            toastShow(
                                                msg: 'first Name isEmpty',
                                                state: toastStates.WARNING);
                                            return "*";

                                          }
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
                                        controller: DR_Cubit_Register.get(context)
                                            .lastNameDoctorController,
                                        keyboardType: TextInputType.text,
                                        onTap: () {},
                                        onChanged: (vaule) {},
                                        validator: (vaule) {
                                          if (vaule!.isEmpty) {
                                            toastShow(
                                                msg: 'Last Name isEmpty',
                                                state: toastStates.WARNING);
                                            return "*";
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
                              height: 20,
                            ),
                            FieldFromRegistr(
                              controller:
                              DR_Cubit_Register.get(context).passwordDoctorController,
                              type: TextInputType.visiblePassword,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'Password isEmpty',
                                      state: toastStates.WARNING);
                                  return "*";

                                }
                              },
                              label: 'Password',
                              prefix: Icons.lock_outline_rounded,
                              suffix: IconButton(
                                onPressed: () {
                                  DR_Cubit_Register.get(context)
                                      .changePasswordRegister();
                                },
                                icon:
                                    Icon(DR_Cubit_Register.get(context).showPassword),
                              ),
                              obscureText: DR_Cubit_Register.get(context).isPassword,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FieldFromRegistr(
                              controller:
                              DR_Cubit_Register.get(context).emailDoctorController,
                              type: TextInputType.emailAddress,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'E-mail isEmpty',
                                      state: toastStates.WARNING);
                                }
                              },
                              label: 'E-mail',
                              prefix: Icons.email,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FieldFromRegistr(
                              controller:
                              DR_Cubit_Register.get(context).departDoctorController,
                              type: TextInputType.text,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'address isEmpty',
                                      state: toastStates.WARNING);
                                }
                              },
                              label: 'Depart',
                              prefix: Icons.portrait_outlined,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FieldFromRegistr(
                              controller:
                              DR_Cubit_Register.get(context).addressDoctorController,
                              type: TextInputType.streetAddress,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'address isEmpty',
                                      state: toastStates.WARNING);
                                }
                              },
                              label: 'Address',
                              prefix: Icons.location_on_outlined,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FieldFromRegistr(
                              controller:
                              DR_Cubit_Register.get(context).numberDoctorController,
                              type: TextInputType.phone,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'Phone Number isEmpty',
                                      state: toastStates.WARNING);
                                }
                              },
                              label: 'Phone',
                              prefix: Icons.phone_android_rounded,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: DR_Cubit_Register.get(context).checkBoxValue,
                                  onChanged: (value) {
                                    DR_Cubit_Register.get(context)
                                        .changeCheckBox(value);
                                  },
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(
                                    HexColor("#44B5AE"),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.greenAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                const Text(
                                  "I accept the terms and privacy policy",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                              ],
                            ), // Text Don't have an account? and Text Create
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Center(
                                  child: Text(
                                    "Sign in ",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                ConditionalBuilder(
                                  condition: state is! DoctorRegisterLoadingState,
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      child: Container(
                                        width: 65,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: DR_Cubit_Register.get(context)
                                                  .checkBoxValue
                                              ? HexColor("#44B5AE")
                                              : HexColor("#000"),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_forward_outlined,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {

                                          DR_Cubit_Register.get(context).DoctorRegister(

                                                  firstName:
                                                  DR_Cubit_Register.get(context).firstNameDoctorController.text,
                                                  lastName:
                                                  DR_Cubit_Register.get(context)
                                                          .lastNameDoctorController
                                                          .text,
                                                  password:
                                                  DR_Cubit_Register.get(context)
                                                          .passwordDoctorController
                                                          .text,
                                                  email:
                                                  DR_Cubit_Register.get(context)
                                                          .emailDoctorController
                                                          .text,
                                                  depart:
                                                  DR_Cubit_Register.get(context)
                                                          .departDoctorController
                                                          .text,
                                                  address:
                                                  DR_Cubit_Register.get(context)
                                                          .addressDoctorController
                                                          .text,
                                                  number:
                                                  DR_Cubit_Register.get(context)
                                                          .numberDoctorController
                                                          .text,
                                          );





                                        } else {

                                            toastShow(
                                              msg: "no Filed empty",
                                              state: toastStates.ERROR);
                                        }
                                      },

                                    );
                                  },
                                  fallback: (BuildContext context) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  },
                                )
                              ],
                            ), // Sign in and Icon Skip
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
      ),
    );
  }
}
