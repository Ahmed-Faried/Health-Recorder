import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';

class ChronicDiseasesAdd extends StatelessWidget {
   ChronicDiseasesAdd({Key? key}) : super(key: key);

   TextEditingController  chronicDiseaseController = TextEditingController();
   TextEditingController regularMedicineChronicDiseaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: RecordHistoryAppBarTitle("Chronic Diseases Add", functionontap ),
        ),
        body:RecordHistoryBodyAdd(
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
