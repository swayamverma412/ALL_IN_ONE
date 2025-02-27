// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/persistentNavBar.dart';

class DeliveredSuccessful extends StatelessWidget {
  DeliveredSuccessful({Key? key}) : super(key: key);

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
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PersistentNavBar()),
                (Route<dynamic> route) => false,
              );
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Back To Home',
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
        body: SizedBox(
          width: w(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/check_mark.png"),
              Text(
                "Delivered Successfully",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/deliveryMan.png"),
            ],
          ),
        ),
      ),
    );
  }
}
