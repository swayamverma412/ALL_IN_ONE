import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vendor_app/Repo/Product_repo.dart';
import 'package:vendor_app/base/NOdata.dart';

import '../Model/product/AllProduct.dart';
import '../base/SnakeBAr.dart';
import 'itemsOfShop.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  List datalist = [];
  bool load = false;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: w(0.06), vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    autofocus: true,
                    style: TextStyle(fontSize: 16.0),
                    onChanged: (value) {
                      setState(() {
                        load = true;
                      });
                      getserach(value);
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14.0),
                      border: InputBorder.none,
                      hintText: "Search item or store ",
                      fillColor: HexColor("D9D9D9"),
                      filled: true,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: h(0.7),
                child: load
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    :datalist.length==0?Center(child: NoDataScreen(text: 'no available',),): ListView.builder(
                        itemCount: datalist.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                print("TAp");
                                if(datalist[index]["vendor"]["status"]=="Activated") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ItemsOfShop(
                                                venderid: datalist[index]["vendor"]["_id"],
                                                name: datalist[index]["vendor"]["businessName"],
                                              )));
                                }else{
                                  toastShow("Store close",Colors.redAccent);
                                }
                              },
                              title: Text(datalist[index]["vendor"]["businessName"]),
                              subtitle: Text(datalist[index]["vendor"]["typeOfStore"]),
                              style: ListTileStyle.drawer,
                              leading: Image.network(datalist[index]["vendor"]["shopPicture"]),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getserach(String value) async {
    ProductRepo().SearchAllproduct(value).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
            datalist=data["data"];
          load = false;
        } catch (e) {
          print("Error1" + e.toString());
          load = false;
          toastShow(e.toString(), Colors.red);
        }
        setState(() {});
      } else {
        load = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
        setState(() {});
      }
    });
  }
}
