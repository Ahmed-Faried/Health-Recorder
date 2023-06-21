import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/BottomPatientScreens/PatientCubit/PatientStates.dart';
import 'package:shop_app/Screens/Login/Cubit/CubitLoginScreen.dart';
import 'package:shop_app/Screens/Login/Cubit/StatesLoginScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showChronicDiseasesScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../../Dangerous/dangerous.dart';
import '../../LoginAndRegister/LoginAndRegister.dart';
import '../../PatientScreens/ShowRecordHistoryScreens/showDiagnosesScreen.dart';
import '../../PatientScreens/ShowRecordHistoryScreens/showGeneticDiseasesScreen.dart';
import '../../PatientScreens/ShowRecordHistoryScreens/showSurgicalHistoryScreen.dart';
import '../PatientCubit/PatientCubit.dart';

class HomePatientScreen extends StatelessWidget {
  HomePatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:
            Brightness.dark //or set color with: Color(0xFF0000FF)
        ));

    return BlocProvider(
      create: (BuildContext context) => PatientCubit()..getData_Patient(),
      child: BlocConsumer<PatientCubit, PatientStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: patientDataModel != null,
            builder: (BuildContext context) {
              return ProfilrScreen(patientDataModel, context);
            },
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

Widget ProfilrScreen(PatientDataModel? mod, context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ClipRRect(
                //
                //   borderRadius: BorderRadius.circular(50),
                //   child:Image.network(
                //     "$imagePatient",
                //     width: 70,
                //     height: 70,
                //     fit: BoxFit.fill,
                //     //  image:  //imagePatient == null
                //     // ? NetworkImage(
                //     //     "https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop",
                //     //   )
                //     // :
                //     // NetworkImage(
                //     //
                //     //         "$imagePatient",
                //     //
                //     //       ),
                //   )
                // ),

                CircleAvatar(
                  radius: 25.0,

                  backgroundImage: NetworkImage("${mod?.data?.pationt?.image}"),

                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Good Morning",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${mod?.data?.pationt?.fristName}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Logout'),
                              ],
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Are you sure you want to logout?'),
                              ],
                            ),
                            actions: <Widget>[
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Cancel'),
                                  ),
                                  Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      CacheHelper.RemveData(key: 'token');
                                      CacheHelper.RemveData(key: 'department');
                                      CacheHelper.RemveData(key: 'id');
                                      CacheHelper.RemveData(key: 'idDoctor');
                                      CacheHelper.RemveData(key: 'National_ID');
                                      patientDataModel == null;
                                      navigateAndFinish(
                                          context, LoginAndRegister());
                                    },
                                    child: Text('Logout'),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 30,
                    )),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),

        /* Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Patient details",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text("Read Only",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),*/
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.35),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Age",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            " ${mod?.data?.pationt?.age}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            " years",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11),
                                          ),
                                          Spacer(),
                                          Icon(Icons.date_range_outlined)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.35),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Blood type",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          //          TextButton(
                                          //            onPressed: (){},
                                          //            child:  Text(
                                          //   "Edit",
                                          //   style: TextStyle(
                                          //     fontSize: 14,
                                          //     color: Colors.blue,
                                          //     decoration: TextDecoration.underline
                                          //   ),
                                          //
                                          // ),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "  ${mod?.data?.pationt?.bloodType}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Spacer(),
                                          Icon(Icons.bloodtype_rounded)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.12,
                                decoration: BoxDecoration(
                                  color: HexColor("5DCDC6"),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                    " Diagnostics recording",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.12,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.35),
                                      offset: Offset(0, 1),
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "View your diagnoses",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.edit_note,
                                                    color: HexColor("5DCDC6"),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      navigateTo(context, DiagnosesShow());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardPatientDetialsPatient(
                    context,
                    "health problem",
                    "Morem ipsum dolor sit amet, consectetur.......",
                    Icons.pageview_rounded,
                    HealthProblemShow(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardPatientDetialsPatient(
                    context,
                    "ChronicDiseases",
                    "The disease name.....",
                    Icons.add_chart,
                    ChronicDiseasesShow(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardPatientDetialsPatient(
                    context,
                    "Surgical history",
                    " The surgery type.....",
                    Icons.adb_rounded,
                    SurgicalHistoryShow(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardPatientDetialsPatient(
                    context,
                    "Genetic disease ",
                    " The disease name.....",
                    Icons.coronavirus_sharp,
                    GeneticDiseasesShow(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
