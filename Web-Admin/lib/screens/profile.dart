// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_shopkeeper/base/Perferance.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';

import '../base/CommonMethod.dart';
import '../base/SnakeBAr.dart';
import '../data/apiClient.dart';
import '../model/profile_model.dart';
import '../repository/authRepo.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final TextEditingController _FirstController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _addressshopController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _agedontroller = TextEditingController();
  final TextEditingController _pindontroller = TextEditingController();
  final TextEditingController _citydontroller = TextEditingController();
  final TextEditingController _typeofstoreontroller = TextEditingController();
  final TextEditingController _gstNOontroller = TextEditingController();
  final TextEditingController _shoage = TextEditingController();
  final TextEditingController _Timming = TextEditingController();
  final TextEditingController _delvery = TextEditingController();
  final TextEditingController _insta = TextEditingController();
  final TextEditingController _facbook = TextEditingController();




  bool click=false;
  bool load2=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool load=true;
  bool err=false;
  String? id;
  ProfileModel? data;
  XFile? image;

  Future<void> getdata()async {
     id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    authRepo().getprofilr(id!).then((value){
      var data1=jsonDecode(value.body);
     // print("value-------------"+data.toString());
      if(value.statusCode==200){
        try{
          data=ProfileModel.fromJson(data1);
          load=false;
          err=false;
          //print(get_category!.toJson().toString());
        }catch(e){
          print("Error1"+e.toString());
          err=true;
          load=false;
          toastShow(e.toString(),Colors.red);
        }
      }else{
        err=true;
        load=false;
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {
        data=data;
        id=id;
        setdata();
      });
    });
  }

@override
   initState()  {
  getdata();
    super.initState();
  }
  setdata(){
    _FirstController.text=data!.data!.vendorName.toString();
    _lastnameController.text=data!.data!.businessName.toString();
    _addressController.text=data!.data!.cityState.toString();
    _numberController.text=data!.data!.number.toString();
    _agedontroller.text=data!.data!.age.toString();
    _typeofstoreontroller.text=data!.data!.typeOfStore.toString();
    _pindontroller.text=data!.data!.pincode.toString();
    _gstNOontroller.text=data!.data!.gstNo.toString();
    _addressshopController.text=data!.data!.shopAddress.toString();
    _Timming.text=data!.data!.shopTiming.toString();
    _delvery.text=data!.data!.deliveryMode.toString();
    _facbook.text=data!.data!.socials!.facebook.toString();
    _insta.text=data!.data!.socials!.instagram.toString();
    getimage();
  }
  getimage() async {
    String img=await downloadandsave(data!.data!.shopPicture.toString());
    print("Imahe"+img.toString());
    XFile file=XFile(img.toString());
    setState(() {
      image=file;
    });
  }
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              if(_formKey.currentState!.validate()){
                setState(() {
                  load2=true;
                });
                updateprofile();
              }
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child:load2?CircularProgressIndicator(color: Colors.white): Text(
                  'Save Changes',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h(0.3),
              width: w(1),
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Center(
                    child: image==null?Image.asset(
                      "assets/friend_profile.png",
                      height: 100,
                      fit: BoxFit.fill,
                    ):Image.file(File(image!.path),height: 80,width: 120,fit: BoxFit.fill),
                  ),
                  InkWell(
                    onTap: () async {
                      var file=await pickImage();
                      setState(() {
                        image=file;
                      });
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ImageIcon(
                        AssetImage("assets/pen.png"),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0, left: 5, right: 5),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:  Form(
                    key:_formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "First Name:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              enabled: false,
                              controller: _FirstController,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your name' : null,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your name",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Business Name:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _lastnameController,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your Business name' : null,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your Business name",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Address:",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              enabled: false,
                              controller: _addressController,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your address' : null,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your address",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Phone Number",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              enabled: false,
                              controller: _numberController,
                              //enabled: false,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your phone number' : null,
                              style: const TextStyle(color: Colors.black),
                              inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your phone number",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Age",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _agedontroller,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your age' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your age",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Type your store",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _typeofstoreontroller,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your store' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your store",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Pincode",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              enabled: false,
                              controller: _pindontroller,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your pincode' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your pincode",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "GST No",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _gstNOontroller,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your gst-no' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your Gst no",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "ShopAddress",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              enabled: false,
                              controller: _addressshopController,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your shopAddress' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your shopAddress",
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
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Timing of shop(Open-close)",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _Timming,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your shop timing' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your shop timing",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Delivery mode (Pick up / Self)",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _delvery,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your delivery mode ' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your delivery mode ",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Instagram Profile link",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _insta,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your Instagram link' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your Instagram link",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Facebook link",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _facbook,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your shop timing' : null,
                              style: const TextStyle(color: Colors.black),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your shop timing",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  disabledBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> updateprofile()async {
    final paramDoc={
      "vendorName":_FirstController.text,
      "businessName":_lastnameController.text,
      "age":_agedontroller.text,
      "gstNo":_gstNOontroller.text,
      "shopTiming":_Timming.text,
      "deliveryMode":_delvery.text,
      "typeOfStore":_typeofstoreontroller.text,
    };
    List<MultipartBody> listImage=[
      MultipartBody("shopPicture",image!),
    ];
    authRepo().Updateprofilr(id!,paramDoc,listImage).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data1.toString());
      if(value.statusCode==200){
        Navigator.of(context).pop();
        load2=false;
      }else{
        load2=false;
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
      setState(() {});
    });

  }
}
