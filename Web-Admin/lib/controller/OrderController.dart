import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vendor_shopkeeper/model/OrderModel.dart';
import 'package:vendor_shopkeeper/repository/OrderRepo.dart';
import 'package:vendor_shopkeeper/screens/authRepo.dart';

import '../util/SnakeBAr.dart';

class OrderController extends ChangeNotifier{
  final OrderRepo orderRepo = OrderRepo();
  bool err=false;
  bool err2=false;
  bool load=true;
  OrderModel? get_order;
  OrderModel? get_ordercomplete;

  int index=0;
  bool load2=true;

  bool get loading2=>load2;
  bool get loading=>load;
  bool get error=>err;
  bool get error2=>err2;
  OrderModel? get order_list=>get_order;
  OrderModel? get ordere_complete=>get_ordercomplete;

  int get slectindex=>index;
  Future<void> getOrderApi(String vender_id,String status,bool complate)async {
    orderRepo.getOrder(vender_id,status).then((value){
      var data=jsonDecode(value.body);
      print("value-------------"+data.toString());
      if(value.statusCode==200){
        try{
          if(complate==true){
            get_ordercomplete=OrderModel.fromJson(data);
            load2=false;
            err2=false;
          }else{
            get_order=OrderModel.fromJson(data);
            load=false;
            err=false;
          }

          //print(get_category!.toJson().toString());
        }catch(e){
          if(complate==true){
            print("Error1"+e.toString());
            err2=true;
            load2=false;
            toastShow(e.toString(),Colors.red);
          }else{
            print("Error1"+e.toString());
            err=true;
            load=false;
            toastShow(e.toString(),Colors.red);
          }

        }
      }else{
        if(complate==true){
          err2=true;
          load2=false;
        }else{
          err=true;
          load=false;
        }
        toastShow(data["message"].toString(),Colors.red);
      }
      notifyListeners();
    });

  }





  updateindex(int ind){
    index=ind;
    notifyListeners();
  }


}