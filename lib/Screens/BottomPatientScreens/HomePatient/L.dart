// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop_app/Bloc/HomeCubit.dart';
// import 'package:shop_app/Bloc/HomeStates.dart';
//
// import '../../../moudel/HomeModel/HomeModel.dart';
//
// class Lscreen extends StatelessWidget {
//   Lscreen({Key? key}) : super(key: key);
//
//   @override
//
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopAppCubit, ShopAppStates>(
//       listener: (context, state) {},
//       builder: (context, state) => ConditionalBuilder(
//           condition: ShopAppCubit.get(context).homeModel != null,
//           builder: (context) =>
//               LScreenBuilder(ShopAppCubit.get(context).homeModel!),
//           fallback: (context) => Center(child: CircularProgressIndicator())),
//     );
//   }
// }
//
// Widget LScreenBuilder(HomeModel homeModel) => SingleChildScrollView(
//   physics: BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           CarouselSlider(
//               items: homeModel.data.banners
//                   .map((e) => Image(
//                         image: NetworkImage('${e.image}'),
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ))
//                   .toList(),
//               options: CarouselOptions(
//                 height: 200,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: false,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 3),
//                 autoPlayAnimationDuration: Duration(seconds: 1),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 scrollDirection: Axis.horizontal,
//                 viewportFraction: 1,
//               )),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             color: Colors.white,
//             child: GridView.count(
//               physics: NeverScrollableScrollPhysics(),
//               childAspectRatio: 1 / 1.8,
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               mainAxisSpacing: 2,
//               crossAxisSpacing: 2,
//               children: List.generate(homeModel.data.products.length,
//                   (index) => buildGridProducts(homeModel.data.products[index])),
//             ),
//           )
//         ],
//       ),
//     );
//
// Widget buildGridProducts(ProductsModel model) => Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
//             Image(
//               image: NetworkImage(model.image),
//               width: double.maxFinite,
//               height: 200,
//             ),
//            if(model.discount != 0 ) Container(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               color: Colors.red,
//               child: Text("Discount" , style: TextStyle(color: Colors.white, fontSize: 10),),
//             )
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 model.name,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: 14, height: 1.1, color: Colors.black),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model.price.toInt()}',
//                     style: TextStyle(fontSize: 14, color: Colors.blue),
//
//                   ),
//                   SizedBox(width: 5,),
//                   if(model.discount != 0)   Text(
//                     '${model.oldPrice.toInt()}',
//                     style: TextStyle(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough),
//
//                   ),
//                   Spacer(),
//                   IconButton(onPressed: (){}, icon:const Icon(Icons.favorite ))
//                 ],
//               ),
//             ],
//           ),
//         )
//       ],
//     );
