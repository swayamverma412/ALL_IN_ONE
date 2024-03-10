// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/screens/payment_successful.dart';
import 'package:vendor_delivery/screens/selectPayment.dart';

class AddMoney extends StatefulWidget {
  AddMoney({Key? key}) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
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
                          "Add Money",
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
                // height: h(0.8),
                width: w(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage("assets/user_profile.png"),
                      color: Colors.red,
                      size: h(0.3),
                    ),
                    Text(
                      "Enter Amount to be \nadded in the wallet",
                      style: TextStyle(fontSize: 25),
                    ),
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
                                  text: "Money Added\nSuccessfully",
                                ),
                              );
                            },
                            onCreditCardTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Money Added\nSuccessfully",
                                ),
                              );
                            },
                            onDebitCardTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Money Added\nSuccessfully",
                                ),
                              );
                            },
                            onRazorPayTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Money Added\nSuccessfully",
                                ),
                              );
                            },
                            onStripeTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Money Added\nSuccessfully",
                                ),
                              );
                            },
                            onWalletTap: () {
                              pushNewScreen(
                                context,
                                screen: PaymentSuccessful(
                                  text: "Money Added\nSuccessfully",
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
                              "Add Money",
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
