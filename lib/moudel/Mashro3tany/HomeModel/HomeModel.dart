import 'package:flutter/cupertino.dart';

class HomeModel  {

  late bool status ;
  late  HomeDataModel data ;

  HomeModel.fromJson(Map<String , dynamic> json){

    status = json['status'] ;
    data =  HomeDataModel.fromJson(json['data'])   ;

  }

}

class HomeDataModel {

 late List<ProductsModel>   products =  [] ;

 late List<BannersModel>    banners  =  [] ;



  HomeDataModel.fromJson(Map<String, dynamic> json ){



    json['products'].forEach((element){

      products.add(ProductsModel.fromJson(element));
    })  ;



    json['banners'].forEach((element){

      banners.add(BannersModel.fromJson(element));
    })  ;







  }

}

class ProductsModel {


  late  int     id;
  late  String  name;
  dynamic     price;
  dynamic    oldPrice;
  dynamic     discount;
  late  String  image;
  late  bool    inFavorites;
  late  bool    inCart;

  ProductsModel.fromJson(Map<String, dynamic> json ){
    id          = json['id'];
    name        = json['name'];
    price       = json['price'];
    oldPrice    = json['old_price'];
    discount    = json['discount'];
    image       = json['image'];
    inFavorites = json['in_favorites'];
    inCart      = json['in_cart'];
  }






}

class BannersModel{

  late int id;
  late String image;


  BannersModel.fromJson(Map<String, dynamic> json ){

    id = json['id'];
    image = json['image'];

  }



}