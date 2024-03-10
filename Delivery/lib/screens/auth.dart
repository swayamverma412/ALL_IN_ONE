// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_delivery/screens/location.dart';

import '../base/CommonMethod.dart';
import '../base/SnakeBAr.dart';
import '../data/apiClient.dart';
import '../repository/authRepo.dart';
import 'home.dart';
import 'login1.dart';

class Auth extends StatefulWidget {
 String number,reffered;


 Auth({required this.number, required this.reffered});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController _name=TextEditingController();
  TextEditingController _number=TextEditingController();
  TextEditingController _age=TextEditingController();
  TextEditingController _pincode=TextEditingController();
  TextEditingController _vehileno=TextEditingController();
  TextEditingController _Licenecno=TextEditingController();
  TextEditingController _address=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? Aadharfront,back,image;
  bool click=false;
@override
  void initState() {
    setState(() {
      _number.text=widget.number;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              if(_formKey.currentState!.validate() && Aadharfront!=null && back !=null && image !=null){
                setState(() {
                  click=true;
                });
                signup();
              }
             /* Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));*/
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child:click?CircularProgressIndicator(color: Colors.white,): Text(
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
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBe,
                children: <Widget>[
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
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Validiation Form",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _name,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your name' : null,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your name",
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Number:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _number,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your number' : null,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your number",
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.0),
                              ) ,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Age:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _age,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your age' : null,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your age",
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Pincode:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _pincode,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your pincode' : null,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your pincode",
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Vehicle No.:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _vehileno,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your Vehicle Number' : null,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your Vehicle Number",
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "License No.:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _Licenecno,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your License Number' : null,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your License Number",
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "City/State:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller:_address,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your city/state' : null,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter your city/state",
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Documents:",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Aadhar Card",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Front",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:Aadharfront!=null?Image.file(File(Aadharfront!.path)): IconButton(
                                onPressed: () async {
                                  Aadharfront=await pickImage();
                                  setState(() {
                                  });
                                },
                                icon: Icon(Icons.add, size: 35),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:back!=null?Image.file(File(back!.path)): IconButton(
                                onPressed: () async {
                                  back=await pickImage();
                                  setState(() {
                                  });
                                },
                                icon: Icon(Icons.add, size: 35),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Your image",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:image!=null?Image.file(File(image!.path)):  IconButton(
                                onPressed: () async {
                                  image=await pickImage();
                                  setState(() {
                                  });
                                },
                                icon: Icon(Icons.add, size: 35),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
  Future<void> signup()async {
    final param={
      "name":_name.text,
      "number":_number.text,
      "age":_age.text,
      "pincode":_pincode.text,
      "cityState":_address.text,
      "vehicalNumber":_vehileno.text,
      "licence":_Licenecno.text,
      "password":"12345678",
    };
    if(widget.reffered.isNotEmpty){
      param["referredBy"]=widget.reffered.toString();
    }
    List<MultipartBody> listimage=[
      MultipartBody("aadharFront", Aadharfront!),
      MultipartBody("aadharBack", back!),
      MultipartBody("image", image!),
    ];
    authRepo().registration(param,listimage).then((value){
      try{
        var data=jsonDecode(value.body);
        if(value.statusCode==201) {
          var data = jsonDecode(value.body);
          print(value.toString());
          Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => LoginPage1()),(route) => false,);
          showCustomSnackBar(message: data["message"],context: context,isError: false);
        }else{
          setState(() {
            click=false;
          });
          showCustomSnackBar(message: data["message"],context: context,isError: true);
        }
      }catch(e){
        print(e.toString());
        setState(() {
          click=false;
        });
        showCustomSnackBar(message: value.body.toString()+e.toString(),context: context,isError: false);
      }
    });

  }
}
