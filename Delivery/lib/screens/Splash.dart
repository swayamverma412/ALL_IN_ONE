import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/Controller/Profileand_product.dart';

import '../base/Perferance.dart';
import '../data/AppContent.dart';
import 'home.dart';
import 'login1.dart';
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
status= await SharedPreferenceClass.GetSharedData(AppContent.LOGSTATUS);
print(status.toString());
 // await SharedPreferenceClass.SetSharedData(AppContent.CUSTOMERID,"6366847aa3845e32ee45550f");
 // await SharedPreferenceClass.SetSharedData(AppContent.TOKEN,"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzY2ODQ3YWEzODQ1ZTMyZWU0NTU1MGYiLCJudW1iZXIiOjkzNTIxMTcxNjgsImlhdCI6MTY3MjI0NDA0MCwiZXhwIjoxNjczMTA4MDQwfQ.3TEBoXjV-EJO9TwL3PC6ACMMXVdz_Rjc0bK8LWZ1VHA");
Timer(Duration(seconds: 2), (){
if(status.toString()=="true"){
  print("Login");
  Provider.of<Profilecontroller>(context,listen: false).getdata();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Home()),
        (Route<dynamic> route) => false,
  );
}else{
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
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
