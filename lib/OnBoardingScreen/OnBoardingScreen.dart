
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Network/local/shared_preferences.dart';
import '../Screens/LoginAndRegister/LoginAndRegister.dart';


class BoardingModel{

    String image;
    String title1;
    String title2;
    String body;
  BoardingModel({required this.image,required this.title1,required this.title2,required this.body,});
}



class onBoarding extends StatefulWidget {


   onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {

  bool isLast = false ;


  void submit(){

    CacheHelper.saveData(key:'onBoarding', value: true).then((value){

      if (value){
        Navigator.pushAndRemoveUntil(context ,MaterialPageRoute(builder:(context) =>   LoginAndRegister()) , (route) => false);
      }

    });



  }


  List<BoardingModel> boarding = [
    BoardingModel(

      image:'assets/onboarding1.jpeg',
      title1:'Health',
      title2:'Recorder',
      body:"The Application Allows Patients And Their Doctors To Register And Save The Patient's Overall Health Condition To More Easily Access It In A Later Time." ,
     // color : HexColor("#0160D6"),
    ),
    BoardingModel(

      image: 'assets/onboarding2.jpeg',
      title1: 'Well',
      title2: 'Organized',
      body: "Application Provide Easiest Way To Read And Well Organized Tables That Display The Different Medications The Patient Uses And Their Purpose." ,
    //  color : HexColor("#0160D6"),//6365DB

    ),
    BoardingModel(

      image: 'assets/onboarding3.jpeg',
      title1: 'Special',
      title2: 'Code',
      body: "Patients Well Be Provided With A Special Code Can Shared With Their Doctors, So Doctors Will Be Able To Access And Modify The Patient's Health Records To Keep Them Up To Date." ,
     // color : HexColor("#0160D6"),//FF7C72

    ),
  ];

  var controller = PageController() ;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,

      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
                itemBuilder:  (context , index) => onBoardingScreen(boarding[index]),
                itemCount:boarding.length,
              onPageChanged: (index){
                if(index == boarding.length-1){
                  setState(() {
                    isLast = true ;

                  });
                }else{
                  setState(() {
                    isLast = false ;
                  });

                };

              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(

                  onPressed:(){

                    submit();

                  },
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all( HexColor("#0160D6")),

                  ), child: const Text('               Skip               ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect:  WormEffect(
                  spacing:  14.0,
                  radius:  10,
                  dotWidth:  16.0,
                  dotHeight:  16.0,
                  paintStyle:  PaintingStyle.fill,
                  strokeWidth: .1,
                  dotColor:  Colors.grey.shade300,
                  activeDotColor:  HexColor("#0160D6"),

                ),
                onDotClicked: (index){

                },

              ),
              SizedBox(
                width: 13,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:  HexColor("#0160D6"),



                ),
                child: IconButton
                  (
                  onPressed: (){
                    if(isLast){
                      submit();
                    }else{
                      controller.nextPage(duration: const Duration(
                        milliseconds: 1500,
                      ), curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  icon: const Icon(Icons.play_arrow , color: Colors.white, ) ,

                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),


        ],
      ) ,
    );
  }


  Widget onBoardingScreen( BoardingModel model) => Scaffold(
    backgroundColor: Colors.white,
    body:  Column(

      children:
      [
        Container(
          width: double.infinity,
          height: 360,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),


          ),
          child: Image(image: AssetImage(model.image), fit: BoxFit.fill,),
        ),
        Spacer()     ,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Text(model.title1 ,
              style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(model.title2  , style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(model.body  ,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.grey,

                ),),
              ),
            )
          ],
        ),
        Spacer(),


      ],
    ),
  ) ;


}
