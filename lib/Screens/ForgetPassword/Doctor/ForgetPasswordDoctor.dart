import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgetPasswordDoctor extends StatelessWidget {
  const ForgetPasswordDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height =  0;
    var ssss = TextEditingController() ;
    return  Scaffold(

      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children:
          [
            Column(
              children: [
                SizedBox(height: 135,),
                Image(image: AssetImage("assets/ForgetPassword.png" ,),),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children:
                [
                  SizedBox(height: 50,),
                  Text("Forget Password " , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab' , color: Colors.black),),
                  SizedBox(height: 150,),
                  Text("E-mail " , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab'),),
                  TextFormField(
                    controller: ssss,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 70,),
                  Text("Contact Number" , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab'),),
                  TextFormField(
                    controller: ssss,
                    keyboardType: TextInputType.number,),
                  SizedBox(height: 70,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 225,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.only(topLeft: Radius.circular(35) , bottomRight: Radius.circular(35)),
                          color: HexColor("087A7A"),
                        ),
                        child: Center(child: Text("Submit" , style:  TextStyle( fontSize: 28 ,fontWeight: FontWeight.normal, fontFamily:  'MontaguSlab', color: Colors.white))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
