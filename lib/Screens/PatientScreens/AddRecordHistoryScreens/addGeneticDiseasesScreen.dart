import 'package:flutter/material.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';

class GeneticDiseasesAdd extends StatelessWidget {
  GeneticDiseasesAdd({Key? key}) : super(key: key);

  TextEditingController  GeneticDiseasesController = TextEditingController();
  TextEditingController regularMedicineGeneticDiseasesController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle("Genetic Diseases Add", functionontap ),
      ),
      body:RecordHistoryBodyAdd(
          context,
          GeneticDiseasesController,
          regularMedicineGeneticDiseasesController,
          "GeneticDiseases",
          "GeneticDiseases",
          functionontap
      ),

    );
  }
}
