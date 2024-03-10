import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/login1.dart';
import 'package:vendor_app/screen/location.dart';

import '../Controller/orderController.dart';
import '../Persistent Nav Bar/persistentNavBar.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? status;

  @override
  void initState() {
    getShared();
    super.initState();
  }

  getShared() async {
    status = await SharedPreferenceClass.GetSharedData(AppContent.LOGSTATUS);
    Timer(Duration(seconds: 2), () async {
      if (status.toString() == "true") {
        print("Login");
        await SharedPreferenceClass.SetSharedData(AppContent.LAT, "26.92207");
        await SharedPreferenceClass.SetSharedData(AppContent.LNG, "75.778885");
        // await SharedPreferenceClass.SetSharedData(
        //     AppContent.CUSTOMERID, "63a6d6e1e16607bda59d1d97");
        // await SharedPreferenceClass.SetSharedData(AppContent.TOKEN,
        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2E2ZDZlMWUxNjYwN2JkYTU5ZDFkOTciLCJudW1iZXIiOjkzNTI4MTY1OTgsImlhdCI6MTY3Mjg0NDQwMSwiZXhwIjoxNjczNzA4NDAxfQ.r-t53d7r1-bmsb1TtVZVUQ4nk9qWjma8XkCcGNr1yTI");
        String id =
            await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
        String address =
            await SharedPreferenceClass.GetSharedData(AppContent.SELECTADDRESS);
        Provider.of<ordercontroller>(context, listen: false)
            .Updateaddres(id, address);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => PersistentNavBar()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage1()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
