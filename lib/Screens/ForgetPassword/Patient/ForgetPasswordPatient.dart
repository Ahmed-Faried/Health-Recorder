import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/ForgetPassword/Patient/cubit/ForgetPatientStates.dart';

import '../../BottomPatientScreens/HomePagePatient/HomePagePatientScreen.dart';
import 'cubit/ForgetPatientCubit.dart';

class ForgetPasswordPatient extends StatelessWidget {
  const ForgetPasswordPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ForgetPassPatient(),
      child: BlocConsumer<ForgetPassPatient ,ForgetPassPatientStates>(
        listener: (context ,state) {

          if(state is ForgetPassPatientSuccessStates){

            toastShow(msg: "تم تسجيل الدخول بنجاح \n  برجاء تغيير كلمة السر ", state: toastStates.SUCCESS);
            navigateTo(context, HomePagePatientScreen());

          }
          if(state is ForgetPassPatientErrorStates){

            toastShow(msg: "incorrect email or National_ID  ", state: toastStates.ERROR);
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
                        controller: ForgetPassPatient.get(context).email,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),

                      ),
                      SizedBox(height: 70,),
                      Text("National-ID " , style:  TextStyle( fontSize: 18 , fontFamily:  'MontaguSlab'),),
                      TextFormField(
                        controller: ForgetPassPatient.get(context).National_ID,
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

                                ForgetPassPatient.get(context).ForgetPassPatientFunction(
                                    email:  ForgetPassPatient.get(context).email.text ,
                                    National_ID:  ForgetPassPatient.get(context).National_ID.text,
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
