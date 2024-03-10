import 'package:flutter/material.dart';
import 'package:vendor_shopkeeper/persistentNavBar.dart';
import 'package:vendor_shopkeeper/screens/delivered_successfully.dart';
import 'package:vendor_shopkeeper/screens/login1.dart';
import 'package:vendor_shopkeeper/screens/myAccount.dart';
import 'package:vendor_shopkeeper/screens/myOrders.dart';
import 'package:vendor_shopkeeper/screens/my_earning.dart';
import 'package:vendor_shopkeeper/screens/order_details.dart';
import 'package:vendor_shopkeeper/screens/payment_successful.dart';
import 'package:vendor_shopkeeper/screens/products.dart';
import 'package:vendor_shopkeeper/screens/reviews.dart';
import 'package:vendor_shopkeeper/screens/wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage1(),
      // home: Products(),
    );
  }
}
