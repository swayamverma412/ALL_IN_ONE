// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/order_details.dart';

class MyOrders extends StatefulWidget {
  MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    int modelBottomSheetSelectedButton = 1;

    //New order list
    List<String> image = ["friend_profile.png", "friend_profile.png"];
    List<String> name = [
      "Swayam Verma",
      "Swayam Verma",
    ];
    List<String> date = [
      "24 August",
      "24 August",
    ];
    List<String> time = [
      "11:00 AM",
      "11:00 AM",
    ];
    List<String> orderNo = [
      "1234",
      "1234",
    ];
    List<String> itemCount = [
      "3",
      "3",
    ];
    List<String> totalAmount = [
      "200",
      "200",
    ];
    List<String> paymentType = [
      "COD",
      "COD",
    ];
    List<String> status = [
      "PENDING",
      "PENDING",
    ];

    //Past order list
    List<String> pastImage = ["friend_profile.png"];
    List<String> pastName = ["Swayam Verma"];
    List<String> pastDate = ["24 August"];
    List<String> pastTime = ["11:00 AM"];
    List<String> pastOrderNo = ["1234"];
    List<String> pastItemCount = ["3"];

    ScrollController newScrollController = ScrollController(
      initialScrollOffset: 10,
    );
    ScrollController pastScrollController = ScrollController();

    Widget newOrder() {
      return ListView.builder(
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: InkWell(
              onTap: () {
                pushNewScreen(context,
                    screen: OrderDetails(), withNavBar: false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/${image[index]}"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        date[index] + " , " + time[index],
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Order number - ${orderNo[index]}",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          " ${itemCount[index]} items",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rs.${totalAmount[index]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        paymentType[index],
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          status[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: status[index] == "PENDING"
                                ? HexColor("#F9BB8D")
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    Widget pastOrder() {
      return Scrollbar(
        thickness: 10,
        thumbVisibility: true,
        controller: pastScrollController,
        radius: const Radius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: w(1),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (
                        BuildContext context,
                      ) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter set) {
                          return SizedBox(
                            height: h(0.3),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: modelBottomSheetSelectedButton ==
                                                1
                                            ? Icon(Icons.radio_button_checked,
                                                color: Colors.red)
                                            : Icon(Icons.circle_outlined),
                                        onPressed: () {
                                          set(() {
                                            modelBottomSheetSelectedButton = 1;
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
                                            ? Icon(Icons.radio_button_checked,
                                                color: Colors.red)
                                            : Icon(Icons.circle_outlined),
                                        onPressed: () {
                                          set(() {
                                            modelBottomSheetSelectedButton = 2;
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
                                            ? Icon(Icons.radio_button_checked,
                                                color: Colors.red)
                                            : Icon(Icons.circle_outlined),
                                        onPressed: () {
                                          set(() {
                                            modelBottomSheetSelectedButton = 3;
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
                                            modelBottomSheetSelectedButton == 4
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    color: Colors.red,
                                                  )
                                                : Icon(Icons.circle_outlined),
                                        onPressed: () {
                                          set(() {
                                            modelBottomSheetSelectedButton = 4;
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
              ),
            ),
            SizedBox(
              height: h(0.6),
              width: w(1),
              child: ListView.builder(
                itemCount: pastName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: w(0.13)),
                          child: Image.asset("assets/${pastImage[index]}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pastName[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                pastDate[index] + " , " + pastTime[index],
                                style: TextStyle(color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Order number - ${pastOrderNo[index]}",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  " ${pastItemCount[index]} items",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
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
                        "My Orders",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  width: w(1),
                  height: h(0.8),
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorSize: TabBarIndicatorSize.label),
                    tabs: [
                      Text('New Orders'),
                      Text('Past Orders'),
                    ],
                    views: [
                      Scrollbar(
                        thickness: 10,
                        thumbVisibility: true,
                        controller: newScrollController,
                        radius: const Radius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: newOrder(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: pastOrder(),
                      ),
                    ],
                    // onChange: (index) => print(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
