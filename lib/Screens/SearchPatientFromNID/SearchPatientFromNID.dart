import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/components.dart';

import '../../Components/const.dart';
import '../../moudel/LoginModel/PatientDataMoudleing.dart';
import '../BottomDoctorScreens/DoctorCubit/DoctorCubit.dart';
import '../PatientDetails/PatientDetailsScreen.dart';
import 'Cubit/SearchCubit.dart';
import 'Cubit/SearchStates.dart';

class SearchFromNID extends StatelessWidget {
   SearchFromNID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit ,SearchStates >(
        builder: (BuildContext context, state) {
          return UISearchScreen(context , patientDataModelFromNid );  },
        listener: (BuildContext context, Object? state) {
          if(state is SearchStates_SuccessState){
            print("yes");
          }
          if(state is SearchStates_ErrorState){
            toastShow(msg: state.errors.toString(), state:toastStates.WARNING );
            toastShow(msg: "لا يوجد مرض ب هذا الرقم", state:toastStates.WARNING );
            print(state.errors.toString());
          }
        },

      ),
    );
  }
}

Widget UISearchScreen(context , PatientDataModel? model ) => Scaffold(
  appBar: AppBar(),
  body: Center(
    child: Column(
      children:
      [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18.0),
          child: TextFormField(
            controller: SearchCubit.get(context).Search,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: " Inter N-ID Patient "
            ),
            onFieldSubmitted: (value){
              SearchCubit.get(context).DoctorSearchNID(SearchCubit.get(context).Search.text);

            },
          ),
        ),
             SizedBox(height: 50),
        model != null ?
             InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
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

                                       '${model?.data?.pationt?.image}',
                                    ),
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
                                          "${model?.data?.pationt?.fristName}   ",/*${model.data?.pationts[index].lastName} */
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
                                          '${model?.data?.pationt?.phoneNumber}',
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
                                          '${model?.data?.pationt?.nationalId}',
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
                    DoctorCubit().getData_Patient(id:model?.data?.pationt?.nationalId ,context: context);
                  },
                )
            : Container(
          height: 10,
          width: 10,
          color: Colors.red,
        )

      ],
    ),
  ),
);
//InkWell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(1),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.shade400,
//                               blurRadius: 2,
//                               spreadRadius: 1,
//                               offset: Offset(0, .7),
//                               blurStyle: BlurStyle.inner),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric( horizontal:  14.0 , vertical: 5),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 65,
//                               height: 65,
//                               decoration: BoxDecoration(
//                                   color: Colors.orangeAccent,
//                                   borderRadius:
//                                   BorderRadius.circular(50),
//                                   image: DecorationImage(
//
//                                     image: NetworkImage(
//
//                                        '${modelPatient?[index].data?.pationt?.image}',
//                                     ),
//                                   )),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               child: Container(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children:  [
//                                         Text(
//                                           "${modelPatient?[index].data?.pationt?.fristName}   ",/*${model.data?.pationts[index].lastName} */
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               color: Colors.black,
//                                               fontWeight:
//                                               FontWeight.bold),
//                                           maxLines: 1,
//                                           overflow:
//                                           TextOverflow.ellipsis,
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 6,
//                                     ),
//                                     Container(
//                                       height: 1,
//                                       width: double.infinity,
//                                       color: Colors.grey,
//                                     ),
//                                     SizedBox(
//                                       height: 6,
//                                     ),
//                                     Row(
//                                       children:  [
//                                         const Text(
//                                           'Phone number',
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontWeight:
//                                               FontWeight.w400),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '${modelPatient?[index].data?.pationt?.phoneNumber}',
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//                                     Row(
//                                       children:  [
//                                         const Text(
//                                           'Patient code',
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontWeight:
//                                               FontWeight.w400),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '${modelPatient?[index].data?.pationt?.nationalId}',
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   onTap: (){
//                     DoctorCubit.get(context).getData_Patient(id:modelPatient?[index].data?.pationt?.nationalId);
//                     navigateTo(context, PatientDetails());
//                   },
//                 );