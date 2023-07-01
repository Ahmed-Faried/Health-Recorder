import 'package:flutter/material.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';

class SurgicalHistoryAdd extends StatelessWidget {
  SurgicalHistoryAdd({Key? key}) : super(key: key);

  TextEditingController  SurgicalHistoryController = TextEditingController();
  TextEditingController regularMedicineSurgicalHistoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle("Surgical History Add", functionontap ),
      ),
      body:RecordHistoryBodyAdd(
          context,
          SurgicalHistoryController,
          regularMedicineSurgicalHistoryController,
          "SurgicalHistory",
          "SurgicalHistory",
          functionontap
      ),

    );
  }
}
