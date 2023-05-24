import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../../Login/Cubit/CubitLoginScreen.dart';

class HealthProblemShow extends StatelessWidget {
   HealthProblemShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreensPatientShow(
        "Health Problem" ,
        functionontap ,
        context ,
       patientDataModel?.data?.pationt?.healthProblems?.length,
        "Health problem",
        "Regular medicine",
        patientDataModel?.data?.pationt?.healthProblems,
        patientDataModel?.data?.pationt?.healthProblems,

    );
  }


}
void functionontap (){
  print("on tap ");
}
