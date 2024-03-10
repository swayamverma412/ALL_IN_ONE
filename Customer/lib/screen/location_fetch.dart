// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vendor_app/screen/auth.dart';
import 'package:vendor_app/screen/homePage.dart';
import 'package:vendor_app/screen/location.dart';

import '../Persistent Nav Bar/persistentNavBar.dart';

class Location_fetch extends StatefulWidget {
  const Location_fetch({Key? key}) : super(key: key);

  @override
  State<Location_fetch> createState() => _Location_fetchState();
}

class _Location_fetchState extends State<Location_fetch> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    //
    //Returns a double, height of the screen multipled by the height given
    //The height given should range between 0-1 (0 -> No height , 1 -> Full screen height)
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    //Returns a double, width of the screen multipled by the width given
    //The width given should range between 0-1 (0 -> No width , 1 -> Full screen width)
    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    TextEditingController searchController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    LatLng source = LatLng(20.5937, 78.9629);

    //Index indicating what is selected as address in Home, office or other

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            bottomNavigationBar: Material(
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersistentNavBar()));
                },
                child: SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Continue',
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
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[4],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                           Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Set your delivery location",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: w(0.06), vertical: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: searchController,
                        //controller: passwordController,
                        style: TextStyle(fontSize: 16.0),

                        decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: BorderSide(
                          //     color: HexColor("D9D9D9"),
                          //   ),
                          // ),
                          border: InputBorder.none,
                          hintText: "Search Location",
                          fillColor: HexColor("D9D9D9"),
                          filled: true,
                          prefixIcon: IconButton(
                              icon: Icon(Icons.search), onPressed: () {}),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: h(0.38),
                    child: GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: source, zoom: 14.5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w(0.05), right: w(0.05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.location_on_outlined,
                              color: HexColor("FD2E2E"),
                            ),
                            Text(
                              "2/3, SIMS lane, near Sanjitha Maternity",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          "FLAT NO, LANDMARK, APARTMENT, ETC",
                          style: TextStyle(
                            color: HexColor("8A8989"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: w(1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: TextFormField(
                              controller: addressController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15),
                                hintText: "Sayan Apartment 3rd floor flat- 302",
                                fillColor: HexColor("D9D9D9"),
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "SAVE ADDRESS AS",
                            style: TextStyle(
                              color: HexColor("8A8989"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.0, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  selected = 0;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: selected == 0
                                        ? Colors.red
                                        : HexColor("F0F1F3"),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.home_outlined,
                                          color: selected == 0
                                              ? Colors.white
                                              : Colors.black),
                                      Text("Home",
                                          style: TextStyle(
                                              color: selected == 0
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selected = 1;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: selected == 1
                                        ? Colors.red
                                        : HexColor("F0F1F3"),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.apartment_outlined,
                                          color: selected == 1
                                              ? Colors.white
                                              : Colors.black),
                                      Text("Office",
                                          style: TextStyle(
                                              color: selected == 1
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  selected = 2;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: selected == 2
                                        ? Colors.red
                                        : HexColor("F0F1F3"),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          color: selected == 2
                                              ? Colors.white
                                              : Colors.black),
                                      Text(
                                        "Other",
                                        style: TextStyle(
                                            color: selected == 2
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                        // Row(
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         index = 0;
                        //         setState(() {});
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: index == 0
                        //               ? Colors.white
                        //               : HexColor("FD2E2E"),
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         child: Text(
                        //           "Home",
                        //           style: TextStyle(
                        //               color: index == 0
                        //                   ? Colors.white
                        //                   : Colors.black),
                        //         ),
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         setState(() {
                        //           index = 1;
                        //         });
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: index == 1
                        //               ? Colors.white
                        //               : HexColor("FD2E2E"),
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         child: Text(
                        //           "Home",
                        //           style: TextStyle(
                        //               color: index == 1
                        //                   ? Colors.white
                        //                   : Colors.black),
                        //         ),
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         index = 2;
                        //         setState(() {});
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: index == 2
                        //               ? Colors.white
                        //               : HexColor("FD2E2E"),
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         child: Text(
                        //           "Home",
                        //           style: TextStyle(
                        //               color: index == 2
                        //                   ? Colors.white
                        //                   : Colors.black),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
