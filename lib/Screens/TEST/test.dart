import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/Screens/LoginAndRegister/LoginAndRegister.dart';
import 'package:shop_app/Screens/TEST/test2.dart';

class SignUpDriver extends StatefulWidget {
  const SignUpDriver({Key? key}) : super(key: key);

  @override
  State<SignUpDriver> createState() => _SignUpDriverState();
}

class _SignUpDriverState extends State<SignUpDriver> {

  String? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img as String?;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height*0.04 ,),
                Row(
                  children:  [
                    IconButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegister())),
                        icon: const Icon(Icons.arrow_back)),
                    SizedBox(width: width*0.22 ,),
                    const Text(
                      'Welcome !',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01 ,),
                const Text(
                  'Please enter your information to create your account.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height*0.02,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05, bottom: height*0.02),
                  child: const Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                  child: TextFormField(
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      prefixIconColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Phone number',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      prefixIcon: const Icon(Icons.phone),
                      prefixIconColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'National ID',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      prefixIcon: const Icon(Icons.credit_card),
                      prefixIconColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Ambulance Number',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      prefixIcon: const Icon(Icons.emergency_rounded),
                      prefixIconColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                  child: TextFormField(
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Personal liscence',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                            Icons.upload
                        ),
                        onPressed: () => myAlert(),
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                  child: TextFormField(
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Authority ID',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                            Icons.upload
                        ),
                        onPressed: () => myAlert(),
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: width*0.05),
                      child: FloatingActionButton(
                        onPressed:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpDriver2())),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 16,
                        ),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}