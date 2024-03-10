// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/send_to_bank.dart';
import 'package:vendor_shopkeeper/screens/send_to_friend.dart';

import 'add_money.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
//Controls string below send to back
  String filterText = "Recent";

  int modelBottomSheetSelectedButton = 1;

  List<String> orderNo = ["1234"];
  List<String> date = ["24 August"];
  List<String> time = ["11:00am"];
  List<String> price = ["200"];
  List<String> earningStatus = ["Sent To Bank"];
  List<String> amountPaid = ["20"];
  List<String> typeOfPayment = ["COD"];

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
        body: Container(
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
                          "Wallet",
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
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Available Balance",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Text(
                          "Rs 500",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                pushNewScreen(context,
                                    screen: AddMoney(), withNavBar: false);
                              },
                              child: SizedBox(
                                height: 40,
                                width: 150,
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
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: 40,
                                width: 150,
                                child: InkWell(
                                  onTap: () {
                                    pushNewScreen(context,
                                        screen: SendFriends(),
                                        withNavBar: false);
                                  },
                                  child: Card(
                                    color: Colors.red,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Send to Friends",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            width: 150,
                            child: InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SendBank(),
                                  withNavBar: false,
                                );
                              },
                              child: Card(
                                color: Colors.red,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sent to Bank",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w(0.07), vertical: h(0.07)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          filterText,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.69),
                            fontSize: 20,
                          ),
                        ),
                        // ImageIcon(onPressed: () {}, icon: Icon(Icons.filter))
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (
                                BuildContext context,
                              ) {
                                return StatefulBuilder(builder:
                                    (BuildContext context, StateSetter set) {
                                  return SizedBox(
                                    height: h(0.3),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: modelBottomSheetSelectedButton ==
                                                        1
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color: Colors.red)
                                                    : Icon(
                                                        Icons.circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Recent";
                                                    modelBottomSheetSelectedButton =
                                                        1;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Recent")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: modelBottomSheetSelectedButton ==
                                                        2
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color: Colors.red)
                                                    : Icon(
                                                        Icons.circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Past Week";
                                                    modelBottomSheetSelectedButton =
                                                        2;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Past Week")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: modelBottomSheetSelectedButton ==
                                                        3
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color: Colors.red)
                                                    : Icon(
                                                        Icons.circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Past Month";
                                                    modelBottomSheetSelectedButton =
                                                        3;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Past Month")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon:
                                                    modelBottomSheetSelectedButton ==
                                                            4
                                                        ? Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: Colors.red,
                                                          )
                                                        : Icon(Icons
                                                            .circle_outlined),
                                                onPressed: () {
                                                  set(() {
                                                    filterText = "Past Year";
                                                    modelBottomSheetSelectedButton =
                                                        4;
                                                  });
                                                  setState(() {});
                                                },
                                              ),
                                              Text("Past Year")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/mi_filter.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 56.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orderNo.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order No ${orderNo[index]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        '${date[index]}, ${time[index]}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rs ${amountPaid[index]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        typeOfPayment[index],
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Rs ${price[index]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: earningStatus[index] == "Earning"
                                            ? Colors.red
                                            : HexColor("#9A0909"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        earningStatus[index],
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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
