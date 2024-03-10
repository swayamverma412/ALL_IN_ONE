import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/Repo/Product_repo.dart';

import '../Model/Cart/CartModel.dart';
import '../Model/Cart/GetcartModel.dart';
import '../base/SnakeBAr.dart';

class CartController extends ChangeNotifier{
  final ProductRepo repo=ProductRepo();
  CartModel? cat;
  bool load=true;
  bool err=false;
  bool coupenapply=false;
  String ErrorMessage="";

  bool get loading=>load;
  bool get error=>err;
  CartModel? get cat_list=>cat;


  Future<void> getcart(String id)async {
    repo.fetchcart(id).then((value){
      print("value"+value.body.toString());
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        try{
          cat=CartModel.fromJson(data);
          load=false;
          err=false;
          //print(get_category!.toJson().toString());
        }catch(e){
          err=true;
          load=false;
          toastShow(data["message"].toString(),Colors.red);
        }
      }else{
        err=true;
        load=false;
        toastShow(data["message"].toString(),Colors.red);
        print("Error");
      }
      notifyListeners();
    });
  }

  Future<void> Updatecart(Map<String,dynamic> body,String id)async {
    repo.Updatecart(body,id).then((value){
      var data=jsonDecode(value.body);
      print("Upadte cart"+data.toString());
      if(value.statusCode==200){
        toastShow("Cart update",Colors.green);
        getcart(id);
      }else{
        toastShow(data["message"].toString(),Colors.red);
      }
    });
  }
  Future<void> addtoCart(Map<String,dynamic> body,String id,bool cart)async{
    repo.Addcart(body,id).then((value){
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        if(cart==true){
          getcart(id);
        }
        toastShow(data["message"].toString(),Colors.green);
      }else{
        toastShow(data["message"].toString(),Colors.red);
      }
    });
  }
  Future<void> orderplace(String body)async{
   /* repo.Orderplace(body).then((value){
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        toastShow(data["message"].toString(),Colors.green);
      }else{
        toastShow(data["message"].toString(),Colors.red);
      }
    });*/
  }

 ApplyCounpen(bool  aply)async{
        coupenapply=aply;
        notifyListeners();
  }




}