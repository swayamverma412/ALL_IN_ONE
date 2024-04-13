import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import 'package:vendor_shopkeeper/persistentNavBar.dart';
import 'package:vendor_shopkeeper/screens/login1.dart';
import 'package:vendor_shopkeeper/util/Perferance.dart';
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
 // await SharedPreferenceClass.SetSharedData(AppContent.CUSTOMERID,"6366847aa3845e32ee45550f");
 // await SharedPreferenceClass.SetSharedData(AppContent.TOKEN,"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzY2ODQ3YWEzODQ1ZTMyZWU0NTU1MGYiLCJudW1iZXIiOjkzNTIxMTcxNjgsImlhdCI6MTY3MzQ1MDk5NiwiZXhwIjoxNjc0MzE0OTk2fQ.jTesdpqoqxT_zqIgNn_kYmkg1HM3reMtAyy7BDmC8S4");
Timer(Duration(seconds: 2), (){
if(status.toString()=="true"){
  print("Login");

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => PersistentNavBar()),
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
