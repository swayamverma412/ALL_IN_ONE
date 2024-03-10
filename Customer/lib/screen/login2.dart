import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_app/screen/otp.dart';
import 'package:http/http.dart';

import '../Repo/authRepo.dart';
import '../base/SnakeBAr.dart';

class LoginPage2 extends StatefulWidget {
  LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  TextEditingController referralCode = TextEditingController();

  TextEditingController numberController = TextEditingController();

  bool click=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Log in with one of the following options",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                            ),
                            Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 50,
                            ),
                            Image.asset("assets/google.png"),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // TODO: mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Phone No.:",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          TextFormField(
                            controller: numberController,
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            keyboardType:TextInputType.number,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Enter your phone number";
                              }else if(value.length<10){
                                return 'Enter Correct number';
                              }else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter your phone number",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                          SizedBox(
                            width: 20.0,
                            height: 20.0,
                          ),
                          Text(
                            "Referral Code:",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          TextFormField(
                            validator: (value) => value!.isEmpty
                                ? 'Enter your referral code'
                                : null,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter your referral code",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: MaterialButton(
                        //minWidth: double.infinity,
                        height: 60,
                        minWidth: 150,
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            setState((){
                              click=true;
                            });
                            sendOtp();
                          }
                        },
                        color: Colors.red,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:click?Center(child: CircularProgressIndicator(),): Text(
                          "Continue",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child:Text("Back to Login?")),

                  Container(
                    // padding: EdgeInsets.only(top: 50),
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/loginIn.png"),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendOtp()async {
    final para={
      "number":numberController.text.toString(),
    };
    authRepo().SendOtp(para).then((value){
      var data=jsonDecode(value.body);
      print(data.toString());
      try{
        if(value.statusCode==200){
          setState(() {
            click=false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Otp(
                      number:
                      numberController.text.toString(),refer:referralCode.text,)));
          showCustomSnackBar(message: data["message"],context: context,isError: false);

        }else{
          setState(() {
            click=false;
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
