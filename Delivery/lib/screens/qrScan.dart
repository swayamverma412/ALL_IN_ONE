// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

class QrScan extends StatefulWidget {
  QrScan({Key? key}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    Widget scan() {
      return Container(
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                  height: 300,
                  width: w(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("Camera here"))),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                height: 40,
                width: 150,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.red,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Scan",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget myCode() {
      return Container(
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 300,
                width: w(1),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20),
                      child: Text(
                        "Swayam Verma",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Center(
                        child: Text("Qr code here"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                height: 40,
                width: 150,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.red,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.share, color: Colors.white),
                        Text(
                          "Share My Code",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.black,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.download, color: Colors.black),
                      Text(
                        "Save to gallery",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: DefaultTabController(
            length: 2,
            child: Column(
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
                            "Qr Scan",
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
                  padding: const EdgeInsets.all(8.0),
                  width: w(0.8),
                  height: h(0.8),
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 20,
                        )),
                    tabs: [
                      Text('Scan'),
                      Text('My Code'),
                    ],
                    views: [
                      scan(),
                      myCode(),
                    ],
                    // onChange: (index) => print(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
