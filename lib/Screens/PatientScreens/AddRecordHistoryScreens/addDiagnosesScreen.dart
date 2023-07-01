import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';
import 'cubit/DoctorEditCubit.dart';
import 'cubit/DoctorEditStates.dart';

class DiagnosesAdd extends StatelessWidget {
  DiagnosesAdd({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return   BlocProvider(
        create: (BuildContext context) => DoctorEditCubit(),

        child: BlocConsumer<DoctorEditCubit ,DoctorEditStates>(
            builder:(context , states) {return Scaffold(
              appBar: AppBar(
                title: RecordHistoryAppBarTitle(" Diagnoses   "),
              ),
              body: ConditionalBuilder(
                condition: patientDataModel != null,
                builder: (BuildContext context) {
                  return Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:
                                          [
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   children: [
                                            //     Text(
                                            //       "Doctor ",
                                            //       style:
                                            //       TextStyle(fontSize: 16, color: Colors.black),
                                            //     ),
                                            //     Text(
                                            //       "${patientDataModel?.data?.pationt?.diagonas![index].DoctorName}",
                                            //       style:
                                            //       TextStyle(fontSize: 16, color: Colors.black),
                                            //     ),
                                            //   ],
                                            // ),
                                            // SizedBox(
                                            //   height: 10,
                                            // ),
                                            Text(
                                              "Diagnose Condition",
                                              style:
                                              TextStyle(fontSize: 16, color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25.0),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset:
                                                    Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: TextField(
                                                controller: DoctorEditCubit.get(context).diagonasController,
                                                minLines: 1,
                                                maxLines: null,
                                                cursorColor: Colors.grey[300],
                                                style:
                                                TextStyle(fontSize: 16, color: Colors.grey[800]),
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 20, horizontal: 10),
                                                  border: InputBorder.none,
                                                  hintText: ' Diagnose condition ',

                                                  hintStyle: TextStyle(
                                                      fontSize: 16, color: Colors.grey[400]),
                                                  icon: Padding(
                                                    padding: const EdgeInsets.only(left: 14.0),
                                                    child: Icon(Icons.medication,
                                                        color: Colors.grey[400]),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Medicine  ",
                                              style:
                                              TextStyle(fontSize: 16, color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25.0),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset:
                                                    Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: TextField(
                                                controller: DoctorEditCubit.get(context).regularMedicinediagonasController,
                                                minLines: 1,
                                                maxLines: null,
                                                cursorColor: Colors.grey[300],
                                                style:
                                                TextStyle(fontSize: 16, color: Colors.grey[800]),
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 20, horizontal: 10),
                                                  hintText: ' Medicine ',

                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      fontSize: 14, color: Colors.grey[400]),
                                                  icon: Padding(
                                                    padding: const EdgeInsets.only(left: 14.0),
                                                    child: Icon(Icons.coronavirus,
                                                        color: Colors.grey[400]),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0  , vertical: 12),
                          child: InkWell(
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: HexColor('5DCDC6'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add new Diagonals",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              DoctorEditCubit.get(context).diagonas(
                                DoctorName:  doctorDataModel?.data?.doctor.firstName.toString(),
                                now : DoctorEditCubit.get(context).now.toString() ,
                                Diagnose_condition :  DoctorEditCubit.get(context).diagonasController.text  ,
                                Medicine : DoctorEditCubit.get(context).regularMedicinediagonasController.text,
                              ) ;
                            },
                          ),
                        ),

                      ],
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return CircularProgressIndicator();
                },
              ),
            );},
            listener:(context , states) {}
        ),
    );
  }
}
