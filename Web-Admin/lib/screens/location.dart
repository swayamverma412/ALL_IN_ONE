// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../base/CommonMethod.dart';
import '../base/Perferance.dart';
import '../base/SnakeBAr.dart';
import '../data/AppContent.dart';
import '../persistentNavBar.dart';
import '../repository/Product_repo.dart';
import 'auth.dart';

class Location extends StatefulWidget {
  String reffer,number;


  Location(this.reffer, this.number);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int selected = 0;
  TextEditingController searchController = TextEditingController();
  GoogleMapController? mapController;
  LocationPermission? permission;
  Position? loc;
  LatLng source = LatLng(20.5937, 78.9629);
  CameraPosition? _kGoogle;
  List<Placemark> place=[];
  bool load=true;
  String? id;
  bool click=false;

  final List<Marker> _markers = <Marker>[];
  @override
  void initState() {
    getloaction();
    super.initState();
  }
  getloaction() async {
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      await Geolocator.requestPermission().whenComplete(() => getloaction());
    }else{
      loc=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      place=await getLocationDecode(loc!.latitude, loc!.longitude);
      place.forEach((element) {
        print("e"+element.toJson().toString());
      });
      setState((){
        _markers.add(
            Marker(
              markerId: MarkerId("2"),
              position: LatLng(loc!.latitude, loc!.longitude),
              infoWindow: InfoWindow(
                title: 'My Current Location',
              ),
            )
        );
        CameraPosition cameraPosition = new CameraPosition(
          target: LatLng(loc!.latitude, loc!.longitude),
          zoom: 15,
        );
        _kGoogle= CameraPosition(
          target: LatLng(loc!.latitude, loc!.longitude),
          zoom: 15,
        );
        mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        load=false;
        //AppContent.=loc!.latitude;
        Common().lat=loc!.latitude.toString();
        Common().lng=loc!.longitude.toString();
      });
    }
    setshare();
    print(loc!.toJson().toString());
  }

  setshare() async {
    await SharedPreferenceClass.SetSharedData(AppContent.LAT, loc!.latitude.toString()) ;
    await SharedPreferenceClass.SetSharedData(AppContent.LNG, loc!.longitude.toString()) ;
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
              //if(load==false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Auth(widget.number,widget.reffer)));
              //  Updateaddresss(paraDic);
            //  }
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: click?CircularProgressIndicator(color: Colors.white,):Text(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
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
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "Set your delivery location",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            /* Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.06), vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  controller: searchController,
                  //controller: passwordController,
                  style: TextStyle(fontSize: 16.0),

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Location",
                    fillColor: HexColor("D9D9D9"),
                    filled: true,
                    prefixIcon:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  ),
                ),
              ),
            ),*/
            Container(
              height: h(0.60),
              child:load?Center(child: CircularProgressIndicator(),): Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: _kGoogle!,
                    zoomControlsEnabled: false,
                    minMaxZoomPreference: MinMaxZoomPreference(0, 16),
                    compassEnabled: false,
                    indoorViewEnabled: true,
                    markers: Set<Marker>.of(_markers),
                    mapToolbarEnabled: false,
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller){
                     setState(() {
                       mapController=controller;
                     });
                    },
                    onCameraMove: (CameraPosition cameraPosition) {
                      print("postion"+cameraPosition.target.toJson().toString());
                      setState(() {
                        _kGoogle = cameraPosition;
                      });
                    },
                    onCameraIdle: (){
                      setState(() {
                        loc = Position(
                          latitude: _kGoogle!.target.latitude, longitude: _kGoogle!.target.longitude, timestamp: DateTime.now(),
                          heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1,
                        );
                      });
                      print("postion"+loc.toString());
                    },
                  ),
                  Center(child: Image.asset("assets/beststore.png", height: 50, width: 50)),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: w(0.05), right: w(0.05)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_on_outlined,
                          color: HexColor("FD2E2E"),
                        ),
                        place.length==0?Text(""):place.length>1?SizedBox(
                          width: w(0.75),
                          child: Text(
                            place[1].name.toString()+place[1].street.toString()+place[0].locality.toString(),
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ):SizedBox(
                          width: w(0.75),
                          child: Text(
                            place[0].street.toString()+place[0].locality.toString()+place[0].subLocality.toString(),
                            overflow: TextOverflow.clip,style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 10),
              child: Text(
                "SAVE ADDRESS AS",
                style: TextStyle(
                  color: HexColor("8A8989"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, right: 30,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      selected = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: selected == 0
                            ? Colors.red
                            : HexColor("F0F1F3"),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.home_outlined,
                              color: selected == 0
                                  ? Colors.white
                                  : Colors.black),
                          Text("Home",
                              style: TextStyle(
                                  color: selected == 0
                                      ? Colors.white
                                      : Colors.black))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: selected == 1
                            ? Colors.red
                            : HexColor("F0F1F3"),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.apartment_outlined,
                              color: selected == 1
                                  ? Colors.white
                                  : Colors.black),
                          Text("Office",
                              style: TextStyle(
                                  color: selected == 1
                                      ? Colors.white
                                      : Colors.black))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selected = 2;
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: selected == 2
                            ? Colors.red
                            : HexColor("F0F1F3"),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: selected == 2
                                  ? Colors.white
                                  : Colors.black),
                          Text(
                            "Other",
                            style: TextStyle(
                                color: selected == 2
                                    ? Colors.white
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
 /* Future<void> Updateaddresss(Map<String,String> body)async {
    id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    ProductRepo().updateaddress(body,id.toString()).then((value){
      print("value"+value.body.toString());
      var data=jsonDecode(value.body);
      if(value.statusCode==200){
        Provider.of<ordercontroller>(context,listen: false).updateaddress(Updateaddress.fromJson(data), selected==0?"home":selected==1?"office":"other");
        click=false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => PersistentNavBar()),(route) => false,);
      }else{
        setState((){
          click=false;
        });
        toastShow(data["message"].toString(),Colors.red);
        print("Error");
      }
    });
  }*/

}
