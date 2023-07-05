import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Screens/PatientScreens/AddRecordHistoryScreens/addDiagnosesScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showChronicDiseasesScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showDiagnosesScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showGeneticDiseasesScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showHealthProblemScreen.dart';
import 'package:shop_app/Screens/PatientScreens/ShowRecordHistoryScreens/showSurgicalHistoryScreen.dart';
import 'package:shop_app/moudel/LoginModel/DoctorDataMoudleing.dart';

import '../Network/local/shared_preferences.dart';
import '../Screens/PatientScreens/AddRecordHistoryScreens/addChronicDiseasesScreen.dart';
import '../Screens/PatientScreens/AddRecordHistoryScreens/addGeneticDiseasesScreen.dart';
import '../Screens/PatientScreens/AddRecordHistoryScreens/addHealthProblemScreen.dart';
import '../Screens/PatientScreens/AddRecordHistoryScreens/addSurgicalHistoryScreen.dart';
import '../Screens/X-ray Patient/X-rayScreen.dart';
import '../moudel/LoginModel/PatientDataMoudleing.dart';
import 'const.dart';

//     Widget buildTaskItem(Map model , context) => Dismissible(
//  key: Key(model['id'].toString()),
//   child:   Column(
//     children:
//     [
//
//       Padding(
//
//         padding: const EdgeInsets.all(16.0),
//
//         child: Row(
//
//           children:
//
//           [
//
//             CircleAvatar(
//
//               radius: 40,
//
//               backgroundColor: Colors.green,
//
//               child: Text("${model['time']}" ,style: const TextStyle(fontSize: 16 , color:Colors.black, )),
//
//             ),
//
//             const SizedBox(width: 10,),
//
//             Expanded(
//
//               child: Column(
//
//                 children:
//
//                 [
//
//                   Row(
//
//                     children:
//
//                     [
//
//                       Text("${model['title']}",style: const TextStyle(fontSize: 22 , ),),
//
//                     ],
//
//                   ),
//
//                   Row(
//
//                     children:
//
//                     [
//
//                       Text("${model['date']}",style: const TextStyle(fontSize: 16 , color:Colors.grey, ),),
//
//                     ],
//
//                   ),
//
//                 ],
//
//               ),
//
//             ),
//
//             IconButton(
//
//                 onPressed: (){
//
//
//
//                   cubitApp.get(context).updateData(status: "done", id: model['id']);
//
//                 },
//
//                 icon:const Icon(Icons.done_outline_sharp, color: Colors.green,size: 30,)),
//
//
//
//             const SizedBox(width: 5,),
//
//             IconButton(
//
//                 onPressed: (){
//
//                   cubitApp.get(context).updateData(status: "archive", id: model["id"]);
//
//
//
//                 },
//
//                 icon:const Icon(Icons.archive_rounded,color: Colors.black,size: 30)),
//
//
//
//           ],
//
//         ),
//
//       ),
//
//     ],
//
//   ),
//   onDismissed: (direction)
//   {
//    cubitApp.get(context).deleteData(id: model['id']);
//   } ,
// );

//     Widget Conditionaltasks ({ required List<Map> tasks }) =>
//     ConditionalBuilder(
//   condition: tasks.length > 0,
//   builder: (context) {
//     return ListView.separated(
//
//       itemBuilder: (context,index) => buildTaskItem(tasks[index], context),
//       separatorBuilder: (context, index) => Container(
//         width: double.infinity,
//         height: 1,
//         color: Colors.blueGrey[300],
//       ),
//       itemCount: tasks.length ,
//       scrollDirection: Axis.vertical,
//     );
//   },
//   fallback: (BuildContext context) {
//     return Center(
//       child: Column(
//
//          mainAxisAlignment: MainAxisAlignment.center,
//         children:  const [
//
//           Icon(Icons.menu,size: 99,
//             color: Colors.blueGrey,),
//           Text("Not Tasks Yet , Please Add Some Tasks " , style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold ,
//             color: Colors.blueGrey,
//           ),)
//         ],
//       ),
//     );
//   },
// );

