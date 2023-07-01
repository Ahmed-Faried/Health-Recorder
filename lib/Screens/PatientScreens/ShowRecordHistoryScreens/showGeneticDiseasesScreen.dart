import 'package:flutter/material.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';

class GeneticDiseasesShow extends StatelessWidget {
  const GeneticDiseasesShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreensPatientShow(
      "Genetic Diseases" ,
      functionontap ,
      context ,
      patientDataModel?.data?.pationt?.hereditaryDiseases?.length,
      "Genetic Diseases",
      "Regular medicine",
      patientDataModel?.data?.pationt?.hereditaryDiseases,
      patientDataModel?.data?.pationt?.hereditaryDiseases,

    );
  }
}
