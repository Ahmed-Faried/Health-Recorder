import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'DetailX-RayScreen.dart';

class X_rayPatient extends StatelessWidget {
  List<dynamic>? imageUrls ;

  X_rayPatient({required this.imageUrls});


  @override
  Widget build(BuildContext context) {


     //=[
     //        "https://picsum.photos/200/300?random=1",
     //        "https://picsum.photos/200/300?random=2",
     //        "https://picsum.photos/200/300?random=3",
     //        "https://picsum.photos/200/300?random=4",
     //        "https://picsum.photos/200/300?random=5",
     //        "https://picsum.photos/200/300?random=6",
     //      ];
     // List<String> textlist =[
     //   "https://picsum",
     //   "https://picsum",
     //   "https://picsum.",
     //   "https://picsum.p",
     //   "httotos/200/300?random=5",
     //   "https200/300?random=6",];


    return  Scaffold(
        appBar: AppBar(),


        body: ConditionalBuilder(
        condition: imageUrls?.length != 0,
        builder: (BuildContext context) { return  Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: imageUrls?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (
              crossAxisCount: 3, // عدد العناصر في الصف الواحد
              crossAxisSpacing: 5.0, // المسافة بين العناصر في الصف الواحد
              mainAxisSpacing: 7.0, // المسافة بين الصفوف
            ),

            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(
                        imageUrl: imageUrls![index],
                      ),
                    ),
                  );
                },
                child: Image.network(imageUrls![index] ,  fit: BoxFit.cover, ),
              );

            },
          ),
        ); },
        fallback: (BuildContext context) { return Center(child: Text("Not Fond"),); },
      )
    );
  }
}
