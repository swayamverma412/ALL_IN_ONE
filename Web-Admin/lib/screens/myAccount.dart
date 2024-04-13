// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/base/NOdata.dart';
import 'package:vendor_shopkeeper/base/Perferance.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import 'package:vendor_shopkeeper/screens/Splash.dart';
import 'package:vendor_shopkeeper/screens/insights.dart';
import 'package:vendor_shopkeeper/screens/my_earning.dart';
import 'package:vendor_shopkeeper/screens/profile.dart';
import 'package:vendor_shopkeeper/screens/qrScan.dart';
import 'package:vendor_shopkeeper/screens/refer_and_earn.dart';
import 'package:vendor_shopkeeper/screens/reviews.dart';
import 'package:vendor_shopkeeper/screens/savedAddress.dart';
import 'package:vendor_shopkeeper/screens/support.dart';
import 'package:vendor_shopkeeper/screens/wallet.dart';

import '../base/SnakeBAr.dart';
import '../model/profile_model.dart';
import '../repository/authRepo.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  bool load=true;
  bool err=false;
  String? id;
  ProfileModel? data;

  Future<void> getdata()async {
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    authRepo().getprofilr(id).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data.toString());
      if(value.statusCode==200){
        try{
          data=ProfileModel.fromJson(data1);
          load=false;
          err=false;
          //print(get_category!.toJson().toString());
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
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {
        data=data;
      });
    });
  }
  
  
  @override
  void initState() {
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    //Returns a double, width of the screen multipled by the width given
    //The width given should range between 0-1 (0 -> No width , 1 -> Full screen width)
    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    Widget accountSettingsIcon(
        {required String name,
        required IconData icon,
        GestureTapCallback? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: w(1),
            child: Center(
              child: Row(
                children: [
                  Icon(icon, color: Colors.red, size: 35),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget accountSettingsImage(
        {required String name,
        required String icon,
        GestureTapCallback? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: w(1),
            child: Center(
              child: Row(
                children: [
                  ImageIcon(AssetImage(icon), color: Colors.red, size: 35),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body:load?Center(child: CircularProgressIndicator(),):err?NoDataScreen(text: "error"): SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[4],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                          height: 50,
                        ),
                        Text(
                          "  My Account",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(data!.data!.shopPicture.toString())
                        )
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          "${data!.data!.businessName.toString()
                          }",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        Text("  (${data!.data!.vendorName.toString()})",
                          style: TextStyle(
                            color:Colors.black.withOpacity(0.55),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        "${data!.data!.number.toString()}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.55),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "${data!.data!.shopAddress.toString()
                      }",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.55),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    accountSettingsImage(
                      icon: "assets/wallet.png",
                      name: "Wallet",
                      onTap: () {
                        pushNewScreen(context,
                            screen: Wallet(), withNavBar: false);
                      },
                    ),
                    accountSettingsIcon(
                      icon: Icons.bar_chart_outlined,
                      name: "Insights",
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: Insights(),
                          withNavBar: false,
                        );
                      },
                    ),
                    accountSettingsImage(
                      icon: "assets/reviews.png",
                      name: "Reviews",
                      onTap: () {
                        pushNewScreen(context,
                            screen: Reviews(data), withNavBar: false);
                      },
                    ),
                    accountSettingsIcon(
                      icon: Icons.qr_code_scanner_sharp,
                      name: "QR Scan",
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: QrScan(),
                          withNavBar: false,
                        );
                      },
                    ),
                    accountSettingsIcon(
                      icon: Icons.support_agent_rounded,
                      name: "Support",
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: Support(),
                          withNavBar: false,
                        );
                      },
                    ),
                    accountSettingsIcon(
                      icon: Icons.people,
                      name: "Refer and Earn",
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: ReferAndEarn(),
                          withNavBar: false,
                        );
                      },
                    ),
                    accountSettingsImage(
                      icon: "assets/personal_details.png",
                      name: "Personal Details",
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: Profile(),
                          withNavBar: false,
                        ).then((value) => getdata());
                      },
                    ),
                    accountSettingsImage(
                      icon: "assets/cod.png",
                      name: "My Earnings",
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: MyEarning(),
                          withNavBar: false,
                        );
                      },
                    ),
                    accountSettingsIcon(
                      icon: Icons.logout_outlined,
                      name: "Log Out",
                      onTap: () async {
                        await SharedPreferenceClass.SetSharedData(AppContent.LOGSTATUS,"false");
                        pushNewScreen(
                          context,
                          screen: Splash(),
                          withNavBar: false,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
