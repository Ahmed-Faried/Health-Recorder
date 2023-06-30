import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Screens/Edit%20Profile/ProfileCubit/ProfileCubit.dart';
import 'package:shop_app/Screens/Edit%20Profile/ProfileCubit/ProfileStates.dart';

import '../../Components/components.dart';
import '../../Components/const.dart';
import '../../Network/local/shared_preferences.dart';
import '../BottomDoctorScreens/DoctorCubit/DoctorCubit.dart';
import '../Register/RegisterPatient/Cubit_Patient_Register/Patient_Register_Cubit.dart';

class EditProfileDoctor extends StatelessWidget {
  const EditProfileDoctor({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
            // if(state is DoctorUpdateSuccessState){
            //   DoctorCubit().getData_Doctor();
            // }

        },
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: Text("Edit Profile"),
              ),
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
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child:
                                            Image.network(
                                                 "${doctorDataModel?.data?.doctor.image}",
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: 100,
                                              )
                                            //   Image.network(
                                            //    "${doctorDataModel?.data?.doctor.image}",
                                            //   fit: BoxFit.cover,
                                            //   width: 100,
                                            //   height: 100,
                                            // )
                                            //   :
                                            // Image(
                                            //   //to show image, you type like this.
                                            //   image: FileImage(File(ProfileCubit.get(context).image!.path)),
                                            //   fit: BoxFit.cover,
                                            //   width: 100,
                                            //   height: 100
                                            // ),

                                              //NetworkImage(
                                              //     'https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'
                                              //  ),

                                            ),
                                          ),

                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        InkWell(
                                          child: Text(
                                            "Change your picture",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: HexColor("5DCDC6"),
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    HexColor("5DCDC6"),
                                                decorationThickness: .8,
                                                decorationStyle:
                                                    TextDecorationStyle.solid),
                                          ),
                                          onTap: () {

                                            ProfileCubit.get(context).myAlert(context);
                                          },
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height: 75,

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("First name"),
                                      Expanded(
                                        child: PhysicalModel(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: HexColor('E3F8F6'),
                                          child: TextFormField(
                                            controller:
                                                ProfileCubit.get(context)
                                                    .FirstnameDoctorController,
                                            keyboardType: TextInputType.text,
                                            onTap: () {},
                                            validator: (vaule) {
                                              if (vaule!.isEmpty) {
                                                toastShow(
                                                    msg: 'UserName isEmpty',
                                                    state: toastStates.WARNING);
                                                return '.';
                                              }
                                            },
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              hintText: "Doctor name",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              prefixText: "  ",
                                              border: InputBorder.none,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ), //Username
                                ),
                                Spacer(),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height: 75,

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Last name"),
                                      Expanded(
                                        child: PhysicalModel(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: HexColor('E3F8F6'),
                                          child: TextFormField(
                                            controller:
                                                ProfileCubit.get(context)
                                                    .LastnameDoctorController,
                                            keyboardType: TextInputType.text,
                                            onTap: () {},
                                            validator: (vaule) {
                                              if (vaule!.isEmpty) {
                                                toastShow(
                                                    msg: 'UserName isEmpty',
                                                    state: toastStates.WARNING);
                                                return '.';
                                              }
                                            },
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              prefixText: "  ",
                                              hintText: "Doctor name",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
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
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            EditProfileRow(
                                context,
                                "E-mail",
                                "Doctorname@gmail.com",
                                ProfileCubit.get(context)
                                    .E_mailDoctorController),
                            SizedBox(
                              height: 5,
                            ),
                            EditProfileRow(
                                context,
                                "Address",
                                "El Aresh  - University Street ",
                                ProfileCubit.get(context)
                                    .AddressDoctorController),
                            SizedBox(
                              height: 5,
                            ),
                            EditProfileRow(
                                context,
                                "Contact number",
                                "01234567890",
                                ProfileCubit.get(context)
                                    .ContactnumberDoctorController),
                            SizedBox(
                              height: 20,
                            ),

                            InkWell(
                              child: Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.green, //HexColor('5DCDC6')
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
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
                              onTap: () {
                                ProfileCubit.get(context).upData_Doctor(
                                    id: CacheHelper.getData(key:'idDoctor'),
                                    firstName: ProfileCubit.get(context)
                                        .FirstnameDoctorController.text,
                                    lastName: ProfileCubit.get(context)
                                        .LastnameDoctorController.text,
                                    email: ProfileCubit.get(context)
                                        .E_mailDoctorController.text,
                                    address: ProfileCubit.get(context)
                                        .AddressDoctorController.text,
                                    number: ProfileCubit.get(context)
                                        .ContactnumberDoctorController.text);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
