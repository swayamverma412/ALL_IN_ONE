// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/ProfileModel.dart';
import '../Model/ProfileModel2.dart';
import '../base/CommonMethod.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import '../data/apiClient.dart';
import '../repository/authRepo.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final TextEditingController _FirstController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _agedontroller = TextEditingController();
  final TextEditingController _pindontroller = TextEditingController();




  bool click=false;
  bool load2=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool load=true;
  bool err=false;
  String? id;
  ProfileModel2? data;
  XFile? image;

  Future<void> getdata()async {
     id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    authRepo().getprofilr(id!).then((value){
      var data1=jsonDecode(value.body);
     // print("value-------------"+data.toString());
      if(value.statusCode==200){
        try{
          data=ProfileModel2.fromJson(data1);
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
    _FirstController.text=data!.data!.name.toString();
    _lastnameController.text=data!.data!.vehicalNumber.toString();
    _numberController.text=data!.data!.number.toString();
    _agedontroller.text=data!.data!.age.toString();
    _pindontroller.text=data!.data!.pincode.toString();
    getimage();
  }
  getimage() async {
    String img=await downloadandsave(data!.data!.image.toString());
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
                              "Vehicle Number",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _lastnameController,
                              validator: (value) =>
                              value!.isEmpty ? 'Enter your Vehicle number' : null,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Enter your Vehicle number",
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
      "name":_FirstController.text,
      "age":_agedontroller.text,
      "pincode":_pindontroller.text,
      "vehicalNumber":_lastnameController.text,
    };
    List<MultipartBody> listImage=[
      MultipartBody("image",image!),
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
