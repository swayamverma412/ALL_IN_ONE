// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vendor_shopkeeper/base/NOdata.dart';
import 'package:vendor_shopkeeper/base/Perferance.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';

import '../base/SnakeBAr.dart';
import '../base/customerror.dart';
import '../model/AllProduct.dart';
import '../repository/Product_repo.dart';

class Insights extends StatefulWidget {
  Insights({Key? key}) : super(key: key);

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  List<Dataproduct> datslist=[];
  bool load=true;
  bool load2=true;
  bool error=false;
  String earning='',itemsold="",order='';


  List name = ["Fresh Potato", "Fresh Potato", "Fresh Potato"];
  List image = ["potato.png", "potato.png", "potato.png"];
  List sale = ["125", "125", "125"];

  String selectedFromDropDown = "Today";
  String id="";

  Widget item(
    BuildContext context, {
    required String image,
    required String name,
    required String sale,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: HexColor("D9D9D9"),
              ),
              image: DecorationImage(
                image: NetworkImage("$image"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$sale sales",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
    callapi();
    super.initState();
  }
  callapi() async {
     id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    getdata(id);
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Insights",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.25),
                          child: Container(
                            padding: EdgeInsets.only(left: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 110,
                            height: 30,
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                                // constraints: BoxConstraints(maxHeight: 200),
                                showSelectedItems: true,
                                fit: FlexFit.loose,
                              ),
                              items: [
                                "Today",
                                "Last Week",
                                "Last Month",
                                'Last Year'
                              ],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  suffixIconColor: Colors.white,
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  border: InputBorder.none,
                                  labelText: selectedFromDropDown,
                                ),
                              ),
                              onChanged: (value) {
                                selectedFromDropDown = value!;
                                if(value=="Today"){
                                  getdata2(id,"today");
                                  getdata3(id,"today");
                                }else  if(value=="Last Week"){
                                  getdata2(id,"last week");
                                  getdata3(id,"last week");
                                }else  if(value=="Last Month"){
                                  getdata2(id,"last week");
                                  getdata3(id,"last week");
                                }else {
                                  getdata2(id,"last year");
                                  getdata3(id,"last year");
                                }
                                setState(() {});
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "${order.toString()}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Orders",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "164km",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Items Sold",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "Rs.${earning}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Earning",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Earnings",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        height: 200,
                        width: w,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text("Graph here"),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Top Seeling Items",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Total 200 Items on Sale",
                        style: TextStyle(
                            // fontSize: 20,
                            // fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ),
                    load?Center(child: CircularProgressIndicator()):
                    error?CustomeError():
                    datslist.length>0? SizedBox(
                      height: datslist.length * h * 0.15,
                      child: ListView.builder(
                        itemCount: datslist.length,
                        shrinkWrap: true,
                        primary: false,
                       // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: item(
                              context,
                              image: datslist[index].productImage.toString(),
                              name:datslist[index].title.toString(),
                              sale:datslist[index].sold.toString(),
                            ),
                          );
                        },
                      ),
                    ):NoDataScreen(text: "No product"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> getdata(String id)async {
    ProductRepo().topSelling(id).then((value){
      var data=jsonDecode(value.body);
      print("value-------------"+data.toString());
      if(value.statusCode==200){
        try{
          data["data"].forEach((element) {
            datslist.add(Dataproduct.fromJson(element));
          });
          getdata2(id,"today");
          getdata3(id,"today");
          load=false;
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
      setState(() {
      });
    });
  }
  Future<void> getdata2(String id,String param)async {
    ProductRepo().getearing(id,param).then((value) {
      var data = jsonDecode(value.body);
      print("value-------------" + data.toString());
      if (value.statusCode == 200 && data["data"].length > 0) {
        try{
        earning = data["data"][0]["amount"].toString();
        load2 = false;
      } catch(e){
          print("Error1"+e.toString());
          load2=false;
          toastShow(e.toString(),Colors.red);
        }
      }else{
        load2=false;
        print("Error");
        toastShow(data["message"].toString(),Colors.red);
      }
      setState(() {
      });
    });
  }
  Future<void> getdata3(String id,String param)async {
    ProductRepo().getearingorder(id,param).then((value) {
      var data = jsonDecode(value.body);
      print("value-------------" + data.toString());

      if (value.statusCode == 200) {
        try{
          int orders=0;
          for(int i=0;i<data["data"].length;i++){
            orders=orders+int.parse(data["data"][i]["total"]);
          }
          order=orders.toString();
          load2 = false;
        } catch(e){
          print("Error1"+e.toString());
          load2=false;
          toastShow(e.toString(),Colors.red);
        }
      }else{
        load2=false;
        print("Error");
        toastShow(data["message"].toString(),Colors.red);
      }
      setState(() {
      });
    });
  }

}
