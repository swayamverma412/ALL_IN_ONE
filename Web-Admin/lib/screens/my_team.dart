// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/base/NOdata.dart';

import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import '../repository/Wallet.dart';

class MyTeam extends StatefulWidget {
String type,code;


MyTeam({required this.type, required this.code});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

int index = 0;

class _MyTeamState extends State<MyTeam> {
  bool load=true;
  bool error=false;
  List dataC=[];
String? id;
  callapi() async {
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    getdata(id);
  }
  Future<void> getdata(String id)async {
    WalletRepo().getteam(id,widget.code,widget.type).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data1.toString());
      if(value.statusCode==200){
        load=false;
        dataC=data1["data"];
      }else{
        error=true;
        load=false;
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {});
    });
  }
@override
  void initState() {
    callapi();
    super.initState();
  }


  List<String> freindsImage = ["assets/friend_profile.png"];
  List<String> name = ["Swati Verma"];

  Widget myTeam() {
    return load?Center(child: CircularProgressIndicator(),):error || dataC.length==0?NoDataScreen(text: "No refer"):
    ListView.builder(
        padding: EdgeInsets.only(top: 30),
        itemCount: dataC.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          //dataC[index]["image"]==null?"":dataC[index]["image"].toString()
          return ListTile(
            leading:dataC[index]["image"]==null?Image.asset("assets/user.png",width: 100,): Image.network(dataC[index]["image"].toString(),width: 100,),
            title: Text(dataC[index]["name"],
                style: TextStyle(fontWeight: FontWeight.bold)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: h(0.058),
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
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "My ${widget.type.toString()} Team",
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
              myTeam(),
           /*   DefaultTabController(
                length: 3,
                child: SizedBox(
                  width: w(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: w(1),
                        height: h(0.8),
                        child: ContainedTabBarView(
                          tabBarProperties: TabBarProperties(
                            indicatorColor: Colors.transparent,
                            labelColor: Colors.red,
                            padding: EdgeInsets.only(top: 16),
                            unselectedLabelColor: HexColor("D3D0D0"),
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          callOnChangeWhileIndexIsChanging: true,
                          onChange: (ind) {
                            setState(() {
                              index = ind;
                            });
                          },
                          tabs: [
                            Text(
                              "Customer",
                              style: TextStyle(
                                  color: index != 0
                                      ? HexColor("D3D0D0")
                                      : Colors.red),
                            ),
                            Text(
                              "Vendor",
                              style: TextStyle(
                                  color: index != 1
                                      ? HexColor("D3D0D0")
                                      : Colors.red),
                            ),
                            Text(
                              "Rider",
                              style: TextStyle(
                                  color: index != 2
                                      ? HexColor("D3D0D0")
                                      : Colors.red),
                            ),
                          ],
                          views: [
                            myTeam(""),
                            myTeam(),
                            myTeam(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )*/
            ]),
      ),
    );
  }
}
