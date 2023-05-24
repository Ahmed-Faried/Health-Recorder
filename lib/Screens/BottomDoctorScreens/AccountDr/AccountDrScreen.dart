import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Bloc/HomeStates.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/Edit%20Profile/EditProfileDoctorScreen.dart';
import 'package:shop_app/Screens/Help%20center/HelpCenterScreen.dart';
import 'package:shop_app/Screens/Login/Cubit/CubitLoginScreen.dart';
import 'package:shop_app/moudel/LoginModel/DoctorDataMoudleing.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../LoginAndRegister/LoginAndRegister.dart';
import '../../Security/SecurtiyScreen.dart';

class AccountDoctorScreen extends StatelessWidget {
  AccountDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is DarkMode) {
          CacheHelper.saveData(key: 'isDark', value: true);
        }
        if (state is NotDarkMode) {
          CacheHelper.saveData(key: 'isDark', value: true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: bodyAccountDoctorScreen(context , doctorDataModel ),
        );
      },
    );
  }





  Widget bodyAccountDoctorScreen (context , DoctorDataModel? modele  ) => Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              size: 45,
              color: Colors.blue[300],
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Doctor Profile",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        const Spacer(),
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
                          child: const Image(
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/test.png"),
                            //NetworkImage(
                            //     'https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'
                            //  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children:  [
                        Text(
                          "${modele?.data?.doctor.firstName}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children:  [
                        Text(
                          "${modele?.data?.doctor.phoneNumber}",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 6),
            MyDivider(context, 1.2),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: cardAccountDoctor(

                  context, "Edit Profile", Icons.person, EditProfileDoctor()),
            ),
            cardAccountDoctor(context, "Security",
                Icons.security_outlined, Securtiy()),
            cardAccountDoctor(context, "Help center", Icons.help_center,
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
                          style: TextStyle(fontSize: 14),
                        ),
                        Spacer(),
                        IconButton(
                          color: HomeCubit.get(context) .isDark != true
                              ? Colors.white
                              : Colors.black,
                          onPressed: () {
                            HomeCubit.get(context) .changedMode();
                          },
                          icon: Icon(
                            HomeCubit.get(context) .isDark != true
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

            // cardAccountDoctor(
            //     context,
            //     "Invite friend",
            //     Icons.accessibility,
            //
            //     InviteFriend()),
          ],
        ),
        const Spacer(),
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
                        CacheHelper.RemveData(key:'idDoctor') ;

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
  );
}
