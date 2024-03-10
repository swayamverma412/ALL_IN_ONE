// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/base/Perferance.dart';
import 'package:vendor_delivery/screens/support.dart';

import '../Model/OrderModel.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import '../repository/OrderRepo.dart';
import 'chatBox.dart';

class TrackLocation extends StatefulWidget {
  Data? data;

  TrackLocation(this.data);

  @override
  State<TrackLocation> createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {
  CameraPosition? _kGoogle;
  final List<Marker> _markers = <Marker>[];
  bool load = true;
  bool click=false;
  GoogleMapController? mapController;

  Widget  currentOrders(
      BuildContext context, {
        String image = "",
        String type = "",
        String date = "",
        String time = "",
        String storeName = "",
        String to = "",
        String status = "",
      }) {
    return Container(
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: HexColor("D9D9D9").withOpacity(0.47),
                    border: Border.all(
                      color: HexColor("D9D9D9"),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  height: 20,
                  child: Image.network(
                    image,

                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child:
                        Text(status, style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      children: [
                        Text(
                          "$date, $time",
                          style: TextStyle(color: Colors.grey),
                        ),
                        status=="accepted by rider"? InkWell(
                          onTap: () async {
                            setState(() {
                              click=true;
                            });
                            String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
                            final param={
                              "orderId":widget.data!.id.toString(),
                              "status":"completed",
                            };
                            OrderRepo().UpdateOrder(id, param).then((value){
                              print("value" + value.body.toString());
                              var data = jsonDecode(value.body);
                              if (value.statusCode == 200) {
                                  click = false;
                                  Navigator.of(context).pop();
                              } else {
                                click = false;
                                print("Error");
                                toastShow(data["message"].toString(), Colors.red);
                              }
                              setState(() {
                              });
                            });
                          },
                          child: Container(
                            // height: 15,
                            // width: 50,
                            margin: EdgeInsets.only(left: 40),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:click?SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(color: Colors.white,)): Padding(
                              padding: const EdgeInsets.all(6.0),
                              child:Text("Complete",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ):SizedBox(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.arrow_drop_down,
                        //   color: Colors.red,
                        //   size: ,
                        // ),
                        Image.asset("assets/down_arrow.png"),
                        Text(storeName, style: TextStyle(fontSize: 14))
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        Text(
                          to,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

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

  @override
  void initState() {
    print(widget.data!.toJson());
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(
            widget.data!.deliveryLocation!.coordinates![0].toDouble(),
            widget.data!.deliveryLocation!.coordinates![1].toDouble()),
        infoWindow: InfoWindow(
          title: 'My Current Location',
        ),
      ));

      _kGoogle = CameraPosition(
        target: LatLng( widget.data!.deliveryLocation!.coordinates![0].toDouble(),  widget.data!.deliveryLocation!.coordinates![1].toDouble()),
        zoom: 15,
      );
      mapController?.animateCamera(CameraUpdate.newCameraPosition(_kGoogle!));
      setState(() {
      });
      load = false;
      setState(() {
      });
    });
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
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
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Track Order",
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w(0.06), vertical: h(0.03)),
                child: currentOrders(
                  context,
                  type: widget.data!.customerDetails![0].name.toString(),
                  image: widget.data!.vendorDetails![0].shopPicture.toString(),
                  date: "24 August",
                  time: "11:00AM",
                  status: widget.data!.status![widget.data!.status!.length-1].toString(),
                  storeName: widget.data!.vendorDetails![0].businessName.toString(),
                  to: widget.data!.deliveryLocation!.addressType.toString(),
                ),
              ),
              Container(
                height: h(0.44),
                width: w(1),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: load
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : GoogleMap(
                  initialCameraPosition: _kGoogle!,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  indoorViewEnabled: true,
                  markers: Set<Marker>.of(_markers),
                  mapToolbarEnabled: false,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      mapController=controller;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w(0.02), h(0.02), w(0.02), 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/user.png", height: 50),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data!.vendorDetails![0].vendorName.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Vendor name",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.support_agent_outlined),
                          color: Colors.red,
                          onPressed: () {
                            pushNewScreen(context, screen: Support());
                          },
                          iconSize: 30,
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: h(0.02), horizontal: w(0.08)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.data!.items!.length.toString() + " Item"),
                    SizedBox(
                      height: 40,
                      width: 110,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          w(0.02), h(0.02), w(0.02), 0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset("assets/user.png",
                                                  height: 50),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.data!.vendorDetails![0].vendorName.toString(),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Vendor Partner",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.message),
                                                color: Colors.red,
                                                onPressed: () {
                                                  pushNewScreen(context,
                                                      screen: ChatBox());
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
                                        ],
                                      ),
                                    ),
                                   /* Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 20, 40, 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: List.generate(
                                            widget.data!.products!.length,
                                                (index) {
                                              return groceryList(
                                                type: widget
                                                    .data!.products![index].title
                                                    .toString(),
                                                weight: widget
                                                    .data!.products![index].price
                                                    .toString(),
                                                quantity: widget
                                                    .data!.items![index].quantity
                                                    .toString(),
                                                totalPrice: (widget
                                                    .data!
                                                    .products![index]
                                                    .price! *
                                                    widget.data!.items![index]
                                                        .quantity!)
                                                    .toString(),
                                              );
                                            }),
                                        *//* children: [
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
                                        ],*//*
                                      ),
                                    ),*/
                                    Container(
                                      color:
                                      HexColor("D9D9D9").withOpacity(0.42),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, right: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Payment Info",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              height: 130,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 40, 0),
                                                    child: payment(
                                                      amount: int.parse(widget
                                                          .data!.serviceFee
                                                          .toString()),
                                                      paymentType:
                                                      "Service Fee",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 40, 0),
                                                    child: payment(
                                                      amount: int.parse(widget
                                                          .data!.deliveryFee
                                                          .toString()),
                                                      paymentType:
                                                      "Delivery Fee",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 40, 0),
                                                    child: payment(
                                                      amount: int.parse(widget
                                                          .data!.discount
                                                          .toString()),
                                                      paymentType:
                                                      "Discount Fee",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            /*Container(
                                              height: 130,
                                              child: ListView.builder(
                                                // physics:
                                                //     NeverScrollableScrollPhysics(),
                                                itemCount: 4,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 15, 40, 0),
                                                    child: payment(
                                                      amount:
                                                          paymentAmount[index],
                                                      paymentType:
                                                          paymentType[index],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),*/
                                            Divider(
                                              color: HexColor("000000")
                                                  .withOpacity(0.56),
                                              thickness: 4,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.0, right: 50),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Total",
                                                    style:
                                                    TextStyle(fontSize: 18),
                                                  ),
                                                  Text(
                                                    "Rs. ${widget.data!.totalPrice.toString()}",
                                                    style:
                                                    TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(widget
                                                    .data!.items!.length
                                                    .toString() +
                                                    " item"),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 30.0, bottom: 30),
                                                  child: SizedBox(
                                                    height: 40,
                                                    width: 80,
                                                    child: Card(
                                                      elevation: 5,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10),
                                                            color: Colors.red,
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                      8.0),
                                                                  child: Text(
                                                                    "Close",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: Colors
                                                                        .white)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "View Cart",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
