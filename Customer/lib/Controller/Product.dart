import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/product/AllProduct.dart';
import '../Model/product/Sub/getproductSub_model.dart';
import '../Repo/Product_repo.dart';
import '../base/SnakeBAr.dart';

class ProductController extends ChangeNotifier {
  final ProductRepo repo = ProductRepo();
  GetproductSubModel? subcategoryproduct;
  List<List<Dataproduct>>? allProduct = [];
  List subcat = [];

  bool load = true;
  bool loadserch=false;
  bool err = false;
  bool viewcart = false;
  bool Grid = false;
  bool loadpro = true;
  bool errpro = false;

  bool get loading => load;
  bool get error => err;
  bool get loadingpro => loadpro;
  bool get errorpro => errpro;
  bool get isGrid => Grid;
  GetproductSubModel? get subcategory_list => subcategoryproduct;
  List<List<Dataproduct>>? get allProduct_list => allProduct;
  List? get subcat_tab => subcat;

  Future<void> getproduct_Subcategory(String title) async {
    repo.fetchproductby_subcategory(title).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          subcategoryproduct = GetproductSubModel.fromJson(data);
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
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }

  Future<void> getAllproduct(String vid) async {
    repo.allProduct(vid).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        subcat = [];
        allProduct = [];
        try {
          for (int i = 0; i < data["data"].length; i++) {
            if (subcat.length > 0) {
              bool yes =
                  subcat.contains(data["data"][i]["subCategory"].toString());
              if (yes == false) {
                subcat.add(data["data"][i]["subCategory"].toString());
                List whr = data["data"]
                    .where((element) =>
                        element["subCategory"] ==
                        data["data"][i]["subCategory"].toString())
                    .toList();
                List<Dataproduct> list1 = [];
                whr.forEach((element) {
                  list1.add(Dataproduct.fromJson(element));
                });
                allProduct?.add(list1);
                print("where" + whr.toString());
                print("In Yes loop");
              }
            } else {
              print("In add");
              subcat.add(data["data"][i]["subCategory"].toString());
              List whr = data["data"]
                  .where((element) =>
                      element["subCategory"] ==
                      data["data"][i]["subCategory"].toString())
                  .toList();
              List<Dataproduct> list1 = [];
              whr.forEach((element) {
                list1.add(Dataproduct.fromJson(element));
              });
              allProduct?.add(list1);
            }
          }
          print(subcat.toString() + "  " + allProduct!.length.toString());
          loadpro = false;
          errpro = false;
        } catch (e) {
          print("Error1" + e.toString());
          errpro = true;
          loadpro = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        errpro = true;
        loadpro = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }

  Future<void> getSearch(String id,String serach)async {
    loadserch=true;
    notifyListeners();
    repo.SerachProduct(id,serach).then((value){
      try{
        var data=jsonDecode(value.body);
        if(value.statusCode==200){
          subcat=[];
          allProduct=[];
          try{
            for(int i=0;i<data["data"].length;i++){
              if(subcat.length>0){
                bool yes=subcat.contains(data["data"][i]["subCategory"].toString());
                if(yes==false){
                  subcat.add(data["data"][i]["subCategory"].toString());
                  List whr=data["data"].where((element) => element["subCategory"]==data["data"][i]["subCategory"].toString()).toList();
                  List<Dataproduct> list1=[];
                  whr.forEach((element) {
                    list1.add(Dataproduct.fromJson(element));
                  });
                  allProduct?.add(list1);
                  print("where"+whr.toString());
                  print("In Yes loop");
                }
              }else{
                print("In add");
                subcat.add(data["data"][i]["subCategory"].toString());
                List whr=data["data"].where((element) => element["subCategory"]==data["data"][i]["subCategory"].toString()).toList();
                List<Dataproduct> list1=[];
                whr.forEach((element) {
                  list1.add(Dataproduct.fromJson(element));
                });
                allProduct?.add(list1);
              }
            }
            print(subcat.toString()+"  "+allProduct!.length.toString());
            loadserch=false;
            err=false;
          }catch(e){
            print("Error1"+e.toString());
            err=true;
            loadserch=false;
            toastShow(e.toString(),Colors.red);
          }
        }else{
          err=true;
          loadserch=false;
          print("Error");
          toastShow(data["message"].toString(),Colors.red);
        }
      }catch(e){
        err=true;
        loadserch=false;
        print("Error");
        toastShow(e.toString().toString(),Colors.red);
      }
      notifyListeners();
    });
  }



  update() {
    viewcart = true;
  }
}
