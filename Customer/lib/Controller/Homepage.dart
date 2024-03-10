import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/Model/Category/GetCategory.dart';
import 'package:vendor_app/base/SnakeBAr.dart';

import '../Model/Category/cat.dart';
import '../Repo/Homepage.dart';

class HomepageController extends ChangeNotifier {
  final Homepage_repo repo = Homepage_repo();
  bool err = false;
  bool load = true;
  bool err1 = false;
  bool load1 = true;
  bool err2 = false;
  bool load2 = true;
  GetCategory? get_category;
  int index = 0;
  List store = [];
  List banner = [];
  String selectaddress="";

  bool get loading => load;
  bool get error => err;
  bool get loading1 => load1;
  bool get error1 => err1;
  bool get loading2 => load2;
  bool get error2 => err2;
  GetCategory? get category_list => get_category;

  int get slectindex => index;

  Future<void> getCategory() async {
    repo.fetchCategory().then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          get_category = GetCategory.fromJson(data);
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
      getbanner();
    });
  }

  Future<void> getstore(String lat, String lng) async {
    repo.trendingShop(lat, lng).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          store = data["data"];
          load1 = false;
          err1 = false;
        } catch (e) {
          print("Error1" + e.toString());
          err1 = true;
          load1 = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        err1 = true;
        load1 = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }

  Future<void> getbanner() async {
    repo.getData_Customeurl().then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        if (data["data"].length > 0) {
          for (int i = 0; i < data["data"].length; i++) {
            banner.add(data["data"][i]["bannerImage"].toString());
          }
          err2 = false;
          load2 = false;
        } else {
          err2 = true;
          load2 = false;
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

  updateindex(int ind) {
    index = ind;
    notifyListeners();
  }
  void updateselctaddress(String addresstype) {
    selectaddress = addresstype;
    notifyListeners();
  }
}