Widget CardArticleBulder(article, context) => InkWell(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 135,
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 130,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Text(
                      "${article['title']}",
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );

Widget MyDivider(context, x) {
  var nos = MediaQuery.of(context).size.width / x;
  return Container(
    height: 1,
    width: nos,
    color: Colors.grey,
  );
}

Widget newDivider(context) {
  return Container(
    height: 1,
    width: MediaQuery.of(context).size.width,
    color: Colors.grey,
  );
}

Widget ScreenArticleBulder(list) =>
    ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) =>
              CardArticleBulder(list[index], context),
          separatorBuilder: (BuildContext context, int index) =>
              MyDivider(context, 1),
        ),
    fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ));

void navigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

void toastShow({required msg, required toastStates state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum toastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(toastStates state) {
  Color color;
  switch (state) {
    case toastStates.ERROR:
      color = Colors.red;
      break;
    case toastStates.SUCCESS:
      color = Colors.green;
      break;
    case toastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget defaultButton({
  double? width = double.infinity,
  Color? background = Colors.blue,
  bool? isUpperCase = true,
  double? radius = 3.0,
  required Function function,
  String? text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          "s",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: background,
      ),
    );

FieldFromRegistr({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function onChanged,
  required Function()? onTap,
  required Function suffixPressed,
  bool isPassword = false,
  String? Function(String?)? validator,
   String? label,
  IconData? prefix  ,
  IconButton? suffix,
  bool isClickable = true,
  bool obscureText = false,
}) =>
    PhysicalModel(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
      elevation: 2.0,
      shadowColor: Colors.grey,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: type,
        onTap:(){ onTap;},
        onChanged: (value) {},
        validator: validator ,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 18.0, right: 8),
            child: Icon(prefix),
          ),
          suffixIcon: suffix,
          label: Text(
            label!,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );

// TextFormField(
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       onFieldSubmitted: onSubmit(),
//       onChanged: (value){},
//       onTap: onTap(),
//       validator: (value){},
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(
//           prefix,
//         ),
//         suffixIcon: suffix != null ? IconButton(
//           onPressed: suffixPressed(),
//           icon: Icon(
//             suffix,
//           ),
//         )
//             : null,
//         border: OutlineInputBorder(),
//       ),
//     );

Widget cardAccount(context, String title, firstIcon, Screen) => Padding(
      padding: EdgeInsets.only(bottom: 15),
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
                  firstIcon,
                  size: 30,
                  color: Colors.blue[300],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 13,fontFamily: 'MontaguSlab'),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 30,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          navigateTo(context, Screen);
        },
      ),
    );

Widget cardHelpCenter(context, String title, firstIcon, Screen) => Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 55,
          decoration: BoxDecoration(
            color: HexColor('E2EFEE'),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Icon(
                  firstIcon,
                  size: 30,
                  color: HexColor("5DCDC6"),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        onTap: () {
          navigateTo(context, Screen);
        },
      ),
    );

Widget CardPatientDetialsDoctor(
        context, String text1, String text2, IconData icon, Widget0 ,Widget1) =>
    Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.12,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.35),
                offset: Offset(0, 3),
                blurRadius: 8,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                " $text1",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: 'MontaguSlab',
                                ),
                              ),
                            ),
                            InkWell(
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'MontaguSlab',
                                ),
                              ),
                              onTap: () {
                                navigateTo(context, Widget0);
                              },
                            ),
                            SizedBox(width: 5,),
                            InkWell(
                              child: const Text(
                                "View",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'MontaguSlab',
                                ),
                              ),
                              onTap: () {
                                navigateTo(context, Widget1);
                              },
                            )

                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                " $text2",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'MontaguSlab',
                                ),
                              ),
                            ),
                            Icon(icon)
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
    );

