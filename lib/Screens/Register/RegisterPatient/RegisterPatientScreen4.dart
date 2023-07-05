import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Screens/BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';

import '../../../Components/components.dart';

import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';



class RegisterPatientScreen4 extends StatelessWidget {
  RegisterPatientScreen4({Key? key}) : super(key: key);

  var formKey3 = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;

     return BlocConsumer<Patient_RegisterCubit, RegisterPatientStates>(
       listener: (context ,state ) {},

       builder: (context ,state ) { return Scaffold(
         backgroundColor: Colors.white70,
         body: Stack(
           fit: StackFit.loose,
           children: <Widget>[
             Container(
               color: Colors.white,
               alignment: Alignment.bottomLeft,
               child: const Image(
                 image: AssetImage('assets/bot-L1.png'),
                 alignment: Alignment.bottomLeft,
                 width: 50,
                 height: 100,
                 fit: BoxFit.contain,
               ),
             ), // Image bot-L.png
             SizedBox(
               width: MediaQuery.of(context).size.width,
               height: 100,
               child: const Image(
                 image: AssetImage('assets/top.png'),
                 fit: BoxFit.fill,
                 colorBlendMode: BlendMode.colorDodge,
               ),
             ), // Image top.png
             Form(
               key: formKey3,
               child: Padding(
                 padding: const EdgeInsets.all(18.0), //Padding all Screen
                 child: SingleChildScrollView(
                   child: Column(
                     children:
                     [
                        SizedBox(
                         height: height*.0825,
                       ),
                       Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Center(
                                 child: Text(
                                   "Create account",
                                   style: TextStyle(
                                     fontSize: 35,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     wordSpacing: 1,
                                   ),
                                 ),
                               )
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Center(
                                 child: Text(
                                   "Health status",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontSize: 16,
                                     //fontWeight: FontWeight.bold,
                                     color: Colors.grey,
                                     wordSpacing: 1,
                                   ),
                                 ),
                               )
                             ],
                           )
                         ],
                       ),
                        SizedBox(
                          height: height*.015,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:
                         [
                           Text(" have a Chronic disease ? " , style: TextStyle( fontSize: 16 ),),

                         ],
                       ),
                        SizedBox(
                         height: height*.015,
                       ),
                       Container(
                         width: double.infinity,
                         height: 60,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                           color: Colors.white,
                           boxShadow:  [
                             BoxShadow(
                               color: Colors.grey.shade300,
                               blurRadius: 5,
                               spreadRadius: 1,
                               offset: Offset(2, 2),
                             ),
                           ],
                         ),
                         child: Padding(
                           padding: const EdgeInsets.symmetric( horizontal: 10.0),
                           child: Row(
                             children:
                             [
                               Icon(Icons.ac_unit_rounded),
                               SizedBox(width: 5,),
                                DecoratedBox(
                             decoration: BoxDecoration(
                               // color:Colors.lightBlue, //background color of dropdown button
                               // border: Border.all(color: Colors.black38, width:3), //border of dropdown button
                               // borderRadius: BorderRadius.circular(20), //border raiuds of dropdown button
                             ),
                             child:   DropdownButton(

                               padding:EdgeInsets.symmetric(horizontal:  16.0) ,
                               underline: Container(),
                               icon: Icon(Icons.arrow_drop_down),
                               style: TextStyle(color: Colors.black),
                               value: Patient_RegisterCubit.get(context).chronicDiseaseValue,
                                 menuMaxHeight :  height*.3,
                               items: [ //add items in the dropdown
                                 DropdownMenuItem(
                                     child: Container(
                                         child: Text("None Of These")),
                                     value: "None Of These"
                                 ),
                                 DropdownMenuItem(
                                   child: Text("Diabetes"),
                                   value: "Diabetes",
                                 ),
                                 DropdownMenuItem(
                                   child: Text("Heart Disease"),
                                   value: "Heart Disease",
                                 ),
                                 DropdownMenuItem(
                                   child: Text("High Blood Pressure"),
                                   value: "High Blood Pressure",
                                 ),
                                 DropdownMenuItem(
                                   child: Text("Low Blood Pressure"),
                                   value: "Low Blood Pressure",
                                 ),
                                 DropdownMenuItem(
                                   child: Text("Cancer"),
                                   value: "Cancer",
                                 ),
                                 DropdownMenuItem(
                                   child: Text("Asthma"),
                                   value: "Asthma",
                                 ),
                               ],
                               onChanged: (value){ //get value when changed
                                 Patient_RegisterCubit.get(context).ChronicDiseaseValue(value);
                               },
                             ),
                           )
                               // Text("Chronic disease"),
                               // Spacer(),
                               // IconButton(
                               //   icon :Icon(Icons.arrow_drop_down),
                               //   onPressed: () {
                               //
                               //   }
                               //   ,),
                             ],
                           ),
                         ),
                       ),
                        SizedBox(
                         height: height*.051,
                       ),
                       FieldFromRegistr(
                         controller: Patient_RegisterCubit.get(context).chronicDiseaseMedicineController,
                         type: TextInputType.text,
                         onSubmit: () {},
                         onChanged: () {},
                         onTap: () {},
                         suffixPressed: () {},
                         validator: (vaule) {
                           if (vaule!.isEmpty) {
                             toastShow(
                                 msg: 'Regular medicine isEmpty',
                                 state: toastStates.WARNING);
                             return "*" ;
                           }
                         },
                         label: 'Regular medicine',
                         prefix: Icons.medical_services,
                       ),
                        SizedBox(
                          height: height*.060,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:
                         [
                           Text(" You have any health problem ? " , style: TextStyle( fontSize: 16 ),),

                         ],
                       ),
                        SizedBox(
                         height: height*.015,
                       ),
                       FieldFromRegistr(
                         controller: Patient_RegisterCubit.get(context).healthProblemController,
                         type: TextInputType.text,
                         onSubmit: () {},
                         onChanged: () {},
                         onTap: () {},
                         suffixPressed: () {},
                         validator: (vaule) {
                           if (vaule!.isEmpty) {
                             toastShow(
                                 msg: 'Health Problem isEmpty',
                                 state: toastStates.WARNING);
                             return "*" ;
                           }
                         },
                         label: 'Type it here...',
                         prefix: Icons.add_chart_rounded,
                       ),
                        SizedBox(
                          height: height*.030,
                       ),
                       FieldFromRegistr(
                       controller: Patient_RegisterCubit.get(context).healthProblemMedicineController,
                       type: TextInputType.text,
                       onSubmit: () {},
                       onChanged: () {},
                       onTap: () {},
                       suffixPressed: () {},
                       validator: (vaule) {
                         if (vaule!.isEmpty) {
                           toastShow(
                               msg: 'Regular medicine Health Problem isEmpty',
                               state: toastStates.WARNING);
                           return "*" ;
                         }
                       },
                       label: 'Regular medicine',
                       prefix: Icons.medical_services,
                     ),
                        SizedBox(
                         height: height*.033,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           InkWell(
                             child: Container(
                               width: 85,
                               height: 45,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(35),
                                 color: HexColor("#68DED7"),
                               ),
                               child: Center(child: Text("Skip" ,style: TextStyle(color: Colors.white ,fontSize: 13),)) ,
                             ),
                             onTap: () {
                             navigateTo(context, HomePagePatientScreen());
                             },
                           ),
                           Spacer(),
                           ConditionalBuilder(
                             condition: true ,
                             builder: (BuildContext context) {
                               return InkWell(
                                 child: Container(
                                   width: 65,
                                   height: 40,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(35),
                                     color: HexColor("#68DED7"),
                                   ),
                                   child: const Icon(
                                     Icons.arrow_forward_outlined,
                                     size: 25,
                                     color: Colors.white,
                                   ),
                                 ),
                                 onTap: () {
                                   if (formKey3.currentState!.validate()) {
                                     Patient_RegisterCubit
                                         .get(context)
                                         .controller
                                         .nextPage(
                                         duration: const Duration(
                                           milliseconds: 1500,
                                         ),
                                         curve: Curves.fastLinearToSlowEaseIn);
                                   };

                                 }
                               );
                             },
                             fallback: (BuildContext context) {
                               return const Center(
                                   child: CircularProgressIndicator());
                             },
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
             ) // Ui Screen
           ],
         ),
       );},

     );

  }
}
