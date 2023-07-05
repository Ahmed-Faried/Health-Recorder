import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../Components/components.dart';
import '../../../Components/const.dart';

class HealthProblemShow extends StatelessWidget {
   HealthProblemShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: patientDataModel?.data?.pationt?.healthProblems?.length != 0,

      builder: (BuildContext context) { return ScreensPatientShow(
        "Health Problem" ,
        context ,
        patientDataModel?.data?.pationt?.healthProblems?.length,
        "Health problem",
        "Regular medicine",
        patientDataModel?.data?.pationt?.healthProblems,
        patientDataModel?.data?.pationt?.healthProblems,

      ); },
      fallback: (BuildContext context) { return Center(child: Text("Not Fond"),); },

    )  ;
  }


}

