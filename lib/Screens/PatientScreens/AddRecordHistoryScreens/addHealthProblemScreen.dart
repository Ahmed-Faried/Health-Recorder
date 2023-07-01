import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import 'cubit/DoctorEditCubit.dart';
import 'cubit/DoctorEditStates.dart';

class HealthProblemAdd extends StatelessWidget {
  HealthProblemAdd({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return  BlocProvider(

        create: (BuildContext context) => DoctorEditCubit(),

        child: BlocConsumer<DoctorEditCubit ,DoctorEditStates>(
            builder:(context , state) {return  Scaffold(
              appBar: AppBar(
                title: RecordHistoryAppBarTitle("Health Problem Add" ),
              ),
              body:RecordHistoryBodyAdd(
                  context,
                  DoctorEditCubit.get(context).HealthProblemController,
                  DoctorEditCubit.get(context).regularMedicineHealthProblemController,
                  "Health Problem",
                  "Medicine ",
                  DoctorEditCubit.get(context).Health_problems(
                    name: DoctorEditCubit.get(context).HealthProblemController.text,
                    medicen: DoctorEditCubit.get(context).regularMedicineHealthProblemController.text,
                      NID_PAtient : patientDataModel?.data?.pationt?.nationalId
                  )
              ),

            );},
            listener:(context , state) {

              if( state is Health_problems_SuccessStates){
                toastShow(msg: " Added successfully ", state: toastStates.SUCCESS);
              }
              if( state is Health_problems_ErrorStates){
                toastShow(msg: "${state.ErrorHealth_problems.toString()}", state: toastStates.SUCCESS);

                toastShow(msg: "An error occurred while adding", state: toastStates.ERROR);
              }
            }
        )

    );
  }
}
