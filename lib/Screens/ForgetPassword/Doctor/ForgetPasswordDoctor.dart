import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Screens/ForgetPassword/Doctor/cubit/ForgetDrCubit.dart';

import '../../../Components/components.dart';
import '../../BottomDoctorScreens/HomePageDoctor/HomePageDoctorScreen.dart';
import 'cubit/ForgetDrStates.dart';

class ForgetPasswordDoctor extends StatelessWidget {
  const ForgetPasswordDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context) => ForgetPassDoctor(),
      child: BlocConsumer<ForgetPassDoctor ,ForgetPassDoctorStates>(
        listener: (context ,state) {

          if(state is ForgetPassDoctorSuccessStates){

            toastShow(msg: " تم تسجيل الدخول بنجاح \n  برجاء تغيير كلمة السر  ", state: toastStates.SUCCESS);

            navigateTo(context, HomePageDoctorScreen());

          }
          if(state is ForgetPassDoctorErrorStates){

            toastShow(msg: "incorrect email or Phone Number  ", state: toastStates.ERROR);
          }

        },

        builder: (context ,state) { return  Scaffold(

          appBar: AppBar(),

          body: SingleChildScrollView(
            child: Stack(
              children:
              [
                Column(
                  children: [
                    SizedBox(height: 50,),
                    Image(image: AssetImage("assets/ForgetPassword.png" ,),),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children:
                    [
                      SizedBox(height: 10,),
                      Text("Forget Password " , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab' , color: Colors.black),),
                      SizedBox(height: 100,),
                      Text("E-mail " , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab'),),
                      TextFormField(
                        controller: ForgetPassDoctor.get(context).email,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),

                      ),
                      SizedBox(height: 70,),
                      Text("Phone Number " , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab'),),
                      TextFormField(
                        controller: ForgetPassDoctor.get(context).phoneNumber,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                      ),
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
                            child: Center(child: InkWell(
                                onTap: (){

                                  ForgetPassDoctor.get(context).ForgetPassDoctorFunction(
                                    email:  ForgetPassDoctor.get(context).email.text ,
                                    phoneNumber:  ForgetPassDoctor.get(context).phoneNumber.text,
                                  );
                                },
                                child: Text("Submit" , style:  TextStyle( fontSize: 28 ,fontWeight: FontWeight.normal, fontFamily:  'MontaguSlab', color: Colors.white)))),
                          ),
                        ],
                      )
                    ],
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
