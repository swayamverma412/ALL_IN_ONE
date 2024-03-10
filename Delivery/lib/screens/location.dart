// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home.dart';

class Location extends StatefulWidget {
  Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
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

    LatLng source = LatLng(20.5937, 78.9629);

    //Index indicating what is selected as address in Home, office or other
    int index = 0;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
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
                    "Set your store location",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.06), vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  controller: searchController,
                  //controller: passwordController,
                  style: TextStyle(fontSize: 16.0),

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Location",
                    fillColor: HexColor("D9D9D9"),
                    filled: true,
                    prefixIcon:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  ),
                ),
              ),
            ),
            Container(
              height: h(0.53),
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
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
