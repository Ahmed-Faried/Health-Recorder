import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorStates.dart';
import 'package:shop_app/Screens/PatientScreens/AddRecordHistoryScreens/cubit/DoctorEditStates.dart';

import '../../../Components/components.dart';
import '../../../Components/const.dart';
import '../ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import 'cubit/DoctorEditCubit.dart';

class ChronicDiseasesAdd extends StatelessWidget {
   ChronicDiseasesAdd({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return  BlocProvider(

      create: (BuildContext context) => DoctorEditCubit(),

      child: BlocConsumer<DoctorEditCubit ,DoctorEditStates>(
        builder:(context , state) {return Scaffold(
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
                    NID_PAtient : patientDataModel?.data?.pationt?.nationalId
                )
            ),
          ),

        );},
          listener:(context , state) {
          if( state is chronic_DiseasesEdit_SuccessStates){
            toastShow(msg: " Added successfully ", state: toastStates.SUCCESS);
          }
          if( state is chronic_DiseasesEdit_ErrorStates){
            toastShow(msg: "${state.ErrorChronic.toString()}", state: toastStates.SUCCESS);

            toastShow(msg: "An error occurred while adding", state: toastStates.ERROR);
          }
          
          }
      )
    );
  }
}
