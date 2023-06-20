import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/Screens/TEST/test.dart';


class SignUpDriver2 extends StatefulWidget {
  const SignUpDriver2({Key? key}) : super(key: key);

  @override
  State<SignUpDriver2> createState() => _SignUpDriver2State();
}

class _SignUpDriver2State extends State<SignUpDriver2> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*0.06,),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpDriver())),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  SizedBox(height: height*0.06,),
                  //if image not null show the image
                  //if image null show text
                  image != null
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 86.0,
                      height: 86.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          //to show image, you type like this.
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    ),
                  )
                      : Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Color(0xFFFBF0F0),
                    ),
                    width: 86.0,
                    height: 86.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      myAlert();
                    },
                    child: Text(
                      'Upload profile picture',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.12,),
              Padding(
                padding:  EdgeInsets.only(left: width*0.05, right: width*0.05),
                child: SizedBox(
                  height: height*0.06,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration:  InputDecoration(
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                      suffixIconColor: Colors.red,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Set password',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      fillColor: const Color(0xFFFBF0F0),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFFFBF0F0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.13,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpDriver())),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width*0.7, height*0.06),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
