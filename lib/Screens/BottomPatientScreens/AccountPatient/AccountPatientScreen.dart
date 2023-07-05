import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/BottomPatientScreens/PatientCubit/PatientStates.dart';
import 'package:shop_app/Screens/Help%20center/HelpCenterScreen.dart';
import 'package:shop_app/Screens/LoginAndRegister/LoginAndRegister.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../Edit Profile/EditProfilePatientScreen.dart';
import '../../TestBarCode/TestBarCode.dart';
import '../PatientCubit/PatientCubit.dart';

class AccountPatientScreen extends StatelessWidget {
  AccountPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return BlocProvider(

      create: (BuildContext context) => PatientCubit()..getData_Patient(),
      child: BlocConsumer<PatientCubit, PatientStates>(
        listener: (context, state) {
          // if (state is DarkMode) {
          //   CacheHelper.saveData(key: 'isDark', value: true);
          // }
          // if (state is NotDarkMode) {
          //   CacheHelper.saveData(key: 'isDark', value: true);
          // }
        },
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return ConditionalBuilder(
            condition:  patientDataModel != null ,
            builder: (BuildContext context) { return  Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children:
                    [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.blue[300],
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Expanded(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 18),
                            ),
                          ),
                          // InkWell(
                          //   child: const Icon(
                          //     Icons.dangerous_outlined,
                          //     size: 45,
                          //     color: Colors.white,
                          //   ),
                          //   onTap: (){
                          //     navigateAndFinish(context, dangerous());
                          //   },
                          // ),

                        ],
                      ),
                      SizedBox(height: height*0.045,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child:  Image(
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                           image: //imagePatient == null
                                          //     ? NetworkImage(
                                          //   "https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop",
                                          // )
                                          //     :
                                          NetworkImage(
                                            "${patientDataModel?.data?.pationt?.image}",
                                          ),
                                        ),
                                      ),
                                      // CircleAvatar(
                                      //   radius: 30.0,
                                      //
                                      //
                                      //   backgroundImage: NetworkImage("${patientDataModel?.data?.pationt?.image}"),
                                      //
                                      // ),

                                    ],
                                  ),
                                  SizedBox(height: height*0.0250,),

                                  Row(
                                    children:  [
                                      Text(
                                        "${patientDataModel?.data?.pationt?.fristName} ${patientDataModel?.data?.pationt?.lastName}",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'MontaguSlab',
                                              fontSize: 16,
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height*0.011),
                                  Row(
                                    children:  [
                                      Text(
                                        "${patientDataModel?.data?.pationt?.phoneNumber}",
                                        style: TextStyle(fontSize: 12 , ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.011),
                          MyDivider(context, 1.2),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: cardAccount(

                                context, "Edit Profile", Icons.person, EditProfilePatient()),
                          ),
                          cardAccount(context, "QR_Code",
                              Icons.qr_code, PatientQRCode()),
                          cardAccount(context, "Help center", Icons.help_center,
                              HelpCenter()),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0),
                            child: InkWell(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: HexColor('E3F8F6'),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.dark_mode_outlined,
                                        size: 30,
                                        color: Colors.blue[300],
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Dark mode",
                                        style: TextStyle(fontSize: 13 , fontFamily: 'MontaguSlab'),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        color: cubit.isDark == true
                                            ? Colors.white
                                            : Colors.black,
                                        onPressed: () {
                                          cubit.changedMode();
                                        },
                                        icon: Icon(
                                          cubit.isDark == true
                                              ?   Icons.toggle_on_outlined

                                              : Icons.toggle_off_outlined,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: height*0.045,),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Row(
                      //
                      //     children: [
                      //       IconButton(
                      //         color: Colors.red,
                      //           onPressed: () {},
                      //           icon: Icon(Icons.output_outlined),
                      //
                      //       ),
                      //       SizedBox(
                      //         width: 5,
                      //       ),
                      //       InkWell(
                      //         child: Text(
                      //           "Logout",
                      //           style: TextStyle(
                      //            fontSize: 14,
                      //           color: Colors.red),
                      //         ),
                      //         onTap: (){},
                      //       )
                      //     ],
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('تأكيد تسجيل الخروج'),
                                content: Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text('إلغاء'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // تنفيذ عملية تسجيل الخروج
                                      CacheHelper.RemveData(key:'token') ;
                                      CacheHelper.RemveData(key:'department') ;
                                      CacheHelper.RemveData(key:'id') ;
                                      CacheHelper.RemveData(key:'idDoctor') ;
                                      CacheHelper.RemveData(key:'National_ID') ;
                                      patientDataModel == null ;

                                      navigateAndFinish(context, LoginAndRegister());                              },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Sign Out' , style: TextStyle(
                            fontSize: 14,
                            color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              ),
            ); },
            fallback: (BuildContext context) { return Center(child: CircularProgressIndicator()); },
          );
        },
      ),
    );
  }
}
