import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/ForgetPassword/Doctor/ForgetPasswordDoctor.dart';
import 'package:shop_app/Screens/Login/Cubit/CubitLoginScreen.dart';
import 'package:shop_app/Screens/Login/Cubit/StatesLoginScreen.dart';
import '../BottomDoctorScreens/HomePageDoctor/HomePageDoctorScreen.dart';
import '../Register/RegisterDr/RegisterDrScreen.dart';

class LoginDoctorScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  LoginDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    return BlocProvider(
      create: (context) =>LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginScreenStates>(
        listener: (BuildContext context, Object? state) {
          if (state is LoginDoctorScreenSuccessState) {
            if (state.doctorDataModel.status == "success") {
              toastShow(msg: "تم تسجيل الدخول بنجاح", state: toastStates.SUCCESS);

                // DoctorCubit().getData_Doctor(state.doctorDataModel.data?.doctor.id);

                navigateAndFinish(context, HomePageDoctorScreen());

            }

          }
          if(state is LoginDoctorScreenErrorState) {
            toastShow(msg: "خطا في تسجيل الدخول ", state: toastStates.ERROR);

            toastShow(msg: state.error, state: toastStates.ERROR);

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
                    padding: const EdgeInsets.all(24.0), //Padding all Screen
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                           SizedBox(
                            height: height*.1425,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  "Hello Doctor",
                                  style: TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ), // Text Hello
                           SizedBox(
                            height: height*.0375,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  "Sign in to your account ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                              )
                            ],
                          ), // Text Sign in to your account
                           SizedBox(
                            height: height*.0375,
                          ),
                          PhysicalModel(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            elevation: 3.0,
                            shadowColor: Colors.grey,
                            child: TextFormField(
                              controller: LoginScreenCubit.get(context)
                                  .userNameController,
                              keyboardType: TextInputType.text,
                              onTap: () {},
                              onChanged: (vaule) {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {

                                  return"*";
                                }
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Icon(Icons.account_circle_sharp),
                                ),
                                label: Text(
                                  ' Username',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ), //Username
                           SizedBox(
                            height: height*.055,
                          ),
                          PhysicalModel(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            elevation: 3.0,
                            shadowColor: Colors.grey,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginScreenCubit.get(context).DoctorLogin(
                                      email: LoginScreenCubit.get(context)
                                          .userNameController
                                          .text,
                                      password: LoginScreenCubit.get(context)
                                          .passwordController
                                          .text);
                                }
                              },
                              controller: LoginScreenCubit.get(context)
                                  .passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              onTap: () {},
                              onChanged: (vaule) {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  return"*";

                                }
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: IconButton(
                                    onPressed: () {
                                      LoginScreenCubit.get(context)
                                          .changePasswordRegister();
                                    },
                                    icon: Icon(LoginScreenCubit.get(context)
                                        .showPassword),
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Icon(Icons.lock_outline_rounded),
                                ),
                                label: Text(
                                  ' Password',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              obscureText:
                                  LoginScreenCubit.get(context).isPassword,
                            ),
                          ), // Password
                           SizedBox(
                            height: height*.050,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    navigateTo(
                                        context, ForgetPasswordDoctor());
                                  },
                                  hoverColor: Colors.blue,
                                  splashColor: Colors.blue,
                                  child: const Text(
                                    "Forget your password ?",
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ), // Text Forget Your Password
                           SizedBox(
                            height: height*.050,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Center(
                                child: const Text(
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
                                condition:
                                    state is! LoginDoctorScreenLoadingState,
                                builder: (BuildContext context) {
                                  return InkWell(
                                    child: Container(
                                      width: 65,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: HexColor("#44B5AE"),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        LoginScreenCubit.get(context).DoctorLogin(
                                            email: LoginScreenCubit.get(context)
                                                .userNameController
                                                .text,
                                            password:
                                                LoginScreenCubit.get(context)
                                                    .passwordController
                                                    .text);
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
                           SizedBox(
                            height: height*.09,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                              ),
                              InkWell(
                                child: const Text(
                                  "Create",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black54, // Optional
                                    decorationThickness: 2.0,
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,

                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                                onTap: () {
                                  navigateTo(context, RegisterDrScreen());
                                },
                              ),
                            ],
                          ), // Text Don't have an account? and Text Create
                        ],
                      ),
                    ),
                  ),
                ), // Ui Screen
                if(state is LoginDoctorScreenLoadingState)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator( color: HexColor("#5DCDC6"),),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
