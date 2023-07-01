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
            builder:(context , states) {return   Scaffold(
              appBar: AppBar(
                title: RecordHistoryAppBarTitle("Surgical History Add" ),
              ),
              body:RecordHistoryBodyAdd(
                  context,
                  DoctorEditCubit.get(context).SurgicalHistoryController,
                  DoctorEditCubit.get(context).regularMedicineSurgicalHistoryController,
                  "Surgery type ",
                  "Date of surgery",
                  DoctorEditCubit.get(context).Surgical_operations(
                    name: DoctorEditCubit.get(context).SurgicalHistoryController.text,
                    date: DoctorEditCubit.get(context).regularMedicineSurgicalHistoryController.text,
                  )
              ),

            );},
            listener:(context , states) {}
        )

    );
  }
}
