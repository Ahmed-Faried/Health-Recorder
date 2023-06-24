import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Bloc/HomeStates.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorCubit.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorStates.dart';
import 'package:shop_app/Screens/Login/Cubit/CubitLoginScreen.dart';
import 'package:shop_app/Screens/Login/Cubit/StatesLoginScreen.dart';
import 'package:shop_app/Screens/LoginAndRegister/LoginAndRegister.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../../PatientDetails/PatientDetailsScreen.dart';


class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return BlocProvider(

      create: (BuildContext context) => DoctorCubit()..getData_Doctor(idDoctor)..getAllPatientConnected(doctorDataModel?.data!.doctor.pId),
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition:doctorDataModel != null,
            builder: (BuildContext context) {

             return ProfiledoctorScreen(doctorDataModel,context ,DataPatientID! );
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

Widget ProfiledoctorScreen(DoctorDataModel? model ,   context ,List<PatientDataModel> modelPatient ) => Scaffold(
  backgroundColor: Colors.white,
  body: Padding(
    padding: const EdgeInsets.only(top: 14.0, left: 14, right: 14),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Image(
                width: 50,
                height: 50,
                image: NetworkImage(
                    'https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'),
              ),
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
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children:  [
                      Text(
                        "${model?.data?.doctor.firstName}",
                        style: TextStyle(
                            fontSize: 20,
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
                        ) ,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Are you sure you want to logout?'),
                          ],
                        ),
                        actions: <Widget>[
                          Row(
                            children:
                            [
                              TextButton(
                                onPressed: () {

                                },
                                child: Text('Cancel'),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  CacheHelper.RemveData(key:'token') ;
                                  CacheHelper.RemveData(key:'department') ;
                                  CacheHelper.RemveData(key:'id') ;
                                  CacheHelper.RemveData(key:'idDoctor') ;
                                  RemoveCacheHelper();
                                  navigateAndFinish(context, LoginAndRegister());
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
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor('E3F8F6'),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
              Expanded(
                child: TextFormField(
                  controller: HomeCubit.get(context).searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    //  NewsAppCubit.get(context).getSearch(value);
                    print("value");
                  },
                  onTap: () {},
                  validator: (value) {
                    if (value != null) {
                      return 'Search must not be empty ';
                    }
                    return 'A';
                  },
                  decoration: InputDecoration(
                    hintText: "Search by patient code ",
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: const [
        //     Padding(
        //       padding: EdgeInsets.all(5),
        //       child: Text(
        //         "Add new patient",
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 12,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ],
        // ),


        // Enter patient code textFromFiled
        // Container(
        //   width: double.infinity,
        //   height: 50,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     color: HexColor('E3F8F6'),
        //   ),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(5),
        //         child: IconButton(
        //             onPressed: () {},
        //             icon: const Icon(
        //               Icons.add_circle_outlined,
        //               color: Colors.grey,
        //             )),
        //       ),
        //       Expanded(
        //         child: TextFormField(
        //           controller: HomeCubit.get(context).enterCodeController,
        //           keyboardType: TextInputType.text,
        //           onChanged: (value) {
        //             //  NewsAppCubit.get(context).getSearch(value);
        //             print("value");
        //           },
        //           onTap: () {},
        //           validator: (value) {
        //             if (value != null) {
        //               return 'Search must not be empty ';
        //             }
        //             return 'A';
        //           },
        //           decoration: InputDecoration(
        //             hintText: "Enter patient code ",
        //             border: InputBorder.none,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 8,
        // ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0, .7),
                            blurStyle: BlurStyle.inner),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric( horizontal:  14.0 , vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius:
                                BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children:  [
                                      Text(
                                        "${modelPatient[index].data?.pationt?.fristName}   ",/*${model.data?.pationts[index].lastName} */
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight:
                                            FontWeight.bold),
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children:  [
                                      const Text(
                                        'Phone number',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight:
                                            FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${modelPatient[index].data?.pationt?.phoneNumber}',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children:  [
                                      const Text(
                                        'Patient code',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight:
                                            FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${modelPatient[index].data?.pationt?.nationalId}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  DoctorCubit.get(context).getData_Patient(id:modelPatient[index].data?.pationt?.nationalId);
                  navigateTo(context, PatientDetails());
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount:  model?.data?.doctor.pId.length ?? 0 ,
          ),
        ),
      ],
    ),
  ),
);
