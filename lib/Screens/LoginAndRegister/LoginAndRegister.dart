import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/Login/LoginDoctorScreen.dart';
import 'package:shop_app/Screens/Login/LoginPatientScreen.dart';
import 'package:shop_app/Screens/Register/RegisterDr/RegisterDrScreen.dart';
import 'package:shop_app/Screens/Register/RegisterPatient/RegisterPatientScreen1.dart';

class LoginAndRegister extends StatelessWidget {
  const LoginAndRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height ;

    var width = MediaQuery.of(context).size.width ;

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: HexColor("44B5AE"),
        statusBarIconBrightness:
        Brightness.dark //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.bottomLeft,
            child: const Image(
              image: AssetImage('assets/bot-L.png'),
              alignment: Alignment.bottomLeft,
              width: 85,
              height: 400,
              fit: BoxFit.fill,
            ),
          ), // Image bot-L.png STACK
           SizedBox(
            width: double.infinity,
            height: 95,
            child: Image(
              image: AssetImage('assets/top.png'),
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.colorDodge,
            ),
          ), // Image top.png STACK
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, //19/4/2023
              children: [
                 SizedBox(height: height * .105),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   width: 150 ,
                    //   height: 150,
                    //   decoration: BoxDecoration(
                    //
                    //     borderRadius: BorderRadius.circular(50),
                    //      color: Colors.white,
                    //     shape: BoxShape.rectangle,
                    //
                    //   ),
                    //
                    //   child: Image(image: AssetImage('assets/Logo.png' ,),
                    //
                    //     ),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Image(
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/Logo.png"),
                          //NetworkImage(
                          //     'https://images.theconversation.com/files/247814/original/file-20181128-32230-mojlgr.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'
                          //  ),
                        ),
                      ),
                    ),
                  ],
                ), // Image Logo.png
                 SizedBox(height: height * .029 ),//20
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Health",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    )
                  ],
                ), // Text Health
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Recorder",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    )
                  ],
                ), // Text Recorder
                 SizedBox(
                  height: height * .087 ,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: DropdownButton(
                    underline: Container(),
                    icon: Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    hint: Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                          color: HexColor("#5DCEC8"),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ))),
                    elevation: 8,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    menuMaxHeight: 130,
                    items: [
                      DropdownMenuItem(
                        value: 'Page 1',
                        child: TextButton(
                            onPressed: () {
                              RemoveCacheHelper();

                              navigateTo(context, LoginDoctorScreen());
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor("#5DCEC8")),
                              elevation: MaterialStateProperty.all(2),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' Doctor ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      DropdownMenuItem(
                        value: 'Page 2',
                        child: TextButton(
                            onPressed: () {
                              RemoveCacheHelper();

                              navigateTo(context, LoginPatientScreen());
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor("#5DCEC8")),
                              elevation: MaterialStateProperty.all(2),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  ' Patient ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                    onChanged: (Object? value) {},
                  ),
                ),
                // TextButton(
                //     onPressed:(){
                //       navigateTo(context, LoginScreen());
                //     },
                //     style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(HexColor("#5DCEC8")),
                //       elevation: MaterialStateProperty.all(2),
                //       shadowColor: MaterialStateProperty.all(Colors.grey),
                //     ),
                //     child: const Text('              Sign in              ',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.white,
                //   ),)), // Sign in Button &&  backgroundColor #5DCEC8
                 SizedBox(
                  height: height * .029,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: DropdownButton(
                    underline: Container(),
                    icon: Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    hint: Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                          color: HexColor("#5DCEC8"),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: const Text('Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                )))),
                    elevation: 8,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    menuMaxHeight: 130,
                    items: [
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.bottomCenter,
                        value: 'Page 1',
                        child: TextButton(
                            onPressed: () {
                              RemoveCacheHelper();
                              navigateTo(context, RegisterDrScreen());
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor("#5DCEC8")),
                              elevation: MaterialStateProperty.all(2),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' Doctor ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      DropdownMenuItem(
                        value: 'Page 2',
                        child: TextButton(
                            onPressed: () {
                              RemoveCacheHelper();

                              navigateTo(context, RegisterPatientScreen());
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor("#5DCEC8")),
                              elevation: MaterialStateProperty.all(2),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  ' Patient ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                    onChanged: (Object? value) {},
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed:(){
                //         navigateTo(context, RegisterDrScreen());
                //       },
                //       style: ButtonStyle(
                //         backgroundColor:MaterialStateProperty.all(Colors.white),
                //         elevation: MaterialStateProperty.all(2),
                //         shadowColor: MaterialStateProperty.all(Colors.grey),
                //
                //       ), child: const Text('         Register Doctor         ',
                //     style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.black,
                //     ),)),
                //
                //   ],
                // ),
                 SizedBox(
                  height: height * .015,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //
                //   children: [
                //
                //     TextButton(
                //         onPressed:(){
                //           navigateTo(context, RegisterPatientScreen());
                //         },
                //         style: ButtonStyle(
                //           backgroundColor:MaterialStateProperty.all(Colors.white),
                //           elevation: MaterialStateProperty.all(2),
                //           shadowColor: MaterialStateProperty.all(Colors.grey),
                //
                //         ), child: const Text('        Register Patient        ',
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w400,
                //         color: Colors.black,
                //       ),)),
                //
                //   ],
                // ),// Register Button  &&  backgroundColor white
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Text(
                              "By crating an account or signing you ",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            " agree to our",
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(" Terms and Conditions",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              )),
                        ],
                      )
                    ],
                  ),
                ), //Two Row Text "By crating an account or signing you" && "agree to our"
              ],
            ),
          ) // UI & UX Screen
        ],
      ),
    );
  }
}
