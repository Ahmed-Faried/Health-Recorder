import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Components/components.dart';
import '../../../Network/local/shared_preferences.dart';
import '../RegisterDr/RegisterDrScreen.dart';
import 'Cubit_Patient_Register/Patient_Register_Cubit.dart';
import 'Cubit_Patient_Register/Patient_Register_States.dart';
import 'Cubit_Skip_Patient_Register/Patient_Skip_Register_Cubit.dart';
import 'Cubit_Skip_Patient_Register/Patient_Skip_Register_States.dart';
import 'RegisterPatientScreen5.dart';


class RegisterPatientScreen4 extends StatelessWidget {
  RegisterPatientScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     var controller = TextEditingController();

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
                 width: 100,
                 height: 300,
                 fit: BoxFit.contain,
               ),
             ), // Image bot-L.png
             SizedBox(
               width: MediaQuery.of(context).size.width,
               height: 90,
               child: const Image(
                 image: AssetImage('assets/top.png'),
                 fit: BoxFit.fill,
                 colorBlendMode: BlendMode.colorDodge,
               ),
             ), // Image top.png
             Form(
               child: Padding(
                 padding: const EdgeInsets.all(18.0), //Padding all Screen
                 child: SingleChildScrollView(
                   child: Column(
                     children:
                     [
                       const SizedBox(
                         height: 55,
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
                       const SizedBox(
                         height: 10,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:
                         [
                           Text(" have a Chronic disease ? " , style: TextStyle( fontSize: 16 ),),

                         ],
                       ),
                       const SizedBox(
                         height: 10,
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
                               Text("Chronic disease"),
                               Spacer(),
                               IconButton(
                                 icon :Icon(Icons.arrow_drop_down),
                                 onPressed: () {

                                 }
                                 ,),
                             ],
                           ),
                         ),
                       ),
                       const SizedBox(
                         height: 35,
                       ),
                       FieldFromRegistr(
                         controller: controller,
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
                       const SizedBox(
                         height: 40,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:
                         [
                           Text(" You have any health problem ? " , style: TextStyle( fontSize: 16 ),),

                         ],
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       FieldFromRegistr(
                         controller: controller,
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
                         label: 'Type it here...',
                         prefix: Icons.add_chart_rounded,
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       FieldFromRegistr(
                       controller: controller,
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
                       const SizedBox(
                         height: 22,
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
                               child: Center(child: const Text("Skip")) ,
                             ),
                             onTap: () {
                             },
                           ),
                           Spacer(),
                           ConditionalBuilder(
                             condition: true ,
                             builder: (BuildContext context) {
                               return InkWell(
                                 child: Container(
                                   width: 65,
                                   height: 35,
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
                                   Patient_RegisterCubit.get(context)
                                       .controller
                                       .nextPage(
                                       duration: const Duration(
                                         milliseconds: 1500,
                                       ),
                                       curve: Curves.fastLinearToSlowEaseIn);

                                 },
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
