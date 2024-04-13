// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/controller/OrderController.dart';
import 'package:vendor_shopkeeper/model/OrderModel.dart';
import 'package:vendor_shopkeeper/screens/chatBox.dart';
import 'package:vendor_shopkeeper/screens/delivered_successfully.dart';
import 'package:vendor_shopkeeper/screens/track_location.dart';

import '../base/SnakeBAr.dart';
import '../repository/OrderRepo.dart';

class OrderDetails extends StatefulWidget {
  Data?data;
  String? id;
  OrderDetails({this.data,this.id});

  // List<Data>? ordermodel;
  // OrderDetails({required this.ordermodel});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  List<String> status= ["order placed", "accepted by vendor", "ready to deliver",
    "accepted by rider","marked as pickup","completed"];

bool load=false;

  Widget groceryList({
    String type = "",
    String weight = "",
    String quantity = "",
    int totalPrice = 0,
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
  List<int> paymentAmount = [];

  Widget payment({
    required String paymentType,
    required int amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(paymentType), Text("Rs. $amount")],
    );
  }

int heightlist  =0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
      bottomNavigationBar: Material(
          color: Colors.red,
          child:  status.length==widget.data!.status!.length ?SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child:Text("Order Done",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ): InkWell(
            onTap: () {
              setState(() {
                load=true;
              });
              getOrderUpdateApi(widget.data!.vendorId.toString(),widget.data!.id.toString(),status[widget.data!.status!.length].toString());
                /*pushNewScreen(context,
                    screen: DeliveredSuccessful(), withNavBar: false);*/

            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child:load?CircularProgressIndicator(color: Colors.white,): Text(status[widget.data!.status!.length].toString(),
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
                  height: 50,
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
                                      "${widget.data?.customer?.name.toString()}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(DateFormat('dd MMMM, hh:mm a').format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").
                                      parse('${widget.data?.createdAt.toString()}')),
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
                            child: SizedBox(
                              //height: MediaQuery.of(context).size.height*0.2,
                              child: ListView.builder(
                                primary: false,
                               // physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: widget.data?.items?.length,
                                itemBuilder: (BuildContext context,int index){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      groceryList(
                                        type:"${widget.data?.products?[index].title}",
                                        weight: '${widget.data?.products?[index].price}',
                                        quantity: "${widget.data?.items?[index].quantity}",
                                        totalPrice: int.parse("${widget.data?.products?[index].price}")*
                                          int.parse('${widget.data?.items?[index].quantity}'),
                                      ),

                                    ],
                                  );
                                },
                              ),
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
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, right: 30, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text( "Sub Total"),
                                        Text("Rs. ${widget.data!.totalPrice.toString()}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, right: 30, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text( "Service Fee"),
                                        Text("Rs. ${widget.data!.serviceFee.toString()}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, right: 30, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text( "Delivery Fee"),
                                        Text("Rs. ${widget.data!.deliveryFee.toString()}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, right: 30, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(   "Discount"),
                                        Text("Rs. ${widget.data!.couponDiscount.toString()}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 4, right: 30, bottom: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${widget.data?.paymentMethod.toString()}"
                                          " on Delivery",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "Rs. ${widget.data?.totalAmount.toString()}",
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
                                "${widget.data?.customer?.name.toString()}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.data?.createdAt.toString()}",
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
                                  screen: TrackLocation(), withNavBar: false);
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
  Future<void> getOrderUpdateApi(String vendor_id,String order_id,String status)async {
    final param={
      "status":status,
    };
    OrderRepo().UpdtaeOrder(vendor_id,order_id,param).then((value){
      print("value-------------"+value.body.toString());
      var data=jsonDecode(value.body);
      print("value------------->>>>>"+data.toString());
      if(value.statusCode==200){
        load=false;
        Navigator.of(context).pop();
        toastShow(data["message"].toString(),Colors.green);
      }else{
        load=false;
        print("Error");
        toastShow(data["message"].toString(),Colors.red);
      }
      setState(() {
      });
    });
  }
}
