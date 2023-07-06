import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorCubit.dart';
import 'package:shop_app/Screens/BottomDoctorScreens/DoctorCubit/DoctorStates.dart';
import 'package:shop_app/Screens/LoginAndRegister/LoginAndRegister.dart';
import 'package:skeletons/skeletons.dart';
import '../../../Components/const.dart';
import '../../../moudel/LoginModel/DoctorDataMoudleing.dart';
import '../../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../../SearchPatientFromNID/SearchPatientFromNID.dart';


class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocProvider(

      create: (BuildContext context) => DoctorCubit()..clearListss()..clearListDataPatientID()..getData_Doctor(),
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: doctorDataModel != null && state is !Data_DoctorFromID_LoadingState,
            builder: (BuildContext context) {
             return ProfiledoctorScreen(doctorDataModel,context ,DataPatientID );
            },
            fallback: (BuildContext context) {
              return Center(child: ListView.builder(

                itemCount: 1,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: SkeletonItem(
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Row(
                              children: [
                                SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                      shape: BoxShape.circle, width: 60, height: 60),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 6,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 12,
                                            width: 150,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 6,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 12,
                                            width: 130,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SkeletonAvatar(
                                    style: SkeletonAvatarStyle(width: 40, height: 40)),
                              ],
                            ),
                            SizedBox(height: 50),
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 40,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            SizedBox(height: 50),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,

                                  borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          shape: BoxShape.circle, width: 60, height: 60),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 12,
                                                  width: 150,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 2,
                                                  width: double.infinity,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 120,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 70,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,

                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          shape: BoxShape.circle, width: 60, height: 60),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 12,
                                                  width: 150,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 2,
                                                  width: double.infinity,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 120,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 70,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,

                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          shape: BoxShape.circle, width: 60, height: 60),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 12,
                                                  width: 150,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 2,
                                                  width: double.infinity,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 120,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 70,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,

                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          shape: BoxShape.circle, width: 60, height: 60),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 12,
                                                  width: 150,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                                lines: 1,
                                                spacing: 4,
                                                lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 2,
                                                  width: double.infinity,
                                                  borderRadius: BorderRadius.circular(8),

                                                )),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 120,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SkeletonParagraph(
                                                    style: SkeletonParagraphStyle(
                                                        lines:2,
                                                        spacing: 6,
                                                        lineStyle: SkeletonLineStyle(
                                                          randomLength: false,
                                                          height: 12,
                                                          width: 70,
                                                          borderRadius: BorderRadius.circular(8),

                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ));
            },
          );
        },
      ),
    );
  }
}

Widget ProfiledoctorScreen(DoctorDataModel? model ,   context ,List<PatientDataModel>? modelPatient ) => Scaffold(
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
              child:  Image(
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                image: NetworkImage(
                    '${model?.data?.doctor.image}',

                ),
              ),
            ),

            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children:  [
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
                            fontSize: 16,fontFamily: 'MontaguSlab',
                            color: Colors.black,
                            ),
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
                                  Navigator.pop(context);

                                },
                                child: Text('Cancel'),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  deleteAllData();
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
              InkWell(child: Center(child: Text("Search by patient code ",)) ,
                onTap: () {
                navigateTo(context, SearchFromNID());
              },
              )
            ],
          ),
        ),
        Expanded(
          child: ConditionalBuilder(
            condition: DoctorCubit.get(context).ss.isNotEmpty,
            builder: (BuildContext context) { return ListView.separated(
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
                                  color: Colors.white70,
                                  borderRadius:
                                  BorderRadius.circular(65),
                                 )
                              ,child: Image(

                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                // تم تحميل الصورة بنجاح
                                return child;
                              } else {
                                // لم يتم تحميل الصورة بعد، أعرض خلفية زرقاء
                                return Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
                                );
                              }
                            },
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                // لم يتم تحميل الصورة بنجاح، أعرض خلفية زرقاء
                                return Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.grey,

                                  ),
                                  child:  Image(image: NetworkImage(
                                    'https://res.cloudinary.com/dxs0ugb8z/image/upload/v1687357323/doctorImg/z7ae1gaobpgnwfauvski.png',
                                  ) ,)
                                );
                              },
                              image:

                            NetworkImage(
                              '${modelPatient?[index].data?.pationt?.image}',
                            ),),
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
                                          "${modelPatient?[index].data?.pationt?.fristName}   ",/*${model.data?.pationts[index].lastName} */
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
                                          '${modelPatient?[index].data?.pationt?.phoneNumber}',
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
                                          '${modelPatient?[index].data?.pationt?.nationalId}' , style: TextStyle(fontSize: 13,),
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
                    DoctorCubit.get(context).getData_Patient(id:modelPatient?[index].data?.pationt?.nationalId , context :context);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount:  modelPatient?.length ?? 0 ,
            );  },
            fallback: (BuildContext context) { return Center(child: Container(child: Text("No Patient Add")));  },

          ),
        ),
      ],
    ),
  ),
);
