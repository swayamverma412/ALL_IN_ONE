import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import 'package:http/http.dart' as https;

import '../repository/authRepo.dart';
import 'login2.dart';
import 'otp.dart';

class LoginPage1 extends StatefulWidget {
  LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  TextEditingController numberController = TextEditingController();
  bool click=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 80,
                          ),
                          const Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
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
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Phone No. :",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
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
                          const SizedBox(
                            width: 20.0,
                            height: 20.0,
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 90,
                                ),
                                //Text("Have a ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                RichText(
                                  text: TextSpan(
                                    text: 'Have a ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Refferal',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage2())),
                                      ),
                                      const TextSpan(
                                        text: ' Code ? ',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child:  click==true?Center(child: CircularProgressIndicator(color: Colors.redAccent,),):Container(
                        child: MaterialButton(
                          //minWidth: double.infinity,
                          height: 60,
                          minWidth: 150,
                          onPressed: () async {
                            /* final paramDic={
                              'number': "9352816598",
                              'password': "tooStrong",
                            };
                            verify(paramDic);*/
                           /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Otp(
                                        number:
                                        numberController.text.toString(),refer: "no",)));*/
                            if(_formKey.currentState!.validate()){
                              setState(() {
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
                          child: const Text(
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
                    Container(
                      // padding: EdgeInsets.only(top: 50),
                      height: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/loginIn.png"),
                          )),
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
                    numberController.text.toString(),refer: "no",)));
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
