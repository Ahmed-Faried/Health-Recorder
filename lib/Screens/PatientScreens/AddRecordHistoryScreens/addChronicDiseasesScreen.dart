import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorStates.dart';
import 'package:shop_app/Screens/PatientScreens/AddRecordHistoryScreens/cubit/DoctorEditStates.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import 'cubit/DoctorEditCubit.dart';

class ChronicDiseasesAdd extends StatelessWidget {
   ChronicDiseasesAdd({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return  BlocProvider(

      create: (BuildContext context) => DoctorEditCubit(),

      child: BlocConsumer<DoctorEditCubit ,DoctorEditStates>(
        builder:(context , states) {return Scaffold(
          appBar: AppBar(
            title: RecordHistoryAppBarTitle("Chronic Diseases Add", ),
          ),
          body:Padding(
            padding: const EdgeInsets.only(top: 19.0),
            child: RecordHistoryBodyAdd(
                context,
                DoctorEditCubit.get(context).chronicDiseaseController,
                DoctorEditCubit.get(context).regularMedicineChronicDiseaseController,
                "Chronic Diseases",
                "Medicine ",
                DoctorEditCubit.get(context).chronic_DiseasesEdit(
                  name:  DoctorEditCubit.get(context).chronicDiseaseController.text,
                  medicen:  DoctorEditCubit.get(context).regularMedicineChronicDiseaseController.text,

                )
            ),
          ),

        );},
          listener:(context , states) {}
      )
    );
  }
}
