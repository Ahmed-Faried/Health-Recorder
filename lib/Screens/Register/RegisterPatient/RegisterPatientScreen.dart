import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import '../../Login/Cubit/CubitLoginScreen.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';

class RegisterPatientScreen extends StatelessWidget {
  RegisterPatientScreen({Key? key}) : super(key: key);

  var formKey1 = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => Patient_RegisterCubit(),
      child: BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
        listener: (BuildContext context, state) {

          if(state is PatientRegisterSuccessState ){
            if(state.patientDataModel.status  == "success"){
              toastShow(
                  msg: "تم تسجيل الدخول بنجاح",
                  state: toastStates.SUCCESS);

              CacheHelper.saveData(
                  key:'token',
                  value: state.patientDataModel.token
              );
              CacheHelper.saveData(
                  key:'id',
                  value: state.patientDataModel.data?.pationt!.id

              ).then((value) {
                print(idPatient);
                print(token);
                navigateAndFinish(context, HomePagePatientScreen());
              });



            }else{
              toastShow(
                  msg: "خطا في تسجيل الدخول ",
                  state: toastStates.ERROR);
            }

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
                  key: formKey1,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0), //Padding all Screen
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            // const SizedBox(
                            //   height: 50,
                            // ),
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
                            ), // Text Hello
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
                                }
                              },
                              label: 'Phone',
                              prefix: Icons.phone_android_rounded,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FieldFromRegistr(
                              controller: Patient_RegisterCubit.get(context).agePatientController,
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
                                }
                              },
                              label: 'Age',
                              prefix: Icons.calendar_month,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FieldFromRegistr(
                              controller: Patient_RegisterCubit.get(context).nationalIDPatientController,
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
                                }
                              },
                              label: 'National ID',
                              prefix: Icons.credit_card_outlined,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FieldFromRegistr(
                              controller: Patient_RegisterCubit.get(context).genderPatientController,
                              type: TextInputType.text,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'gender isEmpty',
                                      state: toastStates.WARNING);
                                }
                              },
                              label: 'gender',
                              prefix: Icons.g_mobiledata_outlined,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FieldFromRegistr(
                              controller: Patient_RegisterCubit.get(context).bloodTypePatientController,
                              type: TextInputType.text,
                              onSubmit: () {},
                              onChanged: () {},
                              onTap: () {},
                              suffixPressed: () {},
                              validator: (vaule) {
                                if (vaule!.isEmpty) {
                                  toastShow(
                                      msg: 'blood Type isEmpty',
                                      state: toastStates.WARNING);
                                }
                              },

                              label: 'blood Type',
                              prefix: Icons.bloodtype,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //Blood type
                            //    const SizedBox(
                            //      height: 10,
                            //    ),
                            //    Row(
                            //   children: [
                            //     Icon(Icons.bloodtype_sharp , color:  HexColor("#5DCDC6"),size: 30,),
                            //     SizedBox(width:3,),
                            //     Text("Blood Type" , style: TextStyle(
                            //       fontSize: 20,
                            //       color: Colors.black,
                            //       wordSpacing: 1,
                            //     ),),
                            //   ],
                            // ),
                            //    Container(
                            //      width: double.infinity,
                            //      height: 150,
                            //      child: GridView.count(
                            //        padding: EdgeInsets.zero,
                            //            shrinkWrap: true,
                            //
                            //        crossAxisCount: 4,
                            //
                            //        children: List.generate(9, (index) {
                            //          return GestureDetector(
                            //
                            //            onTap: () {
                            //              cubit.changeBloodType(index);
                            //              print(cubit.containerValues[index]);
                            //
                            //            },
                            //            child: Container(
                            //              margin: EdgeInsets.all(14),
                            //              decoration: BoxDecoration(
                            //                color: cubit.selectedContainerIndex == index ? HexColor("#5DCDC6") : Colors.white,
                            //                borderRadius: BorderRadius.circular(10),
                            //                boxShadow: const [
                            //                  BoxShadow(
                            //                    color: Colors.grey,
                            //                    blurRadius: 5,
                            //                    spreadRadius: 1,
                            //                    offset: Offset(2, 2),
                            //                  ),
                            //                ],
                            //              ),
                            //              child: Center(
                            //                child: Text(
                            //                  cubit.containerValues[index],
                            //                  style: const TextStyle(
                            //                    fontSize: 16,
                            //                    fontWeight: FontWeight.bold,
                            //                    color: Colors.black,
                            //                  ),
                            //                ),
                            //              ),
                            //            ),
                            //          );
                            //        }),
                            //      ),
                            //    ),
                            //    const SizedBox(
                            //      height: 10,
                            //    ),//e
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Sign in ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    wordSpacing: 1,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                ConditionalBuilder(
                                  condition: state is! PatientRegisterLoadingState,
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      child: Container(
                                        width: 65,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: HexColor("#44B5AE"),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_forward_outlined,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onTap: () {
                                        if (formKey1.currentState!.validate()) {
                                          try {
                                            Patient_RegisterCubit.get(context).PatientRegister(
                                              fristName:   Patient_RegisterCubit.get(context).firstNamePatientController.text,
                                              lastName:    Patient_RegisterCubit.get(context).lastNamePatientController.text,
                                              bloodType:   Patient_RegisterCubit.get(context).bloodTypePatientController.text,
                                              gender:      Patient_RegisterCubit.get(context).genderPatientController.text,
                                              password:    Patient_RegisterCubit.get(context).passwordPatientController.text,
                                              email:       Patient_RegisterCubit.get(context).emailPatientController.text,
                                              number:      Patient_RegisterCubit.get(context).numberPatientController.text,
                                              National_ID: Patient_RegisterCubit.get(context).nationalIDPatientController.text,
                                              age: Patient_RegisterCubit.get(context).agePatientController.text,
                                            );
                                            // RegisterCubit.get(context).PatientRegister(
                                            //   fristName: 'John',
                                            //   lastName: 'Doe',
                                            //   age: "30",
                                            //   bloodType: 'A+',
                                            //   gender: 'mail',
                                            //   password: 'password',
                                            //   email: 'johjjjoe@example.com',
                                            //   number: '12345678900',
                                            //   National_ID: '12345678974580',
                                            // );
                                          } catch (e) {
                                            print('An error occurred: $e');
                                          }



                                        }else {
                                          toastShow(
                                              msg: "no Filed empty",
                                              state: toastStates.ERROR);
                                        }

                                        // RegisterCubit.get(context).PatientRegister(context: context );
                                          // firstName: RegisterCubit.get(context).firstNamePatientController.text,
                                          // lastName: RegisterCubit.get(context).lastNamePatientController.text,
                                          // bloodType: RegisterCubit.get(context).bloodTypePatientController.text,
                                          // gender: RegisterCubit.get(context).genderPatientController.text,
                                          // password: RegisterCubit.get(context).passwordPatientController.text,
                                          // email: RegisterCubit.get(context).emailPatientController.text,
                                          // number: RegisterCubit.get(context).numberPatientController.text,
                                          // National_ID: RegisterCubit.get(context).nationalIDPatientController.text,

                                      },
                                    );
                                  },
                                  fallback: (BuildContext context) {
                                    return const Center(child: CircularProgressIndicator());
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
      ),
    );
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
          groupValue: LoginScreenCubit.get(context).containerValues,
          onChanged: (value) {
            LoginScreenCubit.get(context).changeBloodType(value);
          },
          dense: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      );
}
