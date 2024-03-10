// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/screens/payment_successful.dart';
import '../base/SnakeBAr.dart';
import '../repository/Wallet.dart';

class SendBank extends StatefulWidget {
  int balance;
  String id;

  SendBank(this.balance,this.id);

  @override
  State<SendBank> createState() => _SendBankState();
}

class _SendBankState extends State<SendBank> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool click=false;
  TextEditingController amount=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController accoutnuber=TextEditingController();
  TextEditingController ifsc=TextEditingController();
  TextEditingController bank=TextEditingController();
  TextEditingController phonenumber=TextEditingController();


  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  Future<void> payout() async {
    final paramDic={
      "name":name.text,
      "accountNumber":accoutnuber.text,
      "ifsc":ifsc.text,
      "bank":bank.text,
      "number":phonenumber.text,
    };
    WalletRepo().payoutRequest(widget.id.toString(),amount.text,paramDic).then((value){
      print("value"+value.body.toString());
      var data=jsonDecode(value.body);
      if(value.statusCode==201){
        try{
          click=false;
          pushNewScreen(
            context,
            screen: PaymentSuccessful(
              text: "REQUEST SENT",
              altText:
              "You will be notified once your \nrequest is completed ",
            ),
          );
          setState((){});
        }catch(e){
          print("Error1"+e.toString());
          click=false;
          toastShow(e.toString(),Colors.red);
        }
      }else{
        click=false;
        print("Error");
        toastShow(data["message"].toString(),Colors.red);
      }
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
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
                          "Send to Bank",
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
              Container(
                // height: h(0.8),
                width: w(1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/user_profile.png"),
                        color: Colors.red,
                        size: h(0.1),
                      ),
                      Text(
                        "Your balance Rs.${widget.balance.toString()}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 10,),
                            const Text(
                              "Name:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:name,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your name' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter you name",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            SizedBox(height: 10,),
                            const Text(
                              "Account number:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:accoutnuber,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your account number';
                                }if(value.length<9){
                                  return 'Enter your account number';
                                }else{
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter account number",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            SizedBox(height: 10,),
                            const Text(
                              "ifsc:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:ifsc,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter ifsc' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter bank ifsc",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            SizedBox(height: 10,),
                            const Text(
                              "Bank Name:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:bank,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter Bank name' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter Bank name",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            SizedBox(height: 10,),
                            const Text(
                              "Phone number:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:phonenumber,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your phone number' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.number,
                              inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter Mobile number",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            SizedBox(height: 10,),
                            const Text(
                              "Amount:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:amount,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter amount' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter amount",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if(widget.balance>int.parse(amount.text)){
                            if(_formKey.currentState!.validate()) {
                              setState(() {
                                click = true;
                              });
                              payout();
                            }
                          }else{
                            toastShow("Your amount is greater than balance", Colors.redAccent);
                          }
                        },
                        child: SizedBox(
                          height: 60,
                          width: 170,
                          child: Card(
                            color: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:click?CircularProgressIndicator(color: Colors.white,): Text(
                                "Send Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
