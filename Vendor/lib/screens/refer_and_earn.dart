// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/my_team.dart';

class ReferAndEarn extends StatefulWidget {
  ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

int index = 0;

class _ReferAndEarnState extends State<ReferAndEarn> {
  Widget customer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget referAndEarn() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Refer a friend and get \nupto Rs. 200 Cashback \nOff on your next order!",
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              "Send invite with referral code to",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black.withOpacity(0.55),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor("D9D9D9").withOpacity(0.67),
              ),
              child: Center(
                child: Text(
                  "CHED9WDJ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/whastapp.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/facebook.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/instagram.png"),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: 120,
            child: InkWell(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: MyTeam(),
                  withNavBar: false,
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Team",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.red,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/group_discussion.png",
          ),
        ],
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
                            "Refer and Earn",
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
                DefaultTabController(
                  length: 3,
                  child: SizedBox(
                    width: w(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: w(1),
                          height: h(0.8),
                          child: ContainedTabBarView(
                            tabBarProperties: TabBarProperties(
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.red,
                              padding: EdgeInsets.only(top: 16),
                              unselectedLabelColor: HexColor("D3D0D0"),
                              labelStyle: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            callOnChangeWhileIndexIsChanging: true,
                            onChange: (ind) {
                              setState(() {
                                index = ind;
                              });
                            },
                            tabs: [
                              Column(
                                children: [
                                  index != 0
                                      ? Icon(
                                          Icons.circle_outlined,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle,
                                          size: 20,
                                        ),
                                  Text("Customer",
                                      style: TextStyle(
                                          color: index != 0
                                              ? HexColor("D3D0D0")
                                              : Colors.red))
                                ],
                              ),
                              Column(
                                children: [
                                  index != 1
                                      ? Icon(
                                          Icons.circle_outlined,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle,
                                          size: 20,
                                        ),
                                  Text("Vendor",
                                      style: TextStyle(
                                          color: index != 1
                                              ? HexColor("D3D0D0")
                                              : Colors.red))
                                ],
                              ),
                              Column(
                                children: [
                                  index != 2
                                      ? Icon(
                                          Icons.circle_outlined,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle,
                                          size: 20,
                                        ),
                                  Text("Rider",
                                      style: TextStyle(
                                          color: index != 2
                                              ? HexColor("D3D0D0")
                                              : Colors.red))
                                ],
                              ),
                            ],
                            views: [
                              referAndEarn(),
                              referAndEarn(),
                              referAndEarn(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
