

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vendor_shopkeeper/controller/OrderController.dart';
import 'package:vendor_shopkeeper/persistentNavBar.dart';
import 'package:vendor_shopkeeper/screens/Splash.dart';
import 'package:vendor_shopkeeper/screens/delivered_successfully.dart';
import 'package:vendor_shopkeeper/screens/login1.dart';
import  'package:http/http.dart' as http;

import 'controller/ProductCotroller.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>OrderController()),
            ChangeNotifierProvider(create: (_)=>productController()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              home: Splash(),
              // home: Products(),
            ),
        );
  }
}
