import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Persistent%20Nav%20Bar/persistentNavBar.dart';

import '../Controller/orderController.dart';
import '../Model/OrderModel/Updateaddress.dart';
import '../Repo/Product_repo.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';

class Manual_Location extends StatefulWidget {
  Map<String,String> address;
  int selected;String addess;


  Manual_Location(this.address,this.selected,this.addess);

  @override
  State<Manual_Location> createState() => _Manual_LocationState();
}

class _Manual_LocationState extends State<Manual_Location> {
  TextEditingController houseno = TextEditingController();
  TextEditingController nearby = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController Stereet = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool click = false;
  @override
  void initState() {
    setState((){
      address.text=widget.addess.toString();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[4],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Address",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "Address",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: address,
                  enabled: false,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your house no' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter you house  no",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "House No",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: houseno,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your house no' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter you house  no",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Street Address",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: Stereet,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your Street' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter you address",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),

                const Text(
                  "Near Land-mark",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nearby,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your land marker' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter you house  no",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                         setState(() {
                            click = true;
                          });
                         final paramdic={
                           "houseNo":houseno.text,
                           "street":Stereet.text,
                           "landmark":nearby.text,
                         };
                         widget.address.addAll(paramdic);
                         Updateaddresss( widget.address);

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
                          child: click
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> Updateaddresss(Map<String,String> body)async {
   String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
   String address = await SharedPreferenceClass.GetSharedData(AppContent.SELECTADDRESS);
    ProductRepo().updateaddress(body,id.toString()).then((value){
      print("value"+value.body.toString());
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        Provider.of<ordercontroller>(context,listen: false).updateaddress(Updateaddress.fromJson(data));
        Provider.of<ordercontroller>(context, listen: false).Updateaddres(id, address);
        click=false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => PersistentNavBar()),
              (route) => false,
        );
      }else{
        setState((){
          click=false;
        });
        toastShow(data["message"].toString(),Colors.red);
        print("Error");
      }
    });
  }
}
