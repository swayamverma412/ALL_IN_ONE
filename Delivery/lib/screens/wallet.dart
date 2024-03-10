// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/screens/send_to_bank.dart';
import 'package:vendor_delivery/screens/send_to_friend.dart';
import '../base/NOdata.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import '../repository/Wallet.dart';
import 'add_money.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
//Controls string below send to back
  String filterText = "Recent";
  String? id;
  bool load=true;
  bool error=false;
  WalletRepo repo=WalletRepo();

  int modelBottomSheetSelectedButton = 1;

  List<String> storeName = ["Tripathi Stores"];
  List<String> date = ["24 August"];
  List<String> time = ["11:00am"];
  List<String> price = ["200"];
  List<String> quantity = ["3"];

  List datalist=[];


  @override
  void initState() {
    getshared();
    // TODO: implement initState
    super.initState();
  }
  getshared() async {
    id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    getdata();
  }

  Future<void> getdata()async {
    repo.fetchwallet(id!).then((value){
      print("value"+value.body.toString());
      var data=jsonDecode(value.body);

      if(value.statusCode==200){
        try{
          load=false;
          if(data["data"]==null){
            datalist=[];
          }else{
            datalist.add(data);
          }
        }catch(e){
          print("Error1"+e.toString());
          error=true;
          load=false;
          toastShow(e.toString(),Colors.red);
        }
      }else{
        error=true;
        load=false;
        print("Error");
        toastShow(data["message"].toString(),Colors.red);
      }
      setState((){});
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
        body: load==true?Center(child: CircularProgressIndicator()):datalist.isEmpty?NoDataScreen(text: "No data"): SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
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
                          "Wallet",
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
              SizedBox(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Available Balance",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Text(
                          "Rs ${datalist[0]["data"]["balance"].toString()}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                pushNewScreen(context,
                                    screen: AddMoney(), withNavBar: false);
                              },
                              child: SizedBox(
                                height: 40,
                                width: 150,
                                child: Card(
                                  color: Colors.red,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Money",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: 40,
                                width: 150,
                                child: InkWell(
                                  onTap: () {
                                    pushNewScreen(context,
                                        screen: SendFriends(datalist[0]["data"]["number"],id!),
                                        withNavBar: false);
                                  },
                                  child: Card(
                                    color: Colors.red,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Send to Friends",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            width: 150,
                            child: InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SendBank(datalist[0]["data"]["balance"],id!),
                                  withNavBar: false,
                                );
                              },
                              child: Card(
                                color: Colors.red,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sent to Bank",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w(0.07), vertical: h(0.07)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          filterText,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.69),
                            fontSize: 20,
                          ),
                        ),
                        // ImageIcon(onPressed: () {}, icon: Icon(Icons.filter))
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (
                                  BuildContext context,
                                  ) {
                                return StatefulBuilder(builder:
                                    (BuildContext context, StateSetter set) {
                                  return SizedBox(
                                    height: h(0.3),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: modelBottomSheetSelectedButton ==
                                                    1
                                                    ? Icon(
                                                    Icons
                                                        .radio_button_checked,
                                                    color: Colors.red)
                                                    : Icon(
                                                    Icons.circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Recent";
                                                    modelBottomSheetSelectedButton =
                                                    1;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Recent")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: modelBottomSheetSelectedButton ==
                                                    2
                                                    ? Icon(
                                                    Icons
                                                        .radio_button_checked,
                                                    color: Colors.red)
                                                    : Icon(
                                                    Icons.circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Past Week";
                                                    modelBottomSheetSelectedButton =
                                                    2;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Past Week")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: modelBottomSheetSelectedButton ==
                                                    3
                                                    ? Icon(
                                                    Icons
                                                        .radio_button_checked,
                                                    color: Colors.red)
                                                    : Icon(
                                                    Icons.circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Past Month";
                                                    modelBottomSheetSelectedButton =
                                                    3;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Past Month")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon:
                                                modelBottomSheetSelectedButton ==
                                                    4
                                                    ? Icon(
                                                  Icons
                                                      .radio_button_checked,
                                                  color: Colors.red,
                                                )
                                                    : Icon(Icons
                                                    .circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Past Year";
                                                    modelBottomSheetSelectedButton =
                                                    4;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Past Year")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/mi_filter.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 56.0),
                      child:datalist[0]["data"]["history"].length>0? ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: datalist[0]["data"]["history"].length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        datalist[0]["data"]["history"][index]["sentTo"].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          datalist[0]["data"]["history"][index]["date"].toString().split(" ")[0]+datalist[0]["data"]["history"][index]["date"].toString().split(" ")[1]+" "+
                                              datalist[0]["data"]["history"][index]["date"].toString().split(" ")[2]+" "+
                                              datalist[0]["data"]["history"][index]["date"].toString().split(" ")[4],
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rs ${ datalist[0]["data"]["history"][index]["amount"]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ));
                        },
                      ):SizedBox(),
                    )
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
