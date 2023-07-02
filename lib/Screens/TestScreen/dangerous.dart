import 'package:flutter/material.dart';
import 'package:shop_app/Components/components.dart';
import 'package:shop_app/Screens/LoginAndRegister/LoginAndRegister.dart';


class dangerous extends StatelessWidget {
   dangerous({Key? key}) : super(key: key);

   TextEditingController control = TextEditingController();
   TextEditingController control1 = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Welcome 💀" , style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't press anything 👹 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                    InkWell(
                      child: Text(".", style: TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w500)),
                      onTap: (){
                         {
                          showDialog(

                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('👁️️️جدع انت كدة راجل بتفهم '),
                                content: Text('دخل حل اللغز '),



                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text('إلغاء'),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: control1,
                                      onFieldSubmitted: (value) {
                                        if (value == "01151031054") {

                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      '️  مبروك فاضل خطوة 🥳'),
                                                  content: Text(
                                                      ' اختر اللون الصح ايها المحقق احذر فاحدهم سوف يموت لو اخترت اللون الخطأ 🙂 '),


                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                         navigateTo(context, LoginAndRegister()),
                                                      child: Text('احمر'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'ماتت ران يا حمار  '),
                                                              content: Text(
                                                                  ' تم تحميل البيانات بنسبة 100%  '),


                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                Navigator.of(context).pop(),
                                                                  child: Text('💩💩💩'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text('💩💩💩'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );                                                      },
                                                      child: Text('ازرق'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                        } else{
                                          print(value);
                                          print(control1);

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    '️غلط غلط غلط '),
                                                content: Text(
                                                    ' حاول مرة اخري  '),


                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                  Navigator.of(context).pop(),
                                                    child: Text('💩💩💩'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Text('💩💩💩'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      })
                                ],
                              );
                            },
                          );
                        }
},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("Pildex hof hof 🔥 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                      onLongPress: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('شكرا'),
                                ],
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('☺️ بياناتك بتتسرق'),
                                ],
                              ),

                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('اسرقها'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('اسرقها'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("Abn Saber 🔥 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                      onLongPress: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('شكرا'),
                                ],
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('☺️ بياناتك بتتسرق'),
                                ],
                              ),


                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('اسرقها'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('اسرقها'),
                                ),
                              ],
                            );
                          },
                        );
                      },

                    ),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("ShabiGabi 🔥 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                      onLongPress: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('شكرا'),
                                ],
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('☺️ بياناتك بتتسرق'),
                                ],
                              ),


                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('اسرقها'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('اسرقها'),
                                ),
                              ],
                            );
                          },
                        );
                      },

                    ),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("Hendawy 🔥 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                      onLongPress: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('شكرا'),
                                ],
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('☺️ بياناتك بتتسرق'),
                                ],
                              ),


                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children:
                                    [
                                      Text('Arelya'),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('هتقولي الجديد واتس و اسيبك تخرج'),
                                ),
                              ],
                            );
                          },
                        );
                      },

                    ),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("Moksha 🔥 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                      onLongPress: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('شكرا'),
                                ],
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('☺️ بياناتك بتتسرق'),
                                ],
                              ),


                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('عادي هي كدة كدة معاك'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('اسرقها'),
                                ),
                              ],
                            );
                          },
                        );
                      },

                    ),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("Shahbo 🔥 ", style: TextStyle(color: Colors.red , fontSize: 20, fontWeight: FontWeight.w500)),
                      onLongPress: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('شكرا'),
                                ],
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('☺️ بياناتك بتتسرق'),
                                ],
                              ),


                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(' jg diff 👎'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('استني هصيح شوية '),
                                ),
                              ],
                            );
                          },
                        );
                      },

                    ),


                  ],
                ),
              ],
            ),
            SizedBox(height: 230),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('👁️️️️👁️  مش قلتلك مدوسش علي حاجة  '),
                      content: Text(' 😡 😡 ايه دة بجد عاوز تخرج \n 😇 خلي بالك دخول الحمام مش زي خروجة  '),



                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                    },
                    child: Text(':('),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('          😴 الخروج من هنا            ' , style: TextStyle(
                  fontSize: 14,
                  color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(' 😬 لسة بتحاول تخرج'),
                      content: Text(' في طريقة واحدة بس للخروج لو عاوز تعرفها تعال وتس وخلي بالك من بيانات  😈😈😈😈😈😈😈😈😈😈😈'),


                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('مش هتعرف تخرج ☠️'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('               🤗 او من هنا                ' , style: TextStyle(
                  fontSize: 14,
                  color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('حل اللغز في المصيدة '),
                        ],
                      ),
                      content: Text(' 4   5   0   1   3   0   1   5   1   1   0'),


                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:
                            [
                              Text('إلغاء'),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('👁️️️️👁️  مش قلتلك مدوسش علي حاجة  '),
                                    content: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('شكلك لسة مش عارف الحل و برضوا '),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(' دوست مش مهم حاول وخلاص '),
                                          ],
                                        ),

                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        child: Text('إلغاء'),
                                      ),
                                      TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: control,
                                          onFieldSubmitted: (value){
                                            Navigator.pop(context);
                                        },
                                        decoration: InputDecoration(
                                          hintText: " 👊 مش هنا يا جميل ",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          prefixText: "  ",
                                          border: InputBorder.none,
                                          enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),



                                      )
                                    ],
                                  );
                                },
                              );
                            },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text('بلاش تدوس هنا لو متعرفش حل اللغز'),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(' 🎃 اوعا تخرج احسن بياناتك عندي ' , style: TextStyle(
                  fontSize: 14,
                  color: Colors.red)),
            ),



          ],
        ),
      ),
    );
  }
}
