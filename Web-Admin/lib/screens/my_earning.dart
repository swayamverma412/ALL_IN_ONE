// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/base/NOdata.dart';

import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../base/customerror.dart';
import '../data/AppContent.dart';
import '../model/Earing.dart';
import '../repository/Wallet.dart';

class MyEarning extends StatefulWidget {
  MyEarning({Key? key}) : super(key: key);

  @override
  State<MyEarning> createState() => _MyEarningState();
}

class _MyEarningState extends State<MyEarning> {
  bool load = true;
  bool error = false;
  bool error2 = false;
  List data = [];
  Earinig? data2;
  String fliter="",iD="";
  List<GlobalIncome> _globalIncome=[];
  List<OtherEarnings> _otherEarnings=[];
//Controls string below send to back

//Controls string below send to back
  String filterText = "Recent";

  int modelBottomSheetSelectedButton = 1;

  List<String> type = ["Cashback"];
  List<String> date = ["24 August"];
  List<String> time = ["11:00am"];
  List<String> amount = ["200"];


  @override
  void initState() {
    callapi();
    super.initState();
  }
  callapi() async {
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    getdata(id);
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
        body: Container(
          child: load?Center(child: CircularProgressIndicator()):
          error?CustomeError():
          date.isNotEmpty?  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                          "My Earning",
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
                            "My Earning",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Text(
                          "Rs ${data[0]["earning"].toString()}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w(0.07),
                              vertical: h(0.07)),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    filterText,
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.69),
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
                                          return StatefulBuilder(
                                              builder:
                                                  (BuildContext
                                              context,
                                                  StateSetter
                                                  set) {
                                                return SizedBox(
                                                  height: h(0.3),
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      mainAxisSize:
                                                      MainAxisSize
                                                          .min,
                                                      children: <
                                                          Widget>[
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: modelBottomSheetSelectedButton ==
                                                                  1
                                                                  ? Icon(Icons.radio_button_checked,
                                                                  color: Colors.red)
                                                                  : Icon(Icons.circle_outlined),
                                                              onPressed:
                                                                  () {
                                                                set(() {
                                                                  filterText =
                                                                  "Recent";
                                                                  modelBottomSheetSelectedButton =
                                                                  1;
                                                                });
                                                                setState(
                                                                        () {
                                                                      fliter="Recent";
                                                                    });
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                            Text(
                                                                "Recent")
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: modelBottomSheetSelectedButton ==
                                                                  2
                                                                  ? Icon(Icons.radio_button_checked,
                                                                  color: Colors.red)
                                                                  : Icon(Icons.circle_outlined),
                                                              onPressed:
                                                                  () {
                                                                set(() {
                                                                  filterText =
                                                                  "Past Week";
                                                                  modelBottomSheetSelectedButton =
                                                                  2;
                                                                });
                                                                setState(
                                                                        () {
                                                                      fliter="pastWeek";
                                                                    });
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                            Text(
                                                                "Past Week")
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: modelBottomSheetSelectedButton ==
                                                                  3
                                                                  ? Icon(Icons.radio_button_checked,
                                                                  color: Colors.red)
                                                                  : Icon(Icons.circle_outlined),
                                                              onPressed:
                                                                  () {
                                                                set(() {
                                                                  filterText =
                                                                  "Past Month";
                                                                  modelBottomSheetSelectedButton =
                                                                  3;
                                                                });
                                                                setState(
                                                                        () {
                                                                      fliter="pastMonth";
                                                                    });
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                            Text(
                                                                "Past Month")
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: modelBottomSheetSelectedButton ==
                                                                  4
                                                                  ? Icon(
                                                                Icons.radio_button_checked,
                                                                color: Colors.red,
                                                              )
                                                                  : Icon(Icons.circle_outlined),
                                                              onPressed:
                                                                  () {
                                                                set(() {
                                                                  filterText =
                                                                  "Past Year";
                                                                  modelBottomSheetSelectedButton =
                                                                  4;
                                                                });
                                                                setState(
                                                                        () {
                                                                      fliter="pastYear";
                                                                    });
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                            Text(
                                                                "Past Year")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                      ).then((value) {
                                        String para="status=completed&filter=$fliter";
                                        getdata2(iD, para);
                                      });
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
                              /*_otherEarnings.length==0?NoDataScreen(text: "No Earning")
                                                  :*/
                              error2?NoDataScreen(text: "No data"):Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: _otherEarnings.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    _otherEarnings[index].type.toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets
                                                        .only(
                                                        top:
                                                        8.0),
                                                    child: Text(
                                                      _otherEarnings[index].date.toString().split(" ")[1].toString()+" "+
                                                          _otherEarnings[index].date.toString().split(" ")[2].toString()+" "+
                                                          _otherEarnings[index].date.toString().split(" ")[3].toString()+" "+
                                                          _otherEarnings[index].date.toString().split(" ")[4].toString(),
                                                      style:
                                                      TextStyle(
                                                        color: Colors
                                                            .grey,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Rs ${_otherEarnings[index].amount.toString()}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        color: Colors
                                                            .red),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ));
                                    },
                                  ),

                                  ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: _globalIncome.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    _globalIncome[index].amount.toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets
                                                        .only(
                                                        top:
                                                        8.0),
                                                    child: Text(
                                                      _globalIncome[index].date.toString().split(" ")[1].toString()+" "+
                                                          _globalIncome[index].date.toString().split(" ")[2].toString()+" "+
                                                          _globalIncome[index].date.toString().split(" ")[3].toString()+" "+
                                                          _globalIncome[index].date.toString().split(" ")[4].toString(),
                                                      style:
                                                      TextStyle(
                                                        color: Colors
                                                            .grey,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Rs ${_globalIncome[index].amount.toString()}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        color: Colors
                                                            .red),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ));
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ):NoDataScreen(text:"No earring"),
        ),
      ),
    );
  }
  Future<void> getdata(String id)async {
    WalletRepo().fetchearing(id).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data.toString());
      if(value.statusCode==200){
          String para="status=completed";
          getdata2(id,para);
          data.add(data1["data"]);
      }else{
        error=true;
        load=false;
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {});
    });
  }
  Future<void> getdata2(String id,String parma) async {
    WalletRepo().fetchearing_Details(id,parma).then((value) {
      var data1 = jsonDecode(value.body);
      //print("value-------------" + data1.toString());
      if (value.statusCode == 200 ) {
        try{
          if (data1["data"]['globalIncome'] != null) {
            _globalIncome = [];
            for(int i=0;i< data1["data"]['globalIncome'].length;i++){
              var dya= data1["data"]['globalIncome'][i];
              print(dya.toString());
              _globalIncome.add(GlobalIncome(date: dya["date"],amount: dya["amount"],sentTo:""));
            }
          }
          if (data1["data"]['otherEarnings'] != null) {
            _otherEarnings = [];
            for(int i=0;i< data1["data"]['otherEarnings'].length;i++){
              var dya= data1["data"]['otherEarnings'][i];
              print(dya.toString());
              _otherEarnings.add(OtherEarnings(id: dya["id"],amount: dya["amount"],date: dya["date"],type: dya["type"]));
            }
          }
          load = false;
          error2 = false;
          print("Eraring" + data2.toString());
        }catch(e){
          print("Error");
          load = false;
          error2 = true;
          toastShow("error", Colors.red);
        }
      } else {
        print("Error");
        load = false;
        error2 = true;
        toastShow(data1["message"].toString(), Colors.red);
      }
      setState(() {});
    });
  }
}
