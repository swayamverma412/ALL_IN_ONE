// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Model/profile/ProfileModel.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/location.dart';

import '../Controller/Prfile.dart';
import '../Repo/Product_repo.dart';
import '../base/SnakeBAr.dart';
import 'add_new_address.dart';

class SavedAddress extends StatefulWidget {
  SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  ProfileModel? model;
  bool load = false;

  List<String> location = [
    "Home",
    "OFFICE",
    "OTHER",
  ];

  List<String> address = [
    "234 Purbanchal School Road 1st floor",
    "607 Uttar Purba Fartabad sahapara ",
    "B/H/4 Rifle range road Park circus ",
  ];

  Widget coupons(
      {String heading = "",
      String detail = "",
      required String id,
      required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    heading,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  load
                      ? SizedBox()
                      : PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              onTap: () {
                                setState(() {
                                  load = true;
                                });
                                deleteAddress(id);
                              },
                              // row with 2 children
                              child: Row(
                                children: [
                                  Icon(Icons.delete_forever),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Delete")
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 12,
                  color: HexColor("000000").withOpacity(0.69),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    model = context.watch<profileControler>().profile;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
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
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Saved Address",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    itemCount: model!.data!.address!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: coupons(
                          onTap: () {},
                          heading: model!.data!.address![index].addressType
                              .toString(),
                          detail:
                              model!.data!.address![index].location.toString(),
                          id: model!.data!.address![index].id.toString(),
                        ),
                      );
                    },
                  ),
                ),
                /* Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [


                    ],
                  ),
                ),*/
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: Location(),
                        withNavBar: false,
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "+ Add New",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteAddress(String id) async {
    String userid=await  SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    final param = {
      "addressId": id.toString(),
    };
    ProductRepo().DeleteAddress(param,userid).then((value) {
      var data1 = jsonDecode(value.body);
      print("value-------------" + data1.toString());
      if (value.statusCode == 200) {
        load = false;
        Navigator.of(context).pop();
      } else {
        load = false;
        print("Error");
        toastShow(data1["message"].toString(), Colors.red);
      }
      setState(() {});
    });
  }
}
