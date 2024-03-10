// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/payment_successful.dart';
import 'package:vendor_shopkeeper/screens/selectPayment.dart';

class WalletTransfer extends StatefulWidget {
  final String name;
  final String number;
  final String image;
  WalletTransfer(
      {Key? key, required this.name, required this.number, required this.image})
      : super(key: key);

  @override
  State<WalletTransfer> createState() => _WalletTransferState();
}

class _WalletTransferState extends State<WalletTransfer> {
  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                          "Send to Friend",
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
              Container(
                height: h(0.8),
                width: w(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.image,
                      height: h(0.2),
                    ),
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),

                    Text(widget.number, style: TextStyle(color: Colors.grey)),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 30.0, bottom: 30),
                    //   child: Text(
                    //     "Rs 500",
                    //     style: TextStyle(
                    //         fontSize: 30,
                    //         color: Colors.red,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Container(
                      width: w(0.3),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Rs 500",
                          hintStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: SelectPayment(
                            onCashOnDeliveryTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Paymnet Successfully",
                                ),
                              );
                            },
                            onCreditCardTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Paymnet Successfully",
                                ),
                              );
                            },
                            onDebitCardTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Paymnet Successfully",
                                ),
                              );
                            },
                            onRazorPayTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Paymnet Successfully",
                                ),
                              );
                            },
                            onStripeTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Paymnet Successfully",
                                ),
                              );
                            },
                            onWalletTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Paymnet Successfully",
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 60,
                        width: 170,
                        child: Card(
                          color: Colors.red,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Send Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
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
