import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import 'cubit/DoctorEditCubit.dart';
import 'cubit/DoctorEditStates.dart';

class GeneticDiseasesAdd extends StatelessWidget {
  GeneticDiseasesAdd({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  BlocProvider(

        create: (BuildContext context) => DoctorEditCubit(),

        child: BlocConsumer<DoctorEditCubit ,DoctorEditStates>(
            builder:(context , states) {return  Scaffold(
              appBar: AppBar(
                title: RecordHistoryAppBarTitle("Genetic Diseases Add" ),
              ),
              body:RecordHistoryBodyAdd(
                  context,
                  DoctorEditCubit.get(context).GeneticDiseasesController,
                  DoctorEditCubit.get(context).regularMedicineGeneticDiseasesController,
                  "The disease ",
                  "Regular medicine ",
                  DoctorEditCubit.get(context).Hereditary_diseases(
                  name: DoctorEditCubit.get(context).GeneticDiseasesController.text,
                  medicen:  DoctorEditCubit.get(context).regularMedicineGeneticDiseasesController.text,

                  )
              ),

            );},
            listener:(context , states) {}
        )

    );
  }
}
