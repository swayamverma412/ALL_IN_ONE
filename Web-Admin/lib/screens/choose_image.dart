// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/base/NOdata.dart';
import 'package:vendor_shopkeeper/base/Perferance.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import 'package:vendor_shopkeeper/screens/request_product.dart';

import '../base/SnakeBAr.dart';
import '../repository/Product_repo.dart';

class ChooseImage extends StatefulWidget {
  ChooseImage({Key? key}) : super(key: key);

  @override
  State<ChooseImage> createState() => _ChooseImageState();
}



class _ChooseImageState extends State<ChooseImage> {
  List images = [];
  TextEditingController searchController = TextEditingController();
  bool load=true;

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

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        Navigator.of(context).pop(false);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "Choose Image",
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
          Column(
            children: [
              SizedBox(
                height:h(0.03),
              ),
             /* Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    controller: searchController,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14.0),
                      border: InputBorder.none,
                      hintText: "Search item",
                      fillColor: HexColor("D9D9D9"),
                      filled: true,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),*/
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: h(0.5),
                  maxWidth: w(0.9),
                ),
                child:load?Center(child: CircularProgressIndicator(),):images.length==0?NoDataScreen(text: "No image found"): MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                    physics: ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 4,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pop(images[index]["image"].toString());
                          },
                          child: Card(
                            elevation: 5,
                            child: Image.network(images[index]["image"].toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
             /* Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: GestureDetector(
                  onTap: () {
                    pushNewScreen(context,
                        screen: RequestProduct(), withNavBar: false);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_circle_outlined, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Request a new Product Image",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
          )
        ],
      )),
    );
  }
  getdata() async {
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    ProductRepo().getImage(id).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data1.toString());
      if(value.statusCode==200){
        load=false;
        images=data1["message"];
      }else{
        load=false;
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {});
    });
  }
}
