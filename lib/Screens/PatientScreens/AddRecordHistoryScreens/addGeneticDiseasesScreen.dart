import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/const.dart';

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
            builder:(context , state) {return  Scaffold(
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
                      NID_PAtient : patientDataModel?.data?.pationt?.nationalId

                  )
              ),

            );},
            listener:(context , state) {

              if( state is Hereditary_diseases_SuccessStates){
                toastShow(msg: " Added successfully ", state: toastStates.SUCCESS);
              }
              if( state is Hereditary_diseases_ErrorStates){
                toastShow(msg: "${state.ErrorHereditary_diseases.toString()}", state: toastStates.SUCCESS);

                toastShow(msg: "An error occurred while adding", state: toastStates.ERROR);
              }
            }
        )

    );
  }
}
