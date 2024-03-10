import 'dart:convert';

import 'package:flutter/material.dart';
import '../Model/OrderModel.dart';
import '../base/SnakeBAr.dart';
import '../repository/OrderRepo.dart';

class ordercontroller extends ChangeNotifier {
  final OrderRepo repo = OrderRepo();
  bool err = false;
  bool load = true;
  bool loadnew = true;
  bool load2 = true;
  OrderModel? get_order;
  OrderModel? get_orderlatest;


  bool get loading => load;
  bool get loading2 => load2;
  bool get error => err;
  OrderModel? get ordere_list => get_order;
  OrderModel? get ordere_listlatest => get_orderlatest;

  Future<void> getOrder(String id,) async {
    repo.getOrder(id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          get_orderlatest = OrderModel.fromJson(data);
          loadnew = false;
          //print(get_category!.toJson().toString());
        } catch (e) {
          print("Error1" + e.toString());
          loadnew = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        loadnew = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }
  Future<void> getOrder_Status(String id,) async {
    String sta="?status=accepted by rider&notStatus=completed, canceled";
    repo.getOrder_Staus(id,sta).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
            get_order = OrderModel.fromJson(data);
            load = false;
          err = false;
          //print(get_category!.toJson().toString());
        } catch (e) {
          print("Error1" + e.toString());
          err = true;
          load = false;
          load2 = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        err = true;
        load = false;
        load2 = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }

/*  Future<void> getOrderdetils(
    String id,
    String orderid,
  ) async {
    repo.getorderDetils(orderid, id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          get_order = GetOrderSecond.fromJson(data);
          load = false;
          err = false;
          //print(get_category!.toJson().toString());
        } catch (e) {
          print("Error1" + e.toString());
          err = true;
          load = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        err = true;
        load = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }*/
}
