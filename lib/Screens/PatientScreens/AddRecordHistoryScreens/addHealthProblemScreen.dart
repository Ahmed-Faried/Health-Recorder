import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';

class HealthProblemAdd extends StatelessWidget {
  HealthProblemAdd({Key? key}) : super(key: key);

  TextEditingController  HealthProblemController = TextEditingController();
  TextEditingController regularMedicineHealthProblemController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle("Health Problem Add", functionontap ),
      ),
      body:RecordHistoryBodyAdd(
          context,
          HealthProblemController,
          regularMedicineHealthProblemController,
          "HealthProblem",
          "HealthProblem",
          functionontap
      ),

    );
  }
}
