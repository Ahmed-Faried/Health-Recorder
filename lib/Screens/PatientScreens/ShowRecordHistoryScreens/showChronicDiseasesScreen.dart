import 'package:flutter/material.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import '../../../Components/components.dart';
import '../../../Components/const.dart';

class ChronicDiseasesShow extends StatelessWidget {
   ChronicDiseasesShow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle(" Chronic Diseases  ",),
      ),
      body: ScreensPatientShow(
        "Chronic Diseases" ,
        context ,
        patientDataModel?.data?.pationt?.chronicDiseases?.length,
        "Chronic Diseases",
        "Regular medicine",
        patientDataModel?.data?.pationt?.chronicDiseases,
        patientDataModel?.data?.pationt?.chronicDiseases,

      ),
    );
  }
}
