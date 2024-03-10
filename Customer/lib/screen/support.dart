// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Repo/WalletRepo.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import 'myAccount.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController  message=TextEditingController();
  bool load2=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              if(message.text.isNotEmpty) {
                setState(() {
                  load2 = true;
                });
                submit();
              }
              print("tab");
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child:load2?CircularProgressIndicator(color: Colors.white,): Text(
                  'Submit',
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
                      "Support",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Center(
                  child: Container(
                    height: 176,
                    width: 176,
                    decoration: BoxDecoration(
                      color: HexColor("D9D9D9"),
                    ),
                    child: Center(
                      child: Text(
                        "LOGO",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Call on our customer support number or \nWrite us your query ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 250,
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.call, color: Colors.red),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "  Contact Number",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "  +91 123456890",
                                      style: TextStyle(
                                        color:
                                        Color.fromARGB(255, 102, 102, 102),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.message,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "  Your Message",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 40, top: 8),
                                  child: SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: message,
                                      style: TextStyle(fontSize: 16.0),
                                      decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        border: InputBorder.none,
                                        hintText: "  Enter your message here ",
                                        fillColor: HexColor("D9D9D9")
                                            .withOpacity(0.46),
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/whastapp.png"),
                          Text("  CONTACT US USING WHATSAPP"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> submit()async {
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    final paramDic={
      "message":message.text,
    };
    WalletRepo().Support(id, paramDic).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data1.toString()+"   "+value.statusCode.toString());
      if(value.statusCode==201){
        Navigator.of(context).pop();
        load2=false;
        toastShow("ticket send to admin",Colors.red);
      }else{
        load2=false;
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {});
    });

  }

}
