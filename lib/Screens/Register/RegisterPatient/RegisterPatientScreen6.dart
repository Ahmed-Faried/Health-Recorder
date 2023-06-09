import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';
import '../../BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';

class RegisterPatientScreen6 extends StatelessWidget {
  RegisterPatientScreen6({Key? key}) : super(key: key);
  var formKey5 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
      listener: (context, state) {
        if (state is PatientRegisterHealthSuccessState) {
          toastShow(msg: "تم التسجيل  بنجاح", state: toastStates.SUCCESS);
        }
        if (state is PatientRegisterHealthErrorState) {
          if (state.Errors != null) {
            toastShow(
                msg: "حدث خطا حاول في وقت لاحق ", state: toastStates.ERROR);
            toastShow(msg: "${state.Errors}", state: toastStates.ERROR);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                key: formKey5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0), //Padding all Screen
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.0825,
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
                                    "Genetic disease ",
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
                          height: height * 0.030,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              " A family member has a genetic disease ?",
                              style: TextStyle(fontSize: 14),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 50,
                              child: ListTile(
                                leading: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                title: Radio(
                                  value: 0,
                                  groupValue: Patient_RegisterCubit.get(context)
                                      .familyGenetic,
                                  onChanged: (value) {
                                    Patient_RegisterCubit.get(context)
                                        .familyGeneticDisease(value);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              child: ListTile(
                                title: Radio(
                                  value: 1,
                                  groupValue: Patient_RegisterCubit.get(context)
                                      .familyGenetic,
                                  onChanged: (value) {
                                    Patient_RegisterCubit.get(context)
                                        .familyGeneticDisease(value);
                                  },
                                ),
                                leading: Text(
                                  'No',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.037,
                        ),
                        FieldFromRegistr(
                          controller: Patient_RegisterCubit.get(context)
                              .relativeRelationController,
                          type: TextInputType.text,
                          onSubmit: () {},
                          onChanged: () {},
                          onTap: () {},
                          suffixPressed: () {},
                          validator: (vaule) {
                            if (vaule!.isEmpty) {
                              toastShow(
                                  msg: 'The relative relation',
                                  state: toastStates.WARNING);
                              return "*";
                            }
                          },
                          label: 'The relative relation',
                          prefix: Icons.receipt_long_outlined,
                        ),
                        SizedBox(
                          height: height * 0.037,
                        ),
                        FieldFromRegistr(
                          controller: Patient_RegisterCubit.get(context)
                              .geneticDiseaseController,
                          type: TextInputType.text,
                          onSubmit: () {},
                          onChanged: () {},
                          onTap: () {},
                          suffixPressed: () {},
                          validator: (vaule) {
                            if (vaule!.isEmpty) {
                              toastShow(
                                  msg: 'The disease isEmpty',
                                  state: toastStates.WARNING);
                              return "*";
                            }
                          },
                          label: 'The disease',
                          prefix: Icons.coronavirus_rounded,
                        ),
                        SizedBox(
                          height: height * 0.037,
                        ),
                        FieldFromRegistr(
                          controller: Patient_RegisterCubit.get(context)
                              .geneticDiseaseMedicineController,
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
                              return "*";
                            }
                          },
                          label: 'Regular medicine',
                          prefix: Icons.medication,
                        ),
                        SizedBox(
                          height: height * 0.125,
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
                                child: Center(
                                    child: Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                )),
                              ),
                              onTap: () {
                                navigateTo(context, HomePagePatientScreen());
                                ;
                              },
                            ),
                            Spacer(),
                            ConditionalBuilder(
                              condition: true,
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
                                    if (formKey5.currentState!.validate()) {
                                      Patient_RegisterCubit.get(context)
                                          .PatientRegisterHealthState(
                                              test1: Patient_RegisterCubit.get(
                                                      context)
                                                  .chronicDiseaseValue,
                                              test2: Patient_RegisterCubit.get(
                                                      context)
                                                  .chronicDiseaseMedicineController
                                                  .text,
                                              test3: Patient_RegisterCubit.get(
                                                      context)
                                                  .healthProblemController
                                                  .text,
                                              test4: Patient_RegisterCubit.get(
                                                      context)
                                                  .healthProblemMedicineController
                                                  .text,
                                              test5:
                                                  Patient_RegisterCubit.get(context)
                                                      .surgeryController
                                                      .text,
                                              test6:
                                                  Patient_RegisterCubit.get(context)
                                                      .Date,
                                              // test6: "01/02/2020",
                                              test7:
                                                  Patient_RegisterCubit.get(context)
                                                      .geneticDiseaseController
                                                      .text,
                                              test8: Patient_RegisterCubit.get(
                                                      context)
                                                  .geneticDiseaseMedicineController
                                                  .text,
                                              context: context);
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
              if (state is PatientRegisterHealthLoadingState)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: HexColor("#5DCDC6"),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
