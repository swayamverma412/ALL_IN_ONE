// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/Cart.dart';
import 'package:vendor_app/base/NOdata.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/data/AppContent.dart';

import '../Repo/Product_repo.dart';
import '../Repo/orderRepo.dart';
import '../base/SnakeBAr.dart';

class Coupons extends StatefulWidget {
  Coupons({Key? key}) : super(key: key);

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {

  List coupenlist=[];
  bool load=true;
  bool apply=false;
  int tap=0;

  List<String> couponHeading = [
    "Flat 15% discount",
    "Flat 30% discount",
    "Flat 40% discount",
  ];

  List<String> couponDetail = [
    "Upto Rs.150 on order above 1599",
    "Upto Rs.500 on order above 1700",
    "Upto Rs.400 on order above 2000",
  ];

  Widget coupons(
      {String heading = "",
      String detail = "",
        String code="",
        int ind=0,
      required GestureTapCallback onTap}) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/copons.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Flat ${heading}% discount",
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(code.toString(),style:TextStyle(color: Colors.redAccent,fontSize: 12),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upto Rs.${heading} on order above ${detail}",
                  style: TextStyle(
                    color: HexColor("000000").withOpacity(0.69),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.redAccent,
                    ),
                    child:apply==true && tap==ind?SizedBox(height: 10,width: 10,child: CircularProgressIndicator(color: Colors.white),): Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Apply",style:TextStyle(color: Colors.white,fontSize: 12),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getCoupen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[4],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Apply Coupons",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child:load?Center(child: CircularProgressIndicator(),): coupenlist.length==0?NoDataScreen(text: "No Coupon"):ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: coupenlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: coupons(
                                  onTap: () {
                                    setState((){
                                      apply=true;
                                      tap=index;
                                    });
                                    ApplyCounpen(coupenlist[index]["code"].toString());
                                  },
                                  heading: coupenlist[index]["discount"].toString(),
                                  detail: coupenlist[index]["discountLimit"].toString(),
                                  code: coupenlist[index]["code"].toString(),
                                  ind: index,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getCoupen()async {
    OrderRepo().getCounpen().then((value){
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        coupenlist=data["data"];
        load=false;
      }else{
        load=false;
        toastShow(data["message"].toString(),Colors.red);
      }
      setState((){});
    });
  }
  Future<void> ApplyCounpen(String name)async{
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    ProductRepo().ApplyCoupen(name,id).then((value){
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        apply=false;
        Provider.of<CartController>(context,listen: false).ApplyCounpen(true);
        Navigator.of(context).pop();
        toastShow(data["message"].toString(),Colors.green);
      }else{
        apply=false;
        toastShow(data["message"].toString(),Colors.red);
      }
      setState((){});
    });
  }
}
