import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/location.dart';
import 'package:vendor_app/screen/location_fetch.dart';
import 'package:vendor_app/screen/login1.dart';

import '../Persistent Nav Bar/persistentNavBar.dart';
import '../Repo/authRepo.dart';
import '../base/SnakeBAr.dart';
import '../data/apiClient.dart';

class Auth extends StatefulWidget {
  String? number;
  String reffer;

  Auth(this.number, this.reffer);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool click = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _FirstController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordontroller = TextEditingController();
  LocationPermission? permission;
  Position? loc;
  XFile? imnage;

  getloaction() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission().whenComplete(() => getloaction());
    } else {
      loc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        loc = loc;
        _numberController.text = widget.number.toString();
      });
    }
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
              if (_formKey.currentState!.validate()) {
                setState(() {
                  click = true;
                });
                Signup();
              }
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Location()));*/
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: click
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
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
                        "Verification",
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
                  key: _formKey,
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
                                value!.isEmpty ? 'Enter your first name' : null,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter your first name",
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
                            height: 20,
                          ),
                          const Text(
                            "Last Name:",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _lastnameController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter your last name' : null,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter your last name",
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
                            height: 20,
                          ),
                          const Text(
                            "E-mail:",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter your email' : null,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter your email",
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
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Phone Number:",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _numberController,
                            enabled: false,
                            validator: (value) => value!.isEmpty
                                ? 'Enter your phone number'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            keyboardType: TextInputType.number,
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
                            controller: _passwordontroller,
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
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Image",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  var file = await pickImage();
                                  setState(() {
                                    imnage = file;
                                  });
                                },
                                child: imnage == null
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              width: 1,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(25),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.white),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.camera_alt,
                                              color: Colors.white),
                                        ),
                                      )
                                    : Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              width: 1,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        child: Image.file(
                                          File(imnage!.path),
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
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

  Future<void> Signup() async {
    final paraDic = {
      "name": _FirstController.text,
      "email": _emailController.text,
      "location": _addressController.text,
      "number": _numberController.text,
      "password": _passwordontroller.text,
      "latitude": loc!.latitude.toString(),
      "longitude": loc!.longitude.toString(),
      widget.reffer.toString() == "no" ? "" : "referredBy":
          widget.reffer.toString(),
    };
    List<MultipartBody> listImage = [
      MultipartBody("image", imnage!),
    ];
    authRepo().registration(paraDic, listImage).then((value) {
      try {
        var data = jsonDecode(value.body);
        if (value.statusCode == 201) {
          var data = jsonDecode(value.body);
          print(value.toString());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage1()),
            (route) => false,
          );
          showCustomSnackBar(
              message: data["message"], context: context, isError: false);
        } else {
          setState(() {
            click = false;
          });
          showCustomSnackBar(
              message: data["message"], context: context, isError: true);
        }
      } catch (e) {
        print(e.toString());
        setState(() {
          click = false;
        });
        showCustomSnackBar(
            message: value.body.toString() + e.toString(),
            context: context,
            isError: false);
      }
    });
  }

  Future<XFile?> pickImage() async {
    var Im2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    return Im2;
  }
}
