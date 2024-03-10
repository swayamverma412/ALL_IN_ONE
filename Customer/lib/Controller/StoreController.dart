import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/StoreModel/NerabySub.dart';
import '../Repo/Product_repo.dart';
import '../base/SnakeBAr.dart';

class StoreController extends ChangeNotifier {
  final ProductRepo repo = ProductRepo();
  NerabySub? subcategorystore;

  bool load = true;
  bool err = false;
  bool Grid = false;

  bool get loading => load;
  bool get error => err;
  bool get isGrid => Grid;
  NerabySub? get subcategory_store => subcategorystore;

  Future<void> getstore_Subcategory(String title) async {
    repo.fetchstoreby_subcategory(title).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          subcategorystore = NerabySub.fromJson(data);
          load = false;
          err = false;
        } catch (e) {
          print("Error1" + e.toString());
          err = true;
          load = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        err = true;
        load = false;
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }

  void changegrid() {
    if (Grid == false) {
      Grid = true;
    } else {
      Grid = false;
    }
    print("Chanbge");
    notifyListeners();
  }
  /*void  Search(String value){
    for(int i=0;i<subcategorystore!.data!.length;i++){
      if(subcategorystore!.data[i].vendorDetails!.contains(value)){

      }
      List fliter=subcategorystore!.data![i].vendorDetails!.where((element) => element.businessName.toString()==value).toList();
    }
  }*/

}
