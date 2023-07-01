import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';

class DiagnosesShow extends StatelessWidget {
  DiagnosesShow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle(" Diagnoses      "),
      ),
      body: ConditionalBuilder(
        condition: patientDataModel != null,
        builder: (BuildContext context) {
          return ListView.builder(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Doctor ",
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  "${patientDataModel?.data?.pationt?.diagonas![index].DoctorName}",
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Diagnose_condition",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${patientDataModel?.data?.pationt?.diagonas![index].Diagnose_condition}",
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Date  ",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${patientDataModel?.data?.pationt?.surgicalOperations![index].date}",
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
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
            itemCount: patientDataModel?.data?.pationt?.diagonas?.length,
          );
        },
        fallback: (BuildContext context) {
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
