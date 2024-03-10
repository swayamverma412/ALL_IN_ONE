// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SelectPayment extends StatelessWidget {
  SelectPayment({
    Key? key,
    this.onWalletTap,
    this.onDebitCardTap,
    this.onCreditCardTap,
    this.onCashOnDeliveryTap,
    this.onRazorPayTap,
    this.onStripeTap,
  }) : super(key: key);

//You can assign individual buttons a function on the Select Payment page
  Function()? onWalletTap;
  Function()? onDebitCardTap;
  Function()? onCreditCardTap;
  Function()? onCashOnDeliveryTap;
  Function()? onRazorPayTap;
  Function()? onStripeTap;

  Widget paymetType(
      {required String name,
      required String image,
      GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/$image",
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )
            ],
          ),
        ),
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
        body: Column(
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
                        "Select Payment",
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
            SizedBox(
              width: w(1),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount to pay Rs 200",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.68),
                      ),
                    ),
                    paymetType(
                        image: "wallet.png",
                        name: "Wallet",
                        onTap: onWalletTap),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text("CARDS"),
                    ),
                    paymetType(
                        image: "debitCard.png",
                        name: "Debit Card",
                        onTap: onDebitCardTap),
                    paymetType(
                        image: "debitCard.png",
                        name: "Credit Card",
                        onTap: onCreditCardTap),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text("CASH"),
                    ),
                    paymetType(
                        image: "cod.png",
                        name: "Cash on Delivery",
                        onTap: onCashOnDeliveryTap),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text("OTHERS"),
                    ),
                    paymetType(
                        image: "razorPay.png",
                        name: "RazorPay",
                        onTap: onRazorPayTap),
                    paymetType(
                        image: "stripe.png",
                        name: "Stripe",
                        onTap: onStripeTap),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
