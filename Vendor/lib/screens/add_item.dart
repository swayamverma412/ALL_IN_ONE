// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/choose_image.dart';

class AddItem extends StatefulWidget {
  AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  bool showChooseImage = false;

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
            onTap: () {},
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Save Changes',
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
                          "Add Item",
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Text(
                        "Name:",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter the name of the item",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 35.0),
                              child: Text(
                                "Price:",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter price",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 35.0),
                              child: Text(
                                "Amount:",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Amount of item",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          showChooseImage = !showChooseImage;
                          setState(() {});
                          print(showChooseImage);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add_circle_outlined, color: Colors.red),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Add image",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (showChooseImage)
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: ChooseImage(),
                                withNavBar: false,
                              );
                            },
                            child: Center(
                              child: Text(
                                "Choose Image",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
