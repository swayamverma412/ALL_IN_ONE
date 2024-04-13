import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_shopkeeper/base/Perferance.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import '../base/CommonMethod.dart';
import '../base/SnakeBAr.dart';
import '../data/apiClient.dart';
import '../repository/authRepo.dart';
import 'login1.dart';

class Auth extends StatefulWidget {
  String? number;String reffer;


  Auth(this.number,this.reffer);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool click=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  final TextEditingController _referedBy = TextEditingController();
  LocationPermission? permission;
  Position? loc;
  List<Placemark> place=[];
  XFile? _gstimage;
  XFile? _adharfront;
  XFile? _adharback;
  XFile? _voter;
  XFile? _shopDocs;
  XFile? _vendorPicture;
  XFile? _shopPicture;
  List<String> delivery=["Pick up"];
  String delivry="";


  String? lat,lng;

  getloaction() async {
     lat=await SharedPreferenceClass.GetSharedData(AppContent.LAT);
     lng=await SharedPreferenceClass.GetSharedData(AppContent.LNG);
     place=await getLocationDecode(double.parse(lat.toString()),double.parse(lng.toString()));
     setState(() {
       place=place;
       lat=lat;
       lng=lng;
       _addressController.text=(place[1].name.toString()+place[1].street.toString()+place[0].locality.toString()).toString();
       _addressshopController.text=(place[1].name.toString()+place[1].street.toString()+place[0].locality.toString()).toString();
       _pindontroller.text=place[2].postalCode.toString();
       _numberController.text=widget.number.toString();

     });
  }
  @override
  void initState() {
    getloaction();
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
              if(_formKey.currentState!.validate()){
                setState(() {
                  click=true;
                });
                Signup();
              }
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Location()));*/
            },
            child:SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child:click?CircularProgressIndicator(color: Colors.white,):Text(
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
          primary: false,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBe,
              children: <Widget>[
                SizedBox(
                  height: 30,
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
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
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
                          DropdownButtonFormField<String>(
                            value: delivry,
                            validator: (value) =>
                            value!.isEmpty ? 'Enter your delivery mode ' : null,
                            items: delivery.map((label) => DropdownMenuItem(
                              child: Text(label.toString()),
                              value: label,
                            ))
                                .toList(),
                            hint: Text('Rating'),
                            onChanged: (value) {
                              setState(() {
                                delivry = value!;
                                _delvery.text=value;
                              });
                            },
                          ),
                     /*     TextFormField(
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),*/

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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Password:",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) =>
                            value!.isEmpty ? 'Enter your password' : null,
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Column(
                                 children: [
                                   Text(
                                    "Gst Bill Image",
                                    style: TextStyle(color: Colors.red, fontSize: 15)),
                                     const SizedBox(
                                       height: 10,
                                     ),
                                     InkWell(
                                       onTap: () async {
                                         var file=await pickImage();
                                         setState(() {
                                           _gstimage=file;
                                         });
                                       },
                                       child: _gstimage==null?Container(
                                         decoration: BoxDecoration(
                                           color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                           border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                         ),
                                         child: Container(
                                           margin: EdgeInsets.all(25),
                                           decoration: BoxDecoration(
                                             border: Border.all(width: 2, color: Colors.white),
                                             shape: BoxShape.circle,
                                           ),
                                           child: Icon(Icons.camera_alt, color: Colors.white),
                                         ),
                                       ):Container(
                                         height: 80,
                                         width: 80,
                                         decoration: BoxDecoration(
                                           color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                           border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                         ),
                                         child:Image.file(File(_gstimage!.path),height: 80,width: 80,),
                                       ),

                                     ),
                                 ],
                               ),
                               Column(
                                 children: [

                                   const Text(
                                     "Shop Document ",
                                     style: TextStyle(color: Colors.red, fontSize: 15),
                                   ),
                                   const SizedBox(
                                     height: 10,
                                   ),
                                   InkWell(
                                     onTap: () async {
                                       var file=await pickImage();
                                       setState(() {
                                         _shopDocs=file;
                                       });
                                     },
                                     child: _shopDocs==null?Container(
                                       decoration: BoxDecoration(
                                         color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                         border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                       ),
                                       child: Container(
                                         margin: EdgeInsets.all(25),
                                         decoration: BoxDecoration(
                                           border: Border.all(width: 2, color: Colors.white),
                                           shape: BoxShape.circle,
                                         ),
                                         child: Icon(Icons.camera_alt, color: Colors.white),
                                       ),
                                     ):Container(
                                       height: 80,
                                       width: 80,
                                       decoration: BoxDecoration(
                                         color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                         border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                       ),
                                       child:Image.file(File(_shopDocs!.path),height: 80,width: 80,),
                                     ),

                                   )
                                 ],
                               )
                             ],
                           ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(" Aadhaar front\nImage",
                                      style: TextStyle(color: Colors.red, fontSize: 15),textAlign: TextAlign.center),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var file=await pickImage();
                                      setState(() {
                                        _adharfront=file;
                                      });
                                    },
                                    child: _adharfront==null?Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.camera_alt, color: Colors.white),
                                      ),
                                    ):Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child:Image.file(File(_adharfront!.path),height: 80,width: 80,),
                                    ),

                                  ),
                                ],
                              ),
                              Column(
                                children: [

                                  const Text(
                                    "Aadhaar Back\nImage",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var file=await pickImage();
                                      setState(() {
                                        _adharback=file;
                                      });
                                    },
                                    child: _adharback==null?Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.camera_alt, color: Colors.white),
                                      ),
                                    ):Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child:Image.file(File(_adharback!.path),height: 80,width: 80,),
                                    ),

                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text("Your Picture",
                                      style: TextStyle(color: Colors.red, fontSize: 15),textAlign: TextAlign.center),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var file=await pickImage();
                                      setState(() {
                                        _vendorPicture=file;
                                      });
                                    },
                                    child: _vendorPicture==null?Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.camera_alt, color: Colors.white),
                                      ),
                                    ):Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child:Image.file(File(_vendorPicture!.path),height: 80,width: 80,),
                                    ),

                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Voter Image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var file=await pickImage();
                                      setState(() {
                                        _voter=file;
                                      });
                                    },
                                    child: _voter==null?Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.camera_alt, color: Colors.white),
                                      ),
                                    ):Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child:Image.file(File(_voter!.path),height: 80,width: 80,),
                                    ),

                                  )
                                ],
                              ),
                              Column(
                                children: [

                                  const Text(
                                    "Shop Image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var file=await pickImage();
                                      setState(() {
                                        _shopPicture=file;
                                      });
                                    },
                                    child: _shopPicture==null?Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.camera_alt, color: Colors.white),
                                      ),
                                    ):Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                      ),
                                      child:Image.file(File(_shopPicture!.path),height: 80,width: 80,),
                                    ),

                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
  Future<void> Signup() async{
    final  paraDic={
      "vendorName":_FirstController.text,
      "businessName":_lastnameController.text,
      "age":_agedontroller.text,
      "pincode":_pindontroller.text,
      "cityState":place[0].locality.toString(),
      "typeOfStore":_typeofstoreontroller.text,
      "gstNo":_gstNOontroller.text,
      "shopAddress":_addressshopController.text,
      "shopAge":_shoage.text,
      "shopTiming":_Timming.text,
      "deliveryMode":_delvery.text,
      "instagram":_insta.text,
      "facebook":_facbook.text,
      "number":_numberController.text,
      "password":_passwordController.text,
      "latitude":lat.toString(),
      "longitude":lng.toString(),
    };
    if(widget.reffer.isNotEmpty){
      paraDic["referredBy"]=widget.reffer.toString();
    }
    List<MultipartBody> listImage=[
      MultipartBody("gst",_gstimage!),
      MultipartBody("shopDocs",_shopDocs!),
      MultipartBody("aadharFront",_adharfront!),
      MultipartBody("aadharBack",_adharback!),
      MultipartBody("vendorPicture",_vendorPicture!),
      MultipartBody("shopPicture",_shopPicture!),
      MultipartBody("voter",_voter!),
    ];
    authRepo().registration(paraDic,listImage).then((value){
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

  Future<XFile?> pickImage() async {
   var Im2 = await ImagePicker().pickImage(source: ImageSource.gallery);
   return Im2;
  }
}
