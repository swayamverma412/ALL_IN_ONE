import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/OrderModel/GetOrderSecond.dart';
import '../Model/OrderModel/Updateaddress.dart';
import '../Model/OrderModel/getOrderModel.dart';
import '../Repo/Product_repo.dart';
import '../Repo/orderRepo.dart';
import '../base/SnakeBAr.dart';

class ordercontroller extends ChangeNotifier {
  final OrderRepo repo = OrderRepo();
  bool err = false;
  bool load = true;
  bool load2 = true;
  GetOrderSecond? get_order;
  GetOrderSecond? get_ordercomplete;
  Updateaddress? address;
  String? selectaddress="office";
  List<String> addressdrop = [];

  bool get loading => load;
  bool get loading2 => load2;
  bool get error => err;
  GetOrderSecond? get ordere_list => get_order;
  GetOrderSecond? get ordere_complete => get_ordercomplete;

  Future<void> getOrder(String id, String status, bool complate) async {
    repo.getorder(status, id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          if (complate == true) {
            get_ordercomplete = GetOrderSecond.fromJson(data);
            load2 = false;
          } else {
            get_order = GetOrderSecond.fromJson(data);
            load = false;
          }
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

  Future<void> getOrderdetils(
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
  }

  void updateaddress(Updateaddress adres) {
    address = adres;
    notifyListeners();
  }

  Future<void> Updateaddres(String id, String Select) async {
    ProductRepo().getProfile(id).then((value) {
      //  print("value"+value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          address = Updateaddress.fromJson(data);
          selectaddress = Select;
          for (int i = 0; i < address!.data!.address!.length; i++) {
            addressdrop.add(address!.data!.address![i].addressType.toString());
          }
          print(address!.toJson());
          print("Slect" + selectaddress!);
        } catch (e) {
          toastShow(data["message"].toString(), Colors.red);
        }
      } else {
        toastShow(data["message"].toString(), Colors.red);
        print("Error");
      }
      notifyListeners();
    });
  }

  void updateselctaddress(String addresstype) {
    selectaddress = addresstype;
    notifyListeners();
  }
}
