import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/components.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import 'cubit/DoctorEditCubit.dart';
import 'cubit/DoctorEditStates.dart';

class SurgicalHistoryAdd extends StatelessWidget {
  SurgicalHistoryAdd({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
        create: (BuildContext context) => DoctorEditCubit(),

        child: BlocConsumer<DoctorEditCubit ,DoctorEditStates>(
            builder:(context , state) {return   Scaffold(
              appBar: AppBar(
                title: RecordHistoryAppBarTitle("Surgical History Add" ),
              ),
              body:RecordHistoryBodyAdd(
                  context,
                  DoctorEditCubit.get(context).SurgicalHistoryController,
                  DoctorEditCubit.get(context).regularMedicineSurgicalHistoryController,
                  "Surgery type ",
                  "Date of surgery Ex 11/11/2011",
                  DoctorEditCubit.get(context).Surgical_operations(
                    name: DoctorEditCubit.get(context).SurgicalHistoryController.text,
                    date: DoctorEditCubit.get(context).regularMedicineSurgicalHistoryController.text,
                  )
              ),

            );},
            listener:(context , state) {

              if( state is Surgical_operations_SuccessStates){
                toastShow(msg: " Added successfully ", state: toastStates.SUCCESS);
              }
              if( state is Surgical_operations_ErrorStates){
                toastShow(msg: "${state.ErrorSurgical_operations.toString()}", state: toastStates.SUCCESS);
                toastShow(msg: "An error occurred while adding", state: toastStates.ERROR);

              }
            }
        )

    );
  }
}
