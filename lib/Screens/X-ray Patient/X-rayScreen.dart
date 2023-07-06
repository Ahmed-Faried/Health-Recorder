import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'DetailX-RayScreen.dart';

class X_rayPatient extends StatelessWidget {
  List<dynamic>? imageUrls ;

  X_rayPatient({required this.imageUrls});


  @override
  Widget build(BuildContext context) {




    return  Scaffold(
        appBar: AppBar( title:  Text("X-rays & Medical tests   "),),


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
