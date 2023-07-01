import 'package:flutter/material.dart';
import '../../../Components/components.dart';
import '../../../Components/const.dart';

class HealthProblemShow extends StatelessWidget {
   HealthProblemShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreensPatientShow(
        "Health Problem" ,
        context ,
        patientDataModel?.data?.pationt?.healthProblems?.length,
        "Health problem",
        "Regular medicine",
        patientDataModel?.data?.pationt?.healthProblems,
        patientDataModel?.data?.pationt?.healthProblems,

    );
  }


}