Widget CardPatientDetialsPatient(
        context, String text1, String text2, IconData icon, Widget) =>
    Row(
      children: [
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.12,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  " $text1",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87,
                                    fontFamily: 'MontaguSlab',
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  " $text2",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    fontFamily: 'MontaguSlab',
                                  ),
                                ),
                              ),
                              Icon(icon,color: Colors.grey,)
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
          onTap: () {
            navigateTo(context, Widget);
          },
        ),
      ],
    );


Widget EditProfileRow(context, String title, String hint, controller) => Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.12,
          height: 75,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Expanded(
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(7),
                  color: HexColor('E3F8F6'),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    onTap: () {},
                    validator: (vaule) {
                      if (vaule!.isEmpty) {
                        toastShow(
                            msg: '$title isEmpty', state: toastStates.WARNING);
                        return '.';
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixText: "  ",
                      border: InputBorder.none,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ), //Username
        ),
      ],
    );


Widget RecordHistoryBodyShow(context, String text1, String text2,
        String ApiText1, String ApiText2) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        text1,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            ApiText1,
                            maxLines: null,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        text2,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            ApiText2,
                            maxLines: null,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget RecordHistoryBodyAdd(
        context,
        TextEditingController ControllerProblem,
        TextEditingController ControllerSolve,
        String HintTextProblem,
        String HintTextSolve,
    void Function()? ontap ) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: ControllerProblem,
                          minLines: 1,
                          maxLines: null,
                          cursorColor: Colors.grey[300],
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[800]),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            hintText: ' $HintTextProblem',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Icon(Icons.coronavirus,
                                  color: Colors.grey[400]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: ControllerSolve,
                          minLines: 1,
                          maxLines: null,
                          cursorColor: Colors.grey[300],
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[800]),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            hintText: ' $HintTextSolve',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Icon(Icons.medical_services,
                                  color: Colors.grey[400]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: HexColor('5DCDC6'),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap:(){
                ontap ;
              }  ,

            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );

Widget RecordHistoryAppBarTitle(String title) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );

