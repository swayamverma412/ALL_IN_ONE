// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/screen/qrScan.dart';
import 'package:vendor_app/screen/shopDetails.dart';

import '../Controller/Homepage.dart';
import 'orderHistory.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  int index = -1;
  TextEditingController searchController = TextEditingController();

  @override
  initState() {
    super.initState();
    index = -1;
  }

  Widget vegetableCategory({String type = "", GestureTapCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 7, 8, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(Icons.arrow_forward_ios_sharp,
                color: Colors.red, size: 18),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageController>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  //
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
                          Text(
                            "  All Categories",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
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
                                screen: OrderPayment(),
                                withNavBar: false,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                model.loading
                    ? Center(
                        child:
                            CircularProgressIndicator(color: Colors.redAccent),
                      )
                    : Row(
                        children: [
                          Container(
                            width: w(0.35),
                            color: HexColor("D9D9D9"),
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: h(0.9),
                                ),
                                child: ListView.builder(
                                    itemCount:
                                        model.category_list!.data!.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 20),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2),
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<HomepageController>(
                                                    context,
                                                    listen: false)
                                                .updateindex(index);
                                          },
                                          child: Container(
                                            height: 110,
                                            decoration: BoxDecoration(
                                              border: model.index == index
                                                  ? Border(
                                                      left: BorderSide(
                                                          color: Colors
                                                              .red, // check index here
                                                          width: 7),
                                                    )
                                                  : null,
                                              // color: Colors.white,
                                              color: model.index == index
                                                  ? Colors.white
                                                  : HexColor("D9D9D9"),
                                              //  borderRadius:
                                              //       BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  model
                                                      .category_list!
                                                      .data![index]
                                                      .categoryImage
                                                      .toString(),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.0,
                                                      left: 10,
                                                      right: 10),
                                                  child: AutoSizeText(
                                                    model
                                                        .category_list!
                                                        .data![index]
                                                        .categoryName
                                                        .toString(),
                                                    minFontSize: 1,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                      /*  return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                onTap: () {
                                  Provider.of<HomepageController>(context,listen: false).updateindex(index);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 5,
                                  child: Container(
                                    // padding: EdgeInsets.only(top: 4),
                                    height: 100,
                                    // width: 50,
                                    decoration: BoxDecoration(
                                      color: model.index == 0
                                          ? HexColor("FD2E2E")
                                          .withOpacity(0.45)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        // Image.asset(
                                        //   "assets/vegetable.png",
                                        // ),
                                        Icon(Icons.pedal_bike),
                                        // Text("Vegetables And Fruits"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, left: 10, right: 10),
                                          child: AutoSizeText(
                                            "Vegetables & Fruits",
                                            minFontSize: 1,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );*/
                                    }),
                                /*child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding:
                            const EdgeInsets.only(top: 10.0, bottom: 20),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (index == 0)
                                        index = -1;
                                      else
                                        index = 0;
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Container(
                                      // padding: EdgeInsets.only(top: 4),
                                      height: 100,
                                      // width: 50,
                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? HexColor("FD2E2E")
                                            .withOpacity(0.45)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          // Image.asset(
                                          //   "assets/vegetable.png",
                                          // ),
                                          Icon(Icons.pedal_bike),
                                          // Text("Vegetables And Fruits"),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10, right: 10),
                                            child: AutoSizeText(
                                              "Vegetables & Fruits",
                                              minFontSize: 1,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (index == 1)
                                        index = -1;
                                      else
                                        index = 1;
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        color: index == 1
                                            ? HexColor("FD2E2E")
                                            .withOpacity(0.45)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/vegetable.png",
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10, right: 10),
                                            child: AutoSizeText(
                                              "Vegetables & Fruits",
                                              minFontSize: 1,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2.5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (index == 2)
                                        index = -1;
                                      else
                                        index = 2;
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        color: index == 2
                                            ? HexColor("FD2E2E")
                                            .withOpacity(0.45)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/vegetable.png",
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10, right: 10),
                                            child: AutoSizeText(
                                              "Vegetables",
                                              minFontSize: 1,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2.5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (index == 3)
                                        index = -1;
                                      else
                                        index = 3;
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        color: index == 3
                                            ? HexColor("FD2E2E")
                                            .withOpacity(0.45)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/vegetable.png",
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10, right: 10),
                                            child: AutoSizeText(
                                              "Vegetables & Fruits",
                                              minFontSize: 1,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2.5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (index == 4)
                                        index = -1;
                                      else
                                        index = 4;
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        color: index == 4
                                            ? HexColor("FD2E2E")
                                            .withOpacity(0.45)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/vegetable.png",
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10, right: 10),
                                            child: AutoSizeText(
                                              "Vegetables & Fruits",
                                              minFontSize: 1,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),*/
                              ),
                            ),
                          ),
                          Container(
                            width: w(0.65),
                            height: h(0.9),
                            child: model.category_list!.data![model.index]
                                        .subCategory!.length >
                                    0
                                ? ListView.builder(
                                    itemCount: model.category_list!
                                        .data![model.index].subCategory!.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 20),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return vegetableCategory(
                                        type: model
                                            .category_list!
                                            .data![model.index]
                                            .subCategory![index]
                                            .title
                                            .toString(),
                                        onTap: () {
                                          pushNewScreen(
                                            context,
                                            screen: ShopDetails(model
                                                .category_list!
                                                .data![model.index]
                                                .subCategory![index]
                                                .title
                                                .toString()),
                                            withNavBar:
                                                false, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                      );
                                    })
                                : SizedBox(),

                            ///Ui Code >>>>>>>>>>>>>>>>>>

                            /* child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10.0),
                        children: [
                          if (index == -1)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w(0.06), vertical: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: TextFormField(
                                  controller: searchController,
                                  style: TextStyle(fontSize: 16.0),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 14.0),
                                    border: InputBorder.none,
                                    hintText: "Search item or store ",
                                    fillColor: HexColor("D9D9D9"),
                                    filled: true,
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                          if (index == 0)
                            SizedBox(
                              height: h(1),
                              width: w(1),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10),
                                children: [
                                  vegetableCategory(
                                    type: "Leafy vegetables ",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Leafy vegetables ",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Leafy vegetables ",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Leafy vegetables ",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Leafy vegetables ",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Leafy vegetables ",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          if (index == 1)
                            SizedBox(
                              height: h(1),
                              width: w(1),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10),
                                children: [
                                  vegetableCategory(
                                    type: "Foods and Meals",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Foods and Meals ",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Foods and Meals",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Foods and Meals",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Foods and Meals",
                                    onTap: () {},
                                  ),
                                  vegetableCategory(
                                    type: "Foods and Meals",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          if (index == 2)
                            SizedBox(
                              height: h(1),
                              width: w(1),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10),
                                children: [
                                  vegetableCategory(
                                    type: "Dairy Products",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          if (index == 3)
                            SizedBox(
                              height: h(1),
                              width: w(1),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10),
                                children: [
                                  vegetableCategory(
                                    type: "Medicine",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          if (index == 4)
                            SizedBox(
                              height: h(1),
                              width: w(1),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10),
                                children: [
                                  vegetableCategory(
                                    type: "Snacks",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),*/
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
