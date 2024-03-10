import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/Controller/Profileand_product.dart';
import 'package:vendor_delivery/Controller/orderController.dart';
import 'package:vendor_delivery/Model/OrderModel.dart';
import 'package:vendor_delivery/screens/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>Profilecontroller()),
        ChangeNotifierProvider(create: (_)=>ordercontroller()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: Splash()
          // home: TrackLocation(),
          // home: AdminVerify()
          ),
    );
  }
}