Widget UI_PatientDetials(PatientDataModel model,DoctorDataModel Do_model, context) =>
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.35),
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   width: 65,
                    //   height: 65,
                    //   decoration: BoxDecoration(
                    //       color: Colors.orangeAccent,
                    //       borderRadius: BorderRadius.circular(50),
                    //       image: DecorationImage(
                    //         image: NetworkImage(
                    //             'https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'),
                    //       )),
                    // ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(
                          '${model.data?.pationt?.image}'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${model.data?.pationt?.fristName} ${model.data?.pationt?.lastName}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${model.data?.pationt?.gender}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                TextButton(onPressed: (){
                                  HomeCubit.get(context).addNIDPatient(DoctorID: Do_model.data?.doctor.id, NID_PAtient: model.data?.pationt?.nationalId);
                                }, child: Container(
                                    decoration: BoxDecoration(
                                      // color: HexColor("5DCDC6"),
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 5),
                                      child: Center(child: Text("Favorite" , style: TextStyle(color: HexColor("5DCDC6"),),)),
                                    )))
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
                        offset: Offset(0, 3),
                        blurRadius: 8,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Age",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${model.data?.pationt?.age}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      " years",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
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
                        offset: Offset(0, 3),
                        blurRadius: 8,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Blood type",
                                      style: TextStyle(
                                        fontSize: 12,
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
                                    // InkWell(
                                    //   child: const Text(
                                    //     "Edit",
                                    //     style: TextStyle(
                                    //       fontSize: 16,
                                    //       color: Colors.blue,
                                    //       decoration: TextDecoration.underline,
                                    //       decorationColor: Colors.blue,
                                    //     ),
                                    //   ),
                                    //   onTap: () {
                                    //     print("edit Blood type ");
                                    //   },
                                    // )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "  ${model.data?.pationt?.bloodType}",
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
                                              " X-rays & Medical tests",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                fontFamily: 'MontaguSlab',
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
                                                "View your Tests",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  fontFamily: 'MontaguSlab',
                                                ),
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
                navigateTo(context, X_rayPatient(imageUrls: model.data!.pationt?.x_ray ));
              },
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
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1.12,
                          decoration: BoxDecoration(
                            color: HexColor("5DCDC6"),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0 ,vertical: 3),
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
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              " Diagnostics recording",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: 'MontaguSlab',
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: 'MontaguSlab',
                                              ),
                                            ),
                                            onTap: () {
                                              navigateTo(context,DiagnosesAdd() );
                                            },
                                          ),
                                          SizedBox(width: 5,),
                                          InkWell(
                                            child: const Text(
                                              "View",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: 'MontaguSlab',
                                              ),
                                            ),
                                            onTap: () {
                                              navigateTo(context, DiagnosesShow());
                                            },
                                          )
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  fontFamily: 'MontaguSlab',
                                                ),
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
                navigateTo(context, DiagnosesAdd());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CardPatientDetialsDoctor(
              context,
              "Chronic diseases",
              "The disease name.....",
              Icons.coronavirus_sharp,
              ChronicDiseasesAdd(),
              ChronicDiseasesShow(),
            ),
            const SizedBox(
              height: 20,
            ),
            CardPatientDetialsDoctor(
              context,
              "health problem",
              "Morem ipsum dolor sit amet, consectetur.......",
              Icons.library_books,
              HealthProblemAdd(),
              HealthProblemShow(),
            ),
            const SizedBox(
              height: 20,
            ),
            CardPatientDetialsDoctor(
              context,
              "Surgical history",
              " The surgery type.....",
              Icons.adb_rounded,
              SurgicalHistoryAdd(),
              SurgicalHistoryShow(),
            ),
            const SizedBox(
              height: 20,
            ),
            CardPatientDetialsDoctor(
              context,
              "Genetic disease ",
              " The disease name.....",
              Icons.coronavirus_sharp,
              GeneticDiseasesAdd(),
              GeneticDiseasesShow(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );

Widget ScreensPatientShow(String AppBarTitle,  context,
        int? length, FirstTitle, SecondTitle, ApiFirstData, ApiSecondData
    ) =>
    Scaffold(
      appBar: AppBar(
        title: RecordHistoryAppBarTitle("$AppBarTitle     "),
      ),
      body: ConditionalBuilder(
        condition: patientDataModel != null,
        builder: (BuildContext context) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$FirstTitle",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${ApiFirstData[index].name}",
                                  maxLines: null,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "$SecondTitle",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${ApiFirstData[index].medicen}",
                                  maxLines: null,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount:
                length, //LoginScreenCubit.get(context).patientDataModel?.data?.pationt?.surgicalOperations?.length
          );
        },
        fallback: (BuildContext context) {
          return CircularProgressIndicator();
        },
      ),
    );



void savedatafromshard(
{
  required idDoctor,
  required id,
  required department,
  required token,
  required valueidDoctor,
  required valueid,
  required valuedepartment,
  required valuetoken,
}

    ){


  CacheHelper.saveData(
      key: idDoctor /*'idDoctor'*/,
      value: valueidDoctor);//state.doctorDataModel.data?.doctor.id
  CacheHelper.saveData(
      key: department /*'department'*/,
      value: valuedepartment);//state.doctorDataModel.data?.doctor.department
  CacheHelper.saveData(
      key: token /*'token'*/,
      value: valuetoken);//state.doctorDataModel.token
  CacheHelper.saveData(
      key: idDoctor /*'idDoctor'*/,
      value: valueidDoctor);//state.doctorDataModel.data?.doctor.id
}



void RemoveCacheHelper (){

  CacheHelper.RemveData(key:'token') ;
  CacheHelper.RemveData(key:'department') ;
  CacheHelper.RemveData(key:'id') ;
  CacheHelper.RemveData(key:'idDoctor') ;
  CacheHelper.RemveData(key:'National_ID') ;
  CacheHelper.RemveData(key:'imagePatient') ;
  CacheHelper.RemveData(key:'imageDoctor') ;
}


void SaveCacheHelper (){



}