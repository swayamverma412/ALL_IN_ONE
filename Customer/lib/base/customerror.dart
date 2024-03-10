import 'package:flutter/material.dart';
import 'package:vendor_app/base/SnakeBAr.dart';

class CustomeError extends StatelessWidget {
  const CustomeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //showCustomSnackBar(message: "Server cannot response", context: context,isError: true);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4_rounded,color: Colors.redAccent,size: 25,),
          SizedBox(height: 5,),
          Text("Server cannot response",style: TextStyle(color: Colors.black,fontSize: 12),)
        ],
      )
    );
  }
}

class NameError extends StatelessWidget {
String? title;

NameError(this.title);

  @override
  Widget build(BuildContext context) {
    //showCustomSnackBar(message: "Server cannot response", context: context,isError: true);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.not_interested_outlined,color: Colors.redAccent,size: 30,),
            SizedBox(height: 6,),
            Text(title.toString(),style: TextStyle(color: Colors.black,fontSize: 14),)
          ],
        )
    );
  }
}
