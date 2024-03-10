// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MyTeam extends StatefulWidget {
  MyTeam({Key? key}) : super(key: key);

  @override
  State<MyTeam> createState() => _MyTeamState();
}

int index = 0;

class _MyTeamState extends State<MyTeam> {
  Widget customer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
    );
  }

  List<String> freindsImage = ["assets/friend_profile.png"];
  List<String> name = ["Swati Verma"];

  Widget myTeam() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 30),
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(freindsImage[index]),
            title: Text(name[index],
                style: TextStyle(fontWeight: FontWeight.bold)),
          );
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
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
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
                            "My Team",
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
                                fontSize: 20,
                              ),
                            ),
                            callOnChangeWhileIndexIsChanging: true,
                            onChange: (ind) {
                              setState(() {
                                index = ind;
                              });
                            },
                            tabs: [
                              Text(
                                "Customer",
                                style: TextStyle(
                                    color: index != 0
                                        ? HexColor("D3D0D0")
                                        : Colors.red),
                              ),
                              Text(
                                "Vendor",
                                style: TextStyle(
                                    color: index != 1
                                        ? HexColor("D3D0D0")
                                        : Colors.red),
                              ),
                              Text(
                                "Rider",
                                style: TextStyle(
                                    color: index != 2
                                        ? HexColor("D3D0D0")
                                        : Colors.red),
                              ),
                            ],
                            views: [
                              myTeam(),
                              myTeam(),
                              myTeam(),
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
