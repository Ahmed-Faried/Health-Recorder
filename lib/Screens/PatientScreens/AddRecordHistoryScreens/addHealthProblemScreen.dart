import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/components.dart';
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
            builder:(context , states) {return  Scaffold(
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
                  )
              ),

            );},
            listener:(context , states) {}
        )

    );
  }
}
