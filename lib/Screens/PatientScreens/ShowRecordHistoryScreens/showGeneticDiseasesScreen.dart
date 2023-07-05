import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';

class GeneticDiseasesShow extends StatelessWidget {
  const GeneticDiseasesShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: patientDataModel?.data?.pationt?.hereditaryDiseases?.length != 0,

      builder: (BuildContext context) { return ScreensPatientShow(
        "Genetic Diseases" ,
        context ,
        patientDataModel?.data?.pationt?.hereditaryDiseases?.length,
        "Genetic Diseases",
        "Regular medicine",
        patientDataModel?.data?.pationt?.hereditaryDiseases,
        patientDataModel?.data?.pationt?.hereditaryDiseases,

      ); },
      fallback: (BuildContext context) { return Center(child: Text("Not Fond"),); },

    )  ;
  }
}
