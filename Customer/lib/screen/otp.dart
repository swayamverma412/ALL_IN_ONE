import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vendor_app/Repo/authRepo.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/base/SnakeBAr.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/auth.dart';
import 'package:http/http.dart';
import 'package:vendor_app/screen/location.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatefulWidget {
  // Otp({Key? key}) : super(key: key);
  String number;String refer;
  Otp({required this.number,required this.refer});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otp = TextEditingController();
bool Done=false;
Timer? timer;
bool resend =false;
int time=0;
bool click=false;

@override
  void initState() {
  timer=Timer.periodic(Duration(seconds: 1), (Timer t) {
    setState((){
      time=t.tick.toInt();
    });
    if(t.tick.toInt()==20){
      setState((){
        timer!.cancel();
        resend=true;
        time=20;
      });
    }
  });
        super.initState();
  }
  @override
  void dispose() {
  timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
       /* bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              *//*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Auth()));*//*
            },
            child: const SizedBox(
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
        ),*/
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBe,
              children: <Widget>[
                const SizedBox(
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
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                      const Text(
                        "Verify your contact number",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Enter the verification Code , We've sent on the ${widget.number}",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Done?Center(child: CircularProgressIndicator(color: Colors.redAccent),):OtpTextField(
                    numberOfFields: 6,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                 //   autoFocus: true,
                    onSubmit: (String verificationCode){
                      if(verificationCode.length==6){
                        setState(() {
                          Done=true;
                        });
                        verify_otp(verificationCode.toString());
                      }
                    }, // end onSubmit
                  ),
                ),
              /*  const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Resend",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),*/
                 Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20),
                  child: Text(
                    "Valid till 20 sec user timer ${time.toString()} sec",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
          SizedBox(height: 10,),
          Visibility(
            visible: resend,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: (){
                    setState((){
                      click=true;
                    });
                    sendOtp();
                  }, child: Center(
                child:click?CircularProgressIndicator(color: Colors.white,): Text(
                  'Resend',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),)
              ),
            ),
          ),
              ]),
        ),
      ),
    );
  }
  void verify_otp(String otp) {
    final par={
      "number":widget.number.toString(),
      "otp":otp.toString(),
    };
    authRepo().verifyOtp(par).then((value)async{
      print(value.toString());
      if(value.statusCode==200){
        var data=jsonDecode(value.body);
        print(data.toString());
        await SharedPreferenceClass.SetSharedData(AppContent.TOKEN, data["token"].toString());
        await SharedPreferenceClass.SetSharedData(AppContent.LOGSTATUS, "true");
        await SharedPreferenceClass.SetSharedData(AppContent.CUSTOMERID, data["customerId"]);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => Location()),(route) => false,);
        showCustomSnackBar(message: data["message"].toString(), context: context,isError: false);

      }else if(value.statusCode==401){
        var data=jsonDecode(value.body);
        if(data["message"] == "Not Registered, Signup Now!"){
          setState(() {
            Done=false;
          });
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Auth(widget.number,widget.refer)));
          showCustomSnackBar(message: data["message"].toString(), context: context,isError: true);
        }
      }else{
        setState(() {
          Done=false;
        });
        print(value.statusCode);
        showCustomSnackBar(message: value.body.toString(), context: context,isError: true);

      }
    });

  }

  Future<void> sendOtp()async {
    final para={
      "number":widget.number.toString(),
    };
    authRepo().SendOtp(para).then((value){
      var data=jsonDecode(value.body);
      print(data.toString());
      try{
        if(value.statusCode==200){
          setState(() {
            click=false;
            resend=false;
          });
          showCustomSnackBar(message: data["message"],context: context,isError: false);

        }else{
          setState(() {
            click=false;
            resend=false;
          });
          showCustomSnackBar(message: data["message"],context: context,isError: false);
        }
      }catch(e){
        setState(() {
          click=false;
        });
        showCustomSnackBar(message: data["message"].toString()+e.toString(),context: context,isError: true);
      }
    });
  }
}
