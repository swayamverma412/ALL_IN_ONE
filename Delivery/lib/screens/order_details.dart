// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/screens/chatBox.dart';
import 'package:vendor_delivery/screens/delivered_successfully.dart';
import 'package:vendor_delivery/screens/home.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Widget groceryList({
    String type = "",
    String weight = "",
    String quantity = "",
    String totalPrice = "",
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("$weight x $quantity"), Text("Rs. $totalPrice")],
            ),
          )
        ],
      ),
    );
  }

  List<String> paymentType = [
    "Sub Total",
    "Service Fee",
    "Delivery Fee",
    "Discount"
  ];
  List<int> paymentAmount = [190, 10, 10, 10];

  Widget payment({
    required String paymentType,
    required int amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(paymentType), Text("Rs. $amount")],
    );
  }

  String deliveryStatus = "Ready To Deliver";

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              if (deliveryStatus == "Ready To Deliver") {
                setState(() {
                  deliveryStatus = "Mark as Picked";
                });
              } else {
                pushNewScreen(context,
                    screen: DeliveredSuccessful(), withNavBar: false);
              }
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  deliveryStatus,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: h * 0.058,
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                w * 0.02, h * 0.02, w * 0.02, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/user.png", height: 50),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Swayam Verma",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "24 August, 11:00 am",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.message),
                                  color: Colors.red,
                                  onPressed: () {
                                    pushNewScreen(context, screen: ChatBox());
                                  },
                                  iconSize: 30,
                                ),
                                IconButton(
                                  icon: Icon(Icons.call),
                                  color: Colors.red,
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                groceryList(
                                  type: "Fresh Potato",
                                  weight: "2kg",
                                  quantity: "1",
                                  totalPrice: "50",
                                ),
                                groceryList(
                                  type: "Fresh Potato",
                                  weight: "2kg",
                                  quantity: "1",
                                  totalPrice: "50",
                                ),
                                groceryList(
                                  type: "Fresh Potato",
                                  weight: "2kg",
                                  quantity: "1",
                                  totalPrice: "50",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: HexColor("D9D9D9").withOpacity(0.42),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Info",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 130,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 4,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 15, 40, 0),
                                          child: payment(
                                            amount: paymentAmount[index],
                                            paymentType: paymentType[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, right: 30, bottom: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Cash on Delivery",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "Rs. 200",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(w * 0.02, h * 0.02, w * 0.02, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/user.png", height: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Swayam Verma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "24 August, 11:00 am",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.arrow_drop_up),
                            color: Colors.red,
                            onPressed: () {
                              pushNewScreen(context,
                                  screen: Home(), withNavBar: false);
                            },
                            iconSize: 60,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
