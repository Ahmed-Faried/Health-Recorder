import 'package:flutter/material.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';

class ChronicDiseasesAdd extends StatelessWidget {
   ChronicDiseasesAdd({Key? key}) : super(key: key);

   TextEditingController  chronicDiseaseController = TextEditingController();
   TextEditingController regularMedicineChronicDiseaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle("Chronic Diseases Add", functionontap ),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 19.0),
        child: RecordHistoryBodyAdd(
          context,
          chronicDiseaseController,
          regularMedicineChronicDiseaseController,
          "ChronicDiseases",
          "ChronicDiseases",
            functionontap
        ),
      ),

    );
  }
}
