// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/Prfile.dart';
import 'package:vendor_app/Model/profile/ProfileModel.dart';

import '../Repo/Product_repo.dart';
import '../base/CommonMethod.dart';
import '../base/SnakeBAr.dart';
import '../data/apiClient.dart';

class Profile extends StatefulWidget {
  String id;

  Profile(this.id);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool onUpdate = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  ProfileModel? model;
  bool click = false;
  bool update = false;
  XFile? imnage;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    model = context.watch<profileControler>().profile;
    print(model.toString());
    setState(() {
      _name.text = model!.data!.name!;
      _phone.text = model!.data!.number.toString();
      _email.text = model!.data!.email!;
    });
    getImage();
    super.didChangeDependencies();
  }
  getImage() async {
    String img= await downloadandsave(model!.data!.image.toString());
    imnage=XFile(img.toString());
    setState((){
      imnage=imnage;
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
              setState(() {
                click = true;
              });
              updatepro(widget.id);
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
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/friend_profile.png",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ImageIcon(
                      AssetImage("assets/pen.png"),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          hintText: "Swayam Verma",
                          suffixIcon: ImageIcon(
                            AssetImage("assets/pen.png"),
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (value) => {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Text(
                          "Phone No",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _phone,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "1234566788",
                        ),
                        onChanged: (value) => {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "test@gmail.com",
                        ),
                        onChanged: (value) => {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 15),
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
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Theme.of(context).primaryColor),
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
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    child: Image.file(
                                      File(imnage!.path),
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> updatepro(String id) async {
    final paramDic = {
      "name": _name.text,
    };
    if (model!.data!.email!.toString() != _email.text) {
      paramDic["email"] = _email.text;
    }
    List<MultipartBody> listImage = [
      MultipartBody("image", imnage!),
    ];
    ProductRepo().updateprofile_user(paramDic, listImage, id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        setState(() {
          click = false;
        });
        toastShow(data["message"].toString(), Colors.green);
        Navigator.of(context).pop();
      } else {
        setState(() {
          click = false;
        });
        toastShow(data["message"].toString(), Colors.red);
        print("Error");
      }
      onUpdate = false;
    });
  }

  Future<XFile?> pickImage() async {
    var Im2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    return Im2;
  }
}
