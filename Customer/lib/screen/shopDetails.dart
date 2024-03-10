// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/Product.dart';
import 'package:vendor_app/Controller/StoreController.dart';
import 'package:vendor_app/screen/itemsOfShop.dart';

class ShopDetails extends StatefulWidget {
  String? title;

  ShopDetails(this.title);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

TextEditingController searchController = TextEditingController();

class _ShopDetailsState extends State<ShopDetails> {
  @override
  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  //Returns a double, width of the screen multipled by the width given
  //The width given should range between 0-1 (0 -> No width , 1 -> Full screen width)
  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  //Decides if the view type is grid or not
  bool isGrid = false;

  @override
  void initState() {
    print("Title" + widget.title.toString());
    Provider.of<StoreController>(context, listen: false)
        .getstore_Subcategory(widget.title.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreController>(builder: (context, model, child) {
      return SafeArea(
        child: GestureDetector(
          onTap: () {
            // FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
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
                          // mainAxisAlignment: MainAxisAlignment.center,
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
                              "${widget.title.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       icon: Icon(Icons.qr_code, color: Colors.red),
                        //       onPressed: () {},
                        //     ),
                        //     IconButton(
                        //       icon: Icon(Icons.shopping_cart_outlined,
                        //           color: Colors.red),
                        //       onPressed: () {},
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: w(0.06), vertical: 20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: searchController,
                            style: TextStyle(fontSize: 16.0),
                            onChanged: (value) {},
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
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.title.toString()} store found",
                                style: TextStyle(
                                  color: HexColor("8A8989"),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  model.isGrid
                                      ? Icons.list
                                      : Icons.grid_view_sharp,
                                  color: HexColor("8A8989"),
                                ),
                                onPressed: () {
                                  Provider.of<StoreController>(context,
                                          listen: false)
                                      .changegrid();
                                },
                              ),
                            ],
                          ),
                        ),
                        model.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Colors.redAccent),
                              )
                            : model.isGrid
                                ? Container(
                                    height: h(1),
                                    width: w(1),
                                    child: GridView.builder(
                                        padding: EdgeInsets.all(15),
                                        shrinkWrap: true,
                                        itemCount: model
                                            .subcategory_store!.data!.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          crossAxisCount: 3,
                                          childAspectRatio: 5 / 6,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return storeGrid(
                                            image: model
                                                .subcategorystore!
                                                .data![index]
                                                .vendorDetails![0]
                                                .shopPicture
                                                .toString(),
                                            storeName: model
                                                .subcategorystore!
                                                .data![index]
                                                .vendorDetails![0]
                                                .businessName
                                                .toString(),
                                            rating: 3.5,
                                            onTap: () {
                                              pushNewScreen(
                                                context,
                                                screen: ItemsOfShop(
                                                    venderid: model
                                                        .subcategorystore!
                                                        .data![index]
                                                        .vendorDetails![0]
                                                        .id
                                                        .toString(),
                                                name:  model
                                                    .subcategorystore!
                                                    .data![index]
                                                    .vendorDetails![0]
                                                    .businessName
                                                    .toString()),
                                                withNavBar: false,
                                                pageTransitionAnimation:
                                                    PageTransitionAnimation
                                                        .cupertino,
                                              );
                                            },
                                          );
                                        }),
                                    /* child: GridView.count(
                            // padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            childAspectRatio: 5 / 6,
                            children: [
                              storeGrid(
                                image: "veges.png",
                                storeName: "Tripathi",
                                rating: 3.5,
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: ItemsOfShop(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                  );
                                },
                              ),
                              storeGrid(
                                image: "veges.png",
                                storeName: "Tripathi",
                                rating: 3.5,
                              ),
                              storeGrid(
                                image: "veges.png",
                                storeName: "Tripathi",
                                rating: 3.5,
                              ),
                              storeGrid(
                                image: "veges.png",
                                storeName: "Tripathi",
                                rating: 3.5,
                              ),
                            ],
                          ),*/
                                  )
                                : ListView.builder(
                                    itemCount:
                                        model.subcategory_store!.data!.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return storesList(
                                        imageUrl: model
                                            .subcategorystore!
                                            .data![index]
                                            .vendorDetails![0]
                                            .shopPicture
                                            .toString(),
                                        storeName: model
                                            .subcategorystore!
                                            .data![index]
                                            .vendorDetails![0]
                                            .businessName
                                            .toString(),
                                        storeType: model
                                            .subcategorystore!
                                            .data![index]
                                            .vendorDetails![0]
                                            .typeOfStore
                                            .toString(),
                                        rating: 3.5,
                                        distance: 10,
                                        time: 40,
                                        onTap: () {
                                          pushNewScreen(
                                            context,
                                            screen: ItemsOfShop(
                                                venderid: model
                                                    .subcategorystore!
                                                    .data![index]
                                                    .vendorDetails![0]
                                                    .id
                                                    .toString(),
                                            name:  model
                                                .subcategorystore!
                                                .data![index]
                                                .vendorDetails![0]
                                                .businessName
                                                .toString()),
                                            withNavBar: false,
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                      );
                                    })
                        /*: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,primary: false,
                          padding: const EdgeInsets.only(top: 10.0),
                          children: [
                            storesList(
                              imageUrl: "veges.png",
                              storeName: "Tripatio",
                              storeType: "Vegetables",
                              rating: 3.5,
                              distance: 10,
                              time: 40,
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ItemsOfShop(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            storesList(
                              imageUrl: "veges.png",
                              storeName: "Tripati",
                              storeType: "Vegetables",
                              rating: 4.5,
                              distance: 10,
                              time: 40,
                            ),
                            storesList(
                              imageUrl: "veges.png",
                              storeName: "Tripati",
                              storeType: "Vegetables",
                              rating: 3.5,
                              distance: 10,
                              time: 40,
                            ),
                            storesList(
                              imageUrl: "veges.png",
                              storeName: "Tripati",
                              storeType: "Vegetables",
                              rating: 3.5,
                              distance: 10,
                              time: 40,
                            ),
                            storesList(
                              imageUrl: "veges.png",
                              storeName: "Tripati",
                              storeType: "Vegetables",
                              rating: 3.5,
                              distance: 10,
                              time: 40,
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  //Creates widgets for GridView(if isGrid = true)
  Widget storeGrid(
      {String image = "",
      String storeName = "",
      double rating = 0,
      GestureTapCallback? onTap}) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.network(
                  "$image",
                  width: w(1),
                  height: h(0.08),
                  fit: BoxFit.fill,
                ),
              ),
              AutoSizeText(
                storeName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_purple500_outlined,
                      color: Colors.red, size: 15),
                  Text(
                    rating.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //Create a widget for list view (isGrid = false)
  Widget storesList(
      {String imageUrl = "",
      String storeName = "",
      String storeType = "",
      double rating = 0,
      double distance = 0.0,
      int time = 0,
      GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  // padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl.toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          storeName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_purple500_outlined,
                                color: Colors.red),
                            Text(
                              rating.toString(),
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.0),
                          child: SizedBox(
                            width: w(0.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: HexColor("8A8989"),
                                      size: 12,
                                    ),
                                    Text(
                                      distance.toString() + " | ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: HexColor("8A8989"),
                                      ),
                                    ),
                                    Text(
                                      storeType,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: HexColor("8A8989"),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer_sharp,
                                      size: 15,
                                      color: HexColor("8A8989"),
                                    ),
                                    Text(
                                      time.toString() + " min",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: HexColor("8A8989"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
