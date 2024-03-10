// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/Homepage.dart';
import 'package:vendor_app/Controller/orderController.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/base/customerror.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/qrScan.dart';
import 'package:vendor_app/screen/subCategories.dart';
import 'package:vendor_app/screen/shopDetails.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Search.dart';
import 'cart.dart';
import 'categories.dart';
import 'itemsOfShop.dart';
import 'orderHistory.dart';
import 'package:vendor_app/screen/Location.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

TextEditingController searchController = TextEditingController();

class _homepageState extends State<homepage> {
  String? address;
  @override
  void initState() {
    getshared();
    Provider.of<HomepageController>(context, listen: false).getCategory();
    super.initState();
  }

  getshared() async {
    String lat = await SharedPreferenceClass.GetSharedData(AppContent.LAT);
    String lng = await SharedPreferenceClass.GetSharedData(AppContent.LNG);
     address = await SharedPreferenceClass.GetSharedData(AppContent.SELECTADDRESS);
    Provider.of<HomepageController>(context,
        listen: false)
        .updateselctaddress(address.toString());
    Provider.of<HomepageController>(context, listen: false).getstore(lat, lng);
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

//Creates a widget down the Todays Trending shop

    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        child: Scaffold(body:
            Consumer<HomepageController>(builder: (context, model, child) {
          return SingleChildScrollView(
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
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          DropdownButton(
                            // Initial Value
                            value:model.selectaddress,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: Provider.of<ordercontroller>(context,
                                    listen: false)
                                .addressdrop
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (value) async {
                              Provider.of<HomepageController>(context,
                                  listen: false)
                                  .updateselctaddress(value.toString());
                              Provider.of<ordercontroller>(context,
                                      listen: false)
                                  .updateselctaddress(value.toString());
                            },
                          ),
                          /* Text(
                              "${context.watch<ordercontroller>().selectaddress.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen: Location(),
                                  withNavBar: false,
                                );

                              },
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 30,
                                color: Colors.red,
                              ),
                            ),*/
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.qr_code, color: Colors.red),
                            onPressed: () {
                              pushNewScreen(
                                context,
                                screen: QrScan(),
                                withNavBar: false,
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: Colors.red),
                            onPressed: () {
                              pushNewScreen(
                                context,
                                screen: Cart(),
                                withNavBar: false,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: w(0.06), vertical: 20),
                  child: InkWell(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: Search_Screen(),
                        withNavBar: false,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        enabled: false,
                        controller: searchController,
                        style: TextStyle(fontSize: 16.0),
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: h(0.2),
                          child: model.loading2
                              ? Center(child: CircularProgressIndicator())
                              : model.error2
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/superSales.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  : CarouselSlider(
                                      options: CarouselOptions(
                                          aspectRatio: 3, autoPlay: true),
                                      items: model.banner.map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      i.toString()),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                        ),
                      ),
                      Container(
                        height: h(0.3),
                        child: model.loading
                            ? Center(child: CircularProgressIndicator())
                            : model.error
                                ? CustomeError()
                                : GridView.builder(
                                    padding: const EdgeInsets.only(top: 20),
                                    shrinkWrap: true,
                                    primary: false,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        model.category_list!.data!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 3 / 3,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          print(model.category_list!
                                              .data![index].subCategory
                                              .toString());
                                          pushNewScreen(
                                            context,
                                            screen: SubCategories(
                                                SubCategory_list: model
                                                    .category_list!
                                                    .data![index]
                                                    .subCategory!,
                                                name: model.category_list!
                                                    .data![index].categoryName
                                                    .toString()),
                                            withNavBar: false,
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          elevation: 5,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: h(0.07),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  18)),
                                                  image: DecorationImage(
                                                    image: NetworkImage(model
                                                        .category_list!
                                                        .data![index]
                                                        .categoryImage
                                                        .toString()),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.0),
                                                child: AutoSizeText(
                                                  // "Vegetables",
                                                  model.category_list!
                                                      .data![index].categoryName
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  softWrap: true,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                      ),
                      /*  Container(
                          height: h(0.4),
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 20),
                            childAspectRatio: 2 / 3,
                            mainAxisSpacing: 10,
                            crossAxisCount: 4,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: SubCategories(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/vegetable.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Vegetables & Fruits",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // child: TextFormField(
                        //   controller: searchController,
                        //   style: TextStyle(fontSize: 16.0),
                        //   decoration: InputDecoration(
                        //     contentPadding:
                        //         const EdgeInsets.symmetric(vertical: 14.0),
                        //     border: InputBorder.none,
                        //     hintText: "See all categories",
                        //     fillColor: HexColor("D9D9D9"),
                        //     filled: true,
                        //     // prefixIcon: IconButton(
                        //     //   icon: Icon(Icons.calendar_view_month),
                        //     //   onPressed: () {},
                        //     // ),
                        //     prefixIcon: Icon(Icons.calendar_view_month),
                        //   ),
                        // ),
                        child: InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: Categories(), withNavBar: false);
                          },
                          child: Container(
                              width: w(1),
                              height: 50,
                              decoration: BoxDecoration(
                                color: HexColor("D9D9D9"),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.calendar_view_month,
                                      color: HexColor("8A8989")),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("  See all categories",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: HexColor("8A8989"),
                                        )),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "TODAY’S TRENDING SHOP ",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ),
                      model.loading1
                          ? Center(child: CircularProgressIndicator())
                          : model.error1
                              ? CustomeError()
                              : model.store.length > 0
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: model.store.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return trendingShop(
                                            id: model.store[index]["_id"]
                                                .toString(),
                                            imageUrl: model.store[index]
                                                    ["image"]
                                                .toString(),
                                            storeName: model.store[index]
                                                    ["name"]
                                                .toString(),
                                            storeType: model.store[index]
                                                    ["type"]
                                                .toString(),
                                            w: w(1));
                                      })
                                  : SizedBox(),
                      /*ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 10.0),
                          children: <Widget>[
                            trendingShop(
                                imageUrl: "beststore.png",
                                storeName: "Tripathi Store",
                                storeType: "Vegetables & Fruits",w: w(1)
                            ),
                            trendingShop(
                              imageUrl: "beststore1.png",
                              storeName: "Tripathi Store",
                              storeType: "Vegetables & Fruits",
                            ),
                          ],
                        )*/
                    ],
                  ),
                ),
              ],
            ),
          );
        })),
      ),
    );
  }

  Widget trendingShop({
    String id = '',
    String imageUrl = "",
    String storeName = "",
    String storeType = "",
    double? w,
  }) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: ItemsOfShop(venderid: id,name: storeName),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: 60,
        width: w,
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "$imageUrl",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    storeType,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
