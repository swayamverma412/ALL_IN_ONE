import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base/SnakeBAr.dart';
import '../model/AllProduct.dart';
import '../repository/Product_repo.dart';

class productController extends ChangeNotifier{
  ProductRepo repo=ProductRepo();
  bool load=true;
  bool loadserch=false;
  bool err=false;

  List<List<Dataproduct>>? allProduct=[];
  List subcat=[];

  List<List<Dataproduct>>? get allProduct_list=>allProduct;
  List? get subcat_tab=>subcat;
  bool get loading=>load;
  bool? get error=>err;


  Future<void> getAllproduct(String vid)async {
    repo.allProduct(vid).then((value){
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
            load=false;
            err=false;
          }catch(e){
            print("Error1"+e.toString());
            err=true;
            load=false;
            toastShow(e.toString(),Colors.red);
          }
        }else{
          err=true;
          load=false;
          print("Error");
          toastShow(data["message"].toString(),Colors.red);
        }
      }catch(e){
        err=true;
        load=false;
        print("Error");
        toastShow(e.toString().toString(),Colors.red);
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
}