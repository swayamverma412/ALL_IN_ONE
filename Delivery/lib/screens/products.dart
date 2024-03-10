// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'add_item.dart';
import 'edit_item.dart';

class Products extends StatefulWidget {
  Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  TextEditingController searchController = TextEditingController();

  List name = ["Fresh Potato", "Fresh Potato"];
  List image = ["potato.png", "potato.png"];
  List price = ["25", "25"];
  List weight = [1, 3];

  //if 0 -> item is not in stock , if 1 item is in stock
  List isItemInStock = [1, 0];

  Widget item(
    BuildContext context, {
    required GestureTapCallback onTap,
    required String image,
    required String name,
    required String price,
    required String weight,
    required int isItemInStock,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                image: AssetImage("assets/$image"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
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
                      "Rs.$price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "$weight kg",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      ClipRRect(
                        child: GestureDetector(
                          onTap: onTap,
                          child: SizedBox(
                            height: 30,
                            width: 90,
                            child: Card(
                              elevation: 3,
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Edit Item",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      isItemInStock == 1
                          ? Row(
                              children: [
                                Text(
                                  "In Stock",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 12,
                                )
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  "Out of Stock",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey,
                                  size: 12,
                                )
                              ],
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
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
          // floatingActionButton: Container(color: Colors.red),
          floatingActionButton: FloatingActionButton(
              elevation: 0.0,
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: AddItem(),
                  withNavBar: false,
                );
              }),
          body: Column(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "My Products",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
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
                  ),
                  DefaultTabController(
                    length: 4, // length of tabs
                    initialIndex: 0,
                    child: SizedBox(
                      width: w(1),
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
                              tabs: [
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
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            // width: w(1),
                            // height: 400,
                            // decoration: BoxDecoration(
                            //   border: Border.all(),
                            // ),
                            constraints: BoxConstraints(
                              maxHeight: h(0.53),
                              maxWidth: w(1),
                            ),
                            child: TabBarView(
                              children: <Widget>[
                                //For 1st tab
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 20),
                                  child: ListView.builder(
                                    itemCount: name.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: item(
                                          context,
                                          onTap: () {
                                            pushNewScreen(
                                              context,
                                              screen: EditItem(
                                                name: name[index],
                                              ),
                                              withNavBar: false,
                                            );
                                          },
                                          isItemInStock: isItemInStock[index],
                                          image: image[index],
                                          name: name[index],
                                          price: price[index],
                                          weight: weight[index].toString(),
                                        ),
                                      );
                                    },
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
