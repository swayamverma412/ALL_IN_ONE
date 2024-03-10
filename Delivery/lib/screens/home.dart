// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/base/NOdata.dart';
import 'package:vendor_delivery/base/SnakeBAr.dart';

import '../Controller/Profileand_product.dart';
import '../base/Perferance.dart';
import '../data/AppContent.dart';
import '../repository/OrderRepo.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController? mapController;
  LocationPermission? permission;
  Position? loc;
  LatLng source = LatLng(20.5937, 78.9629);
  CameraPosition? kGoogle;
  final List<Marker> markers = <Marker>[];
  bool load=true;
  int? ind;
  Timer? _timer;

  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  bool isOnline = false;
  String currentStatus = "Offline";
  String statusChangesTo = "Online";

  int star = 3; //1 <= star <= 5 , tells the number of star of the driver

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  @override
  void didChangeDependencies() {
   // Provider.of<Profilecontroller>(context,listen: false).listenLocation();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    _timer!.cancel();
    Provider.of<Profilecontroller>(context,listen: false).stopListen();
    super.dispose();
  }

  @override
  void initState() {
    getloaction();
    getorder();
    super.initState();
  }
  getloaction() async {
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      await Geolocator.requestPermission().whenComplete(() => getloaction());
    }else{
      loc=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      markers.add(
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(loc!.latitude, loc!.longitude),
            infoWindow: InfoWindow(
              title: 'My Current Location',
            ),
            draggable: true,
            icon: BitmapDescriptor.defaultMarker,
          )
      );
      CameraPosition cameraPosition = new CameraPosition(
        target: LatLng(loc!.latitude, loc!.longitude),
        zoom: 15,
      );
      kGoogle= CameraPosition(
        target: LatLng(loc!.latitude, loc!.longitude),
        zoom: 15,
      );
      mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      load=false;
      setState(() {
      });
    }
    print(loc!.toJson().toString());
  }

  getorder(){
     _timer=Timer.periodic(Duration(seconds: 10), (timer) {
       if(Provider.of<Profilecontroller>(context,listen: false).onof.toString()=="Online"){
         Provider.of<Profilecontroller>(context,listen: false).getOrder();
       }else{
         toastShow("You are offline",Colors.redAccent);
       }
      print("Min"+timer.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return  load?Container(
      height: h(1.0),
        color: Colors.white,
        child: Center(child: CircularProgressIndicator())): Scaffold(
      endDrawerEnableOpenDragGesture: false,
      key: _key,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: 200,
                color: HexColor("#BDD9D9D9"),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          _key.currentState!.closeDrawer();
                        },
                        icon: Icon(Icons.close, color: Colors.red, size: 30),
                      ),
                      context.watch<Profilecontroller>().profileModell == null? SizedBox(
                          height: 80,
                          width: 100,
                          child:Text("Login Again For!.")
                      ):Row(
                        children: [
                          SizedBox(
                              height: 80,
                              width: 100,
                              child: Image.network(context.watch<Profilecontroller>().profileModell!.data!.image.toString())
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${context.watch<Profilecontroller>().profileModell!.data!.name.toString()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  "${context.watch<Profilecontroller>().profileModell!.data!.number.toString()}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.57)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, left: 2),
                                child: Text(
                                  "swaymverma@gmail.com",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.57)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: star >= 1
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: star >= 2
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: star >= 3
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: star >= 4
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: star >= 5
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            DrawerWidget()
          ],
        ),
      ),
      body:Consumer<Profilecontroller>(builder: (context,model,child){
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50 ),
              height: h(0.05),
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[4],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () => _key.currentState!.openDrawer(),
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "You're ${context.watch<Profilecontroller>().onof}",
                        //"You'r",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0),
                        child: InkWell(
                          onTap: () {
                            print("CLik");
                            Provider.of<Profilecontroller>(context,listen: false).updateprofile();
                           /* isOnline = !isOnline;
                            if (isOnline) {
                              currentStatus = "Online";
                              statusChangesTo = "Offline";
                              setState(() {});
                            } else {
                              statusChangesTo = "Online";
                              currentStatus = "Offline";

                              setState(() {});
                            }*/
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Go ${context.watch<Profilecontroller>().statusChangesTo}",
                                //"Go ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: h(0.85),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    height: h(0.8),
                    child:  GoogleMap(
                      initialCameraPosition:kGoogle!,
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: true,
                      markers: Set<Marker>.of(markers),
                      mapToolbarEnabled: false,
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController controller){
                      },
                      onCameraMove: (CameraPosition cameraPositiona) {
                      },
                      onCameraIdle: () async { //when map drag stops
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h(0.68)),
                    child:Card(
                      elevation: 5,
                      child: model.ordere_listlatest==null || model.ordere_listlatest!.data!.length==0?Center(child: Text("No order")): Padding(
                    //  child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: model.ordere_listlatest!.data!.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index){
                            return ListTile(
                                  title:Text(model.ordere_listlatest!
                                      .data![index].vendorDetails![0].businessName.toString()),
                              subtitle: Text(model
                                  .ordere_listlatest!.data![index]
                                  .deliveryLocation!.addressType.toString()),
                              leading:Container(
                                color: Colors.redAccent,
                                height: 50,width: 50,
                              child:Image.network(model.ordere_listlatest!.data![index].vendorDetails![0].shopPicture!),
                              ),
                              trailing: InkWell(
                                onTap: () async {
                                  setState(() {
                                    ind=index;
                                  });
                                  String id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
                                  final param={
                                    "orderId":model.ordere_listlatest!.data![index].id.toString(),
                                  };
                                  OrderRepo().acceptOrder(id, param).then((value){
                                    print("value" + value.body.toString());
                                    var data = jsonDecode(value.body);
                                    if (value.statusCode == 200) {
                                      ind = -1;
                                      Provider.of<Profilecontroller>(context,listen: false).getOrder();
                                    } else {
                                      ind = -1;
                                      print("Error");
                                      toastShow(data["message"].toString(), Colors.red);
                                    }
                                  });
                                },
                                child:ind==index?SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(color: Colors.redAccent,)):  Container(
                                  // height: 15,
                                  // width: 50,
                                  margin: EdgeInsets.only(left: 40),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child:Text("Accept",style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ),
                                );
                        }),
                      ),
                      /*child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "64",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Orders",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "164km",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Ride",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  "Rs.5000",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Earning",
                                    style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),*/
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
