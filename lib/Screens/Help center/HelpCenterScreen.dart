import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Screens/Edit%20Profile/EditProfileDoctorScreen.dart';

import '../../Components/components.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Help Center"),
        elevation: 0,
        backgroundColor: HexColor('5DCDC6'),
      ) ,
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: 
            [
              Container(
                width: double.infinity,
                height: 260,
                color: HexColor('5DCDC6'),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
              ),

              Image(image: AssetImage("assets/Help center Image.png"),
              width: double.infinity / 2.0,
              height: 250,

              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
            Text("Experiencing problems?",  style: TextStyle(color: Colors.black ,fontSize: 16),),
            ]
            ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
          [
            Text("Please get in touch with us for support" ,  style: TextStyle(color: Colors.grey ,fontSize: 15),),
          ],),
          Spacer(),
          cardHelpCenter(context , "chat with us" ,Icons.maps_ugc_sharp,),
          cardHelpCenter(context , "Email us" ,Icons.mail_sharp,),
          cardHelpCenter(context , "Call us" ,Icons.call,),
          Spacer(),

        ],
      ) ,
    );
  }
}
