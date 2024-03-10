// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:hexcolor/hexcolor.dart';

class Insights extends StatefulWidget {
  Insights({Key? key}) : super(key: key);

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  List name = ["Fresh Potato", "Fresh Potato", "Fresh Potato"];
  List image = ["potato.png", "potato.png", "potato.png"];
  List sale = ["125", "125", "125"];

  String selectedFromDropDown = "Today";

  String filterText = "Recent";

  int modelBottomSheetSelectedButton = 1;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
                //
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
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Insights",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 5),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (
                                BuildContext context,
                                ) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter set) {
                                return SizedBox(
                                  height: h * 0.3,
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
                                                  : Icon(Icons.circle_outlined),
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
                                                  : Icon(Icons.circle_outlined),
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
                                                  : Icon(Icons.circle_outlined),
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
                            color: Color.fromARGB(255, 252, 88, 88),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "64",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Orders",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "164km",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Distance",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "Rs.5000",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Earning",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Earnings",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        height: 200,
                        width: w,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text("Graph here"),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Orders",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                          height: 200,
                          width: w,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Center(
                            child: Text("Graph here"),
                          )),
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