// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/orderController.dart';
import 'package:vendor_app/screen/orderPlaced.dart';

import '../Repo/Product_repo.dart';
import '../Repo/WalletRepo.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import 'package:http/http.dart' as http;

class SelectPayment extends StatefulWidget {
  SelectPayment({
    Key? key,
    this.onWalletTap,
    this.onDebitCardTap,
    this.onCreditCardTap,
    this.onCashOnDeliveryTap,
    this.onRazorPayTap,
    this.onStripeTap,
    required this.id,
    this.address,
    required this.amount,
  }) : super(key: key);

//You can assign individual buttons a function on the Select Payment page
  Function()? onWalletTap;
  Function()? onDebitCardTap;
  Function()? onCreditCardTap;
  Function()? onCashOnDeliveryTap;
  Function()? onRazorPayTap;
  Function()? onStripeTap;
  String id;
  String? address;
  String amount = "";

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  String? id;
  List datalist = [];
  Map<String, dynamic>? paymentIntentData;
  String money = 10.toString();

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
  void initState() {
    getshared();
    setState(() {
      money = widget.amount.toString();
    });
    // TODO: implement initState
    super.initState();
  }

  getshared() async {
    id = await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    getdata();
  }

  Future<void> getdata() async {
    WalletRepo().fetchwallet(id!).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          datalist.add(data);
        } catch (e) {
          toastShow(e.toString(), Colors.red);
        }
      } else {
        toastShow(data["message"].toString(), Colors.red);
      }
      setState(() {});
    });
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
                      "Amount to pay Rs ${widget.amount.toString()}",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.68),
                      ),
                    ),
                    paymetType(
                        image: "wallet.png",
                        name: "Wallet",
                        onTap: () {
                          if (datalist[0]["data"]["balance"] > 0) {
                            orderplace(
                                widget.address.toString(), widget.id, "true");
                          }
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text("CARDS"),
                    ),
                    paymetType(
                        image: "debitCard.png",
                        name: "Debit Card",
                        onTap: () async {
                          await makePayment();
                        }),
                    paymetType(
                        image: "debitCard.png",
                        name: "Credit Card",
                        onTap: () async {
                          await makePayment();
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text("CASH"),
                    ),
                    paymetType(
                        image: "cod.png",
                        name: "Cash on Delivery",
                        onTap: () {
                          orderplace(
                              widget.address.toString(), widget.id, "false");
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text("OTHERS"),
                    ),
                    paymetType(
                        image: "razorPay.png",
                        name: "RazorPay",
                        onTap: widget.onRazorPayTap),
                    paymetType(
                        image: "stripe.png",
                        name: "Stripe",
                        onTap: widget.onStripeTap),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> orderplace(String body, id, String paymentStatus) async {
    final ProductRepo repo = ProductRepo();
    repo.Orderplace(body, id, paymentStatus).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderPlaced()));
        toastShow(data["message"].toString(), Colors.green);
      } else {
        toastShow(data["message"].toString(), Colors.red);
      }
    });
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent(money, 'INR'); //json.decode(response.body);
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  style: ThemeMode.light,
                  merchantDisplayName: 'name'))
          .then((value) {});
      displayPaymentSheet();
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              // parameters: PresentPaymentSheetParameters(
              //   clientSecret: paymentIntentData!['client_secret'],
              //   confirmPayment: true,
              // )
              )
          .then((Value) {
        // payFee();
        orderplace(widget.address.toString(), widget.id, "true");
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
        }
      });
    } on StripeException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${AppContent.Secreate}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print(response.body);
      return jsonDecode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print('err charging user: ${err.toString()}');
      }
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
