// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/orderController.dart';
import 'package:vendor_app/base/NOdata.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/coupons.dart';
import 'package:vendor_app/screen/orderPlaced.dart';
import 'package:vendor_app/screen/selectPayment.dart';

import '../Controller/Cart.dart';
import '../Model/OrderModel/Updateaddress.dart';
import '../Repo/Product_repo.dart';
import '../base/SnakeBAr.dart';
import '../base/customerror.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isSelfPickChecked = true;
  String? id;
  @override
  List<String> itemName = [
    "Fresh Potato",
    "Fresh Onion",
    "Fresh Carrort",
    "Fresh Aaloo",
    "Fresh Duck"
  ];
  List<int> itemWeight = [2, 3, 4, 2, 2];
  List<double> itemPrice = [10, 20, 30, 40, 10];
  List<int> initialAmount = [1, 2, 3, 4, 2];
  List<int> increaseAmount = [1, 2, 3, 2, 1];
  List<Address> address = [];

  Widget items({
    required int initialAmount,
    required int weight,
    required double price,
    required String name,
    required int index,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  Text(
                    "$weight kg",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 70,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          /* setState(() {
                            increaseAmount[index] += 1;
                          });*/
                        },
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        increaseAmount[index].toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      InkWell(
                        onTap: () {
                          /*  setState(() {
                            if (increaseAmount[index] == 1) {
                            } else
                              increaseAmount[index] -= 1;
                          });*/
                        },
                        child: Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "       Rs." + (price * increaseAmount[index]).toString(),
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
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
    required num amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(paymentType), Text("Rs. $amount")],
    );
  }

  @override
  void initState() {
    getshared();
    super.initState();
  }

  getshared() async {
    id = await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    Provider.of<CartController>(context, listen: false).getcart(id!);
  }

  @override
  void didChangeDependencies() {
    var addrss = Provider.of<ordercontroller>(context, listen: false)
        .address!
        .data!
        .address!
        .where((element) =>
            element.addressType ==
            "${context.watch<ordercontroller>().selectaddress.toString()}")
        .toList();
    print(addrss.length);
    setState(() {
      address = addrss;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, model, child) {
      return SafeArea(
        child: model.loading
            ? Center(
                child: CircularProgressIndicator(color: Colors.redAccent),
              )
            : model.error
                ? Center(child: NameError("No Cart Found"))
                : model.cat_list!.data!.length == 0
                    ? NoDataScreen(text: "NO Cart")
                    : Scaffold(
                        bottomNavigationBar: Material(
                          color: Colors.red,
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: SelectPayment(
                                  id: id.toString(),
                                  address: Provider.of<ordercontroller>(context,
                                          listen: false)
                                      .selectaddress
                                      .toString(),
                                  amount: model.cat_list!.data![0].totalPrice
                                      .toString(),
                                  onWalletTap: () {
/*
                      orderplace("${context.watch<ordercontroller>().selectaddress.toString()}", id);
*/
                                  },
                                  onCreditCardTap: () {
                                    pushNewScreen(context,
                                        screen: OrderPlaced());
                                  },
                                  onDebitCardTap: () {
                                    pushNewScreen(context,
                                        screen: OrderPlaced());
                                  },
                                  onRazorPayTap: () {
                                    pushNewScreen(context,
                                        screen: OrderPlaced());
                                  },
                                  onStripeTap: () {
                                    pushNewScreen(context,
                                        screen: OrderPlaced());
                                  },
                                  onCashOnDeliveryTap: () {
                                    pushNewScreen(context,
                                        screen: OrderPlaced());
                                  },
                                ),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: SizedBox(
                              height: kToolbarHeight,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Pay Rs. ${model.cat_list!.data!.length == 0 ? "0" : model.loading ? "0" : model.cat_list!.data![0].totalPrice.toString()}',
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: kElevationToShadow[4],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      "Confirm Order",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 25, 0, 20),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text(
                                          model.cat_list!.data![0].vendor!
                                              .businessName
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, right: 50),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: model
                                              .cat_list!.data![0].items!.length,
                                          // itemCount: 4,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.07,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            model
                                                                .cat_list!
                                                                .data![0]
                                                                .products![
                                                                    index]
                                                                .title
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            " Rs. " +
                                                                model
                                                                    .cat_list!
                                                                    .data![0]
                                                                    .products![
                                                                        index]
                                                                    .price
                                                                    .toString(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 70,
                                                            child: Card(
                                                              elevation: 5,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      final paramDic =
                                                                          {
                                                                        "productId": model
                                                                            .cat_list!
                                                                            .data![0]
                                                                            .items![index]
                                                                            .productId
                                                                            .toString(),
                                                                        "quantity":
                                                                            1,
                                                                      };
                                                                      print(paramDic
                                                                          .toString());
                                                                      Provider.of<CartController>(context, listen: false).addtoCart(
                                                                          paramDic,
                                                                          id!,
                                                                          true);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    model
                                                                        .cat_list!
                                                                        .data![
                                                                            0]
                                                                        .items![
                                                                            index]
                                                                        .quantity
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      final paramDic =
                                                                          {
                                                                        "productId": model
                                                                            .cat_list!
                                                                            .data![0]
                                                                            .items![index]
                                                                            .productId
                                                                            .toString(),
                                                                        "removeProduct":
                                                                            1,
                                                                      };
                                                                      print(paramDic
                                                                          .toString());
                                                                      Provider.of<CartController>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .Updatecart(
                                                                              paramDic,
                                                                              id!);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "       Rs." +
                                                                (model
                                                                            .cat_list!
                                                                            .data![
                                                                                0]
                                                                            .products![
                                                                                index]
                                                                            .price! *
                                                                        model
                                                                            .cat_list!
                                                                            .data![0]
                                                                            .items![index]
                                                                            .quantity!)
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 30.0, left: 20, right: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            if(model.coupenapply==true){

                                            }else {
                                              pushNewScreen(
                                                context,
                                                screen: Coupons(),
                                                withNavBar: false,
                                                pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                              ).then((value) => {
                                                getshared(),
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                color: HexColor("8A8989"),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.0),
                                                  child: Image.asset(
                                                      "assets/copons.png"),
                                                ),
                                                model.coupenapply==true?Text(
                                                  "     Coupon Applied",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                  ),
                                                ):Text(
                                                  "     Apply Coupons",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      /*   Padding(
                          padding:
                          const EdgeInsets.fromLTRB(0, 15, 40, 0),
                          child: payment(
                            amount:  model.cat_list!.data![0].totalPrice!,
                            paymentType: "Subtotal Fee",
                          ),
                        ),*/
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, right: 30, top: 15),
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 15, 40, 0),
                                              child: payment(
                                                amount: model.cat_list!.data![0]
                                                    .serviceFee!,
                                                paymentType: "Service Fee",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 15, 40, 0),
                                              child: payment(
                                                amount: model.cat_list!.data![0]
                                                    .deliveryFee!,
                                                paymentType: "Delivery Fee",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 15, 40, 0),
                                              child: payment(
                                                amount: model.cat_list!.data![0]
                                                    .discount!,
                                                paymentType: "Discount Fee",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "Rs. ${model.cat_list!.data![0].totalPrice.toString()}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: isSelfPickChecked
                                                      ? Icon(
                                                          Icons
                                                              .check_box_outline_blank_outlined,
                                                          size: 25,
                                                        )
                                                      : Icon(
                                                          Icons.check_box,
                                                          color: Colors.red,
                                                          size: 25,
                                                        ),
                                                  onPressed: () {
                                                    /* setState(() {
                                        isSelfPickChecked = !isSelfPickChecked;
                                      });*/
                                                  },
                                                ),
                                                Text(
                                                  "Self Pickup",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                    ),
                                                    Text(
                                                      "Deliver to",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        " ${context.watch<ordercontroller>().selectaddress.toString()}",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    address[0]
                                                        .location
                                                        .toString(),
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      color: HexColor("8A8989"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
      );
    });
  }
}
