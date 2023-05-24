import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Components/components.dart';
import '../../Network/local/shared_preferences.dart';
import 'ProfileCubit/ProfileCubit.dart';
import 'ProfileCubit/ProfileStates.dart';

class EditProfilePatient extends StatelessWidget {
  const EditProfilePatient({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)  => ProfileCubit() ,
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context , state )  {},
        builder: (context , state ) { return Scaffold(

          appBar:AppBar(
            title: Text("Edit Profile"),
          ) ,
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children:
                              [
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
                                SizedBox(height: 6),
                                Row(
                                  children:  [
                                    InkWell(
                                      child: Text(
                                        "Change your picture",

                                        style: TextStyle(fontSize: 18 , color:  HexColor("5DCDC6") ,
                                            decoration: TextDecoration.underline ,
                                            decorationColor: HexColor("5DCDC6") ,
                                            decorationThickness: .8,
                                            decorationStyle: TextDecorationStyle.solid
                                        ),
                                      ),
                                      onTap: (){},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(

                              width: MediaQuery.of(context).size.width/2.5,
                              height: 75,

                              child:    Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text("First name" ),
                                  Expanded(
                                    child: PhysicalModel(
                                      borderRadius: BorderRadius.circular(7),
                                      color:HexColor('E3F8F6'),
                                      child:  TextFormField(
                                        controller: ProfileCubit.get(context).firstNamePatientController,
                                        keyboardType:TextInputType.text ,
                                        onTap: (){},
                                        validator: (vaule){

                                          if(vaule!.isEmpty){
                                            toastShow(msg: 'UserName isEmpty', state: toastStates.WARNING);
                                            return '.';

                                          }
                                        },
                                        style: TextStyle(color: Colors.black),
                                        decoration:  const InputDecoration(
                                          hintText: "Patient name",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          prefixText: "  ",

                                          border: InputBorder.none,
                                          enabledBorder: UnderlineInputBorder(
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
                              ),//Username


                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width/2.4,
                              height: 75,

                              child:    Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text("Last name" ),
                                  Expanded(
                                    child: PhysicalModel(
                                      borderRadius: BorderRadius.circular(7),
                                      color:HexColor('E3F8F6'),
                                      child:  TextFormField(
                                        controller:  ProfileCubit.get(context).lastNamePatientController,
                                        keyboardType:TextInputType.text ,
                                        onTap: (){},
                                        validator: (vaule){

                                          if(vaule!.isEmpty){
                                            toastShow(msg: 'UserName isEmpty', state: toastStates.WARNING);
                                            return '.';

                                          }
                                        },
                                        style: TextStyle(color: Colors.black),
                                        decoration:  const InputDecoration(
                                          prefixText: "  ",
                                          hintText: "Patient name",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          enabledBorder: UnderlineInputBorder(
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
                              ),//Username


                            ),

                          ],
                        ),
                        SizedBox(height: 5,),
                        EditProfileRow(context,"E-mail" ,"Patient_name@gmail.com", ProfileCubit.get(context).emailPatientController),
                        SizedBox(height: 5,),
                        EditProfileRow(context,"Age" ,"22", ProfileCubit.get(context).agePatientController),
                        SizedBox(height: 5,),
                        EditProfileRow(context,"Contact number" ,"01234567890", ProfileCubit.get(context).numberPatientController),
                        SizedBox(height: 20,),
                        InkWell(
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.green,//HexColor('5DCDC6')
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            ProfileCubit.get(context).upData_Patient(
                                id: CacheHelper.getData(key:'id'),
                                firstName: ProfileCubit.get(context)
                                    .firstNamePatientController.text,
                                lastName: ProfileCubit.get(context)
                                    .lastNamePatientController.text,
                                email: ProfileCubit.get(context)
                                    .emailPatientController.text,
                                age: ProfileCubit.get(context)
                                    .agePatientController.text,
                                number: ProfileCubit.get(context)
                                    .numberPatientController.text
                            );

                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );},
      ),
    );
  }
}
