import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import '../../../Components/components.dart';
import '../../../Components/const.dart';

class ChronicDiseasesShow extends StatelessWidget {
   ChronicDiseasesShow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: RecordHistoryAppBarTitle(" Chronic Diseases  ",),
      // ),
      body: ConditionalBuilder(
        condition: patientDataModel?.data?.pationt?.chronicDiseases!.length != 0,

        builder: (BuildContext context) { return ScreensPatientShow(
          "Chronic Diseases" ,
          context ,
          patientDataModel?.data?.pationt?.chronicDiseases?.length,
          "Chronic Diseases",
          "Regular medicine",
          patientDataModel?.data?.pationt?.chronicDiseases,
          patientDataModel?.data?.pationt?.chronicDiseases,

        );  },
        fallback: (BuildContext context) { return Center(child: Text("Not Fond"),); },

      ),
    );
  }
}
