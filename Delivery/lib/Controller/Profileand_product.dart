import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../Model/OrderModel.dart';
import '../Model/ProfileModel.dart';
import '../Model/ProfileModel2.dart';
import '../base/CommonMethod.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import '../repository/OrderRepo.dart';
import '../repository/authRepo.dart';

class Profilecontroller extends ChangeNotifier{
  ProfileModel2? profileModell;
  String onof="";
  String statusChangesTo="";
  String? id;
  bool loadnew = true;
  OrderModel? get_orderlatest;

  bool load=true;


  ProfileModel2? get profile=> profileModell;
  final Location location = Location();
  OrderModel? get ordere_listlatest => get_orderlatest;

  LocationData? _location;
  late StreamSubscription<LocationData> _locationSubscription;
  String? _error;

  Future<void> listenLocation() async {
    print("Listfen call");
    await location.changeSettings(interval: 3000, distanceFilter: 10.0);
    _locationSubscription = location.onLocationChanged.handleError((dynamic err) {
            _error = err.code;
          _locationSubscription.cancel();
        }).listen((LocationData currentLocation) {
            print("lat"+currentLocation.latitude.toString());
           /* _error = null;
            _location = currentLocation;*/
        });
   // notifyListeners();
  }
  Future<void> stopListen() async {
    _locationSubscription.cancel();
    notifyListeners();
  }




  Future<void> getdata()async {
     id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    authRepo().getprofilr(id!).then((value){
      var data1=jsonDecode(value.body);
      // print("value-------------"+data.toString());
      if(value.statusCode==200){
        try{
          profileModell=ProfileModel2.fromJson(data1);
          if(profileModell!.data!.available=="no"){
            onof="Offline";
            statusChangesTo="Online";
          }else{
            onof="Online";
            statusChangesTo="Offline";
          }
          //print(get_category!.toJson().toString());
        }catch(e){
          print("Error1"+e.toString());
         /* err=true;
          load=false;*/
          toastShow(e.toString(),Colors.red);
        }
      }else{
       /* err=true;
        load=false;
        print("Error");*/
        toastShow(data1["message"].toString(),Colors.red);
      }
      notifyListeners();
    });
  }

  updateprofile() {
    String Chnage=statusChangesTo=="Online"?"yes":"no";
   /* if(Chnage=="no"){
      onof="Offline";
      statusChangesTo="Online";
    }else{
      onof="Online";
      statusChangesTo="Offline";
    }
    print(onof.toString()+statusChangesTo.toString()+"  "+Chnage);
    notifyListeners();*/
    final paramDoc={
      "available":Chnage.toString(),
    };
    authRepo().Updatestatus(id!,paramDoc,).then((value){
      var data1=jsonDecode(value.body);
      print("value-------------"+data1.toString());
      if(value.statusCode==200){
        getdata();
      }else{
        print("Error");
        toastShow(data1["message"].toString(),Colors.red);
      }
    });

  }


  Future<void> getOrder() async {
    String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    OrderRepo().getOrder(id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          get_orderlatest = OrderModel.fromJson(data);
          loadnew = false;
          //print(get_category!.toJson().toString());
        } catch (e) {
          print("Error1" + e.toString());
          loadnew = false;
          toastShow(e.toString(), Colors.red);
        }
      } else {
        loadnew = false;
        print("Error");
        toastShow(data["message"].toString(), Colors.red);
      }
      notifyListeners();
    });
  }



  // getloaction() async {
  //   permission = await Geolocator.checkPermission();
  //   if(permission == LocationPermission.denied){
  //     await Geolocator.requestPermission().whenComplete(() => getloaction());
  //   }else{
  //     loc=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //       markers.add(
  //           Marker(
  //             markerId: MarkerId("1"),
  //             position: LatLng(loc!.latitude, loc!.longitude),
  //             infoWindow: InfoWindow(
  //               title: 'My Current Location',
  //             ),
  //             draggable: true,
  //             icon: BitmapDescriptor.defaultMarker,
  //           )
  //       );
  //       CameraPosition cameraPosition = new CameraPosition(
  //         target: LatLng(loc!.latitude, loc!.longitude),
  //         zoom: 15,
  //       );
  //       kGoogle= CameraPosition(
  //         target: LatLng(loc!.latitude, loc!.longitude),
  //         zoom: 15,
  //       );
  //       mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  //       load=false;
  //       notifyListeners();
  //   }
  //   print(loc!.toJson().toString());
  // }


}