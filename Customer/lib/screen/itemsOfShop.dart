// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/base/NOdata.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/data/AppContent.dart';

import '../Controller/Cart.dart';
import '../Controller/Product.dart';
import '../base/customerror.dart';
import 'cart.dart';

class ItemsOfShop extends StatefulWidget {
  String venderid, name;

  ItemsOfShop({required this.venderid,required this.name});

  @override
  State<ItemsOfShop> createState() => _ItemsOfShopState();
}

class _ItemsOfShopState extends State<ItemsOfShop> {
  String? id;
  bool viewcart = false;

  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false)
        .getAllproduct(widget.venderid.toString());
    getshared();
    super.initState();
  }

  getshared() async {
    id = await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    print("Id" + id.toString());
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

    return SafeArea(
        child: Consumer<ProductController>(builder: (context, model, child) {
      return Scaffold(
        bottomNavigationBar: model.viewcart
            ? Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "1 items",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: 90,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cart(),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "View Cart",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
        body: model.loadingpro
            ? Center(child: CircularProgressIndicator())
            : model.errorpro
                ? CustomeError():Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
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
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.qr_code, color: Colors.red),
                                  onPressed: () {},
                                ),

                                // model.viewcart? Badge(
                                //   padding: EdgeInsets.only(right: 25),
                                //   badgeContent: Text(context.watch<CartController>().cat_list!.data![0].items!.length.toString()),
                                //   child:Padding(
                                //     padding: const EdgeInsets.only(right: 10),
                                //     child: Icon(Icons.shopping_cart_outlined,
                                //         color: Colors.red),
                                //   ),
                                // ):
                                IconButton(
                                  icon: Icon(Icons.shopping_cart_outlined,
                                      color: Colors.red),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Cart(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.name.toString()}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: HexColor("8A8989"),
                                ),
                                Text(
                                  "2.9 km",
                                  style: TextStyle(
                                    color: HexColor("8A8989"),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: HexColor("8A8989"),
                                    ),
                                    Text(
                                      "10 mins",
                                      style: TextStyle(
                                        color: HexColor("8A8989"),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                      Text(
                                        "3.5",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            onChanged: (value){
                              Provider.of<ProductController>(context,listen: false).getSearch(id!,value);
                            },
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
                      ),
                      model.loadserch?Center(child: CircularProgressIndicator(),):
                      model.subcat.length==0?NoDataScreen(text: "No Product"): DefaultTabController(
                        length: model.subcat_tab!.length, // length of tabs
                        initialIndex: 0,
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 65,
                                child: TabBar(
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: Colors.red,
                                  labelColor: Colors.red,
                                  unselectedLabelColor: HexColor("8A8989"),
                                  tabs: List.generate(model.subcat_tab!.length,
                                      (index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Tab(
                                        text:
                                            model.subcat_tab![index].toString(),
                                      ),
                                    );
                                  }),
                                  /* tabs: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Vegetables'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Fruits'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Herbs'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Mushroom'),
                            ),
                          ],*/
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: List.generate(
                                      model.allProduct_list!.length, (index) {
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0, horizontal: 20),
                                        child: ListView.builder(
                                            itemCount: model
                                                .allProduct_list![index].length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context,
                                                int ind) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: items(
                                                    image: NetworkImage(model
                                                        .allProduct_list![index]
                                                            [ind]
                                                        .productImage
                                                        .toString()),
                                                    context: context,
                                                    name: model
                                                        .allProduct_list![index]
                                                            [ind]
                                                        .title
                                                        .toString(),
                                                    price: model
                                                        .allProduct_list![index]
                                                            [ind]
                                                        .price
                                                        .toString(),
                                                    tap: () {
                                                      final paramDic = {
                                                        "productId": model
                                                            .allProduct_list![
                                                                index][ind]
                                                            .id
                                                            .toString(),
                                                        "quantity": 1,
                                                      };
                                                      print(
                                                          paramDic.toString());
                                                      Provider.of<CartController>(
                                                              context,
                                                              listen: false)
                                                          .addtoCart(paramDic,
                                                              id!, true);
                                                      Provider.of<ProductController>(
                                                              context,
                                                              listen: false)
                                                          .update();
                                                    }),
                                              );
                                            }));
                                  }),
                                  /*children: <Widget>[
                            //For 1st tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: items(
                                      image: AssetImage("assets/potato.png"),
                                      index: 0,
                                      indexOfElement: 0,
                                      context: context,
                                      name: "Potato",
                                      priceOf1kg: 25,
                                      priceOf2kg: 50,
                                      priceOf5kg: 125,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: items(
                                      image: AssetImage("assets/potato.png"),
                                      index: 0,
                                      indexOfElement: 1,
                                      context: context,
                                      name: "Potato",
                                      priceOf1kg: 25,
                                      priceOf2kg: 50,
                                      priceOf5kg: 125,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //For 2nd tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                children: [],
                              ),
                            ),
                            //For 3rd tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                children: [],
                              ),
                            ),
                            //For 4th tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                children: [],
                              ),
                            ),
                          ],*/
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
      );
    }));
  }

  Widget items({
    required ImageProvider<Object> image,
    required BuildContext context,
    required GestureTapCallback tap,
    required String name,
    required String price,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: HexColor("D9D9D9"),
              ),
              image: DecorationImage(image: image),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rs. $price ",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.035,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "1 kg",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 100.0),
                                      child: InkWell(
                                        onTap: tap,
                                        /* onTap: () {
                                                selectedIndex[indexOfElement] =
                                                    0;
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder) {
                                                    return StatefulBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            StateSetter set) {
                                                      return Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.34,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 60.0,
                                                                  left: 20,
                                                                  right: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      name,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            70,
                                                                        child:
                                                                            Card(
                                                                          elevation:
                                                                              3,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Add",
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                tabName[index],
                                                                style:
                                                                    TextStyle(
                                                                  color: HexColor(
                                                                      "8A8989"),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            20.0),
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 145,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            160,
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.85,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        set(() {
                                                                                          if (selectedIndex[indexOfElement] == 0) {
                                                                                          } else {
                                                                                            selectedIndex[indexOfElement] = 0;
                                                                                            indexPrice[indexOfElement] = 0;
                                                                                            /////////////////////////////////////////////////////////////
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                      icon: selectedIndex[indexOfElement] == 0 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                    ),
                                                                                    Text("1 kg"),
                                                                                  ],
                                                                                ),
                                                                                Text("Rs. $priceOf1kg"),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        set(() {
                                                                                          if (selectedIndex[indexOfElement] == 1) {
                                                                                          } else {
                                                                                            indexPrice[indexOfElement] = 1;
                                                                                            selectedIndex[indexOfElement] = 1;
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                      icon: selectedIndex[indexOfElement] == 1 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                    ),
                                                                                    Text("2 kg"),
                                                                                  ],
                                                                                ),
                                                                                Text("Rs. $priceOf2kg"),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        set(() {
                                                                                          if (selectedIndex[indexOfElement] == 2) {
                                                                                          } else {
                                                                                            selectedIndex[indexOfElement] = 2;
                                                                                            indexPrice[indexOfElement] = 2;
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                      icon: selectedIndex[indexOfElement] == 2 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                    ),
                                                                                    Text("5 kg"),
                                                                                  ],
                                                                                ),
                                                                                Text("Rs. $priceOf5kg"),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
                                              },*/
                                        child: SizedBox(
                                          width: 70,
                                          child: Card(
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Add",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
