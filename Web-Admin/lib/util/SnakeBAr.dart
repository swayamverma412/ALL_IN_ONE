import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
void showCustomSnackBar({required String message,required BuildContext context,bool isError = true}) {
  if(message != null && message.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin: EdgeInsets.all(10.0),
      duration: Duration(seconds: 3),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Text(message, style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
      )),
    ));
  }
}

  //Display the Toast
   void toastShow(String ToastValue, Color _color) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: ToastValue,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: _color,
        textColor: Colors.white,
        fontSize: 16.0);

}


Future<List<Placemark>> getLocationDecode(double lat,double lng) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(lat,lng);
  return placemarks;
}