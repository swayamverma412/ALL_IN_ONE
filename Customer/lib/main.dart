import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Controller/Homepage.dart';
import 'package:vendor_app/Controller/Product.dart';
import 'package:vendor_app/screen/Splash.dart';

import 'Controller/Cart.dart';
import 'Controller/Prfile.dart';
import 'Controller/StoreController.dart';
import 'Controller/orderController.dart';
import 'Persistent Nav Bar/persistentNavBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey =
      'pk_test_51MKQggSEyrgghEyZ8VR1lQRcfe8kBNgryKBOskTq7AiJsMapkvWcQp4sQDGxsOfaXJTNwxRycUZf93CWMuBe6rrp00wKE2AOIo';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomepageController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => StoreController()),
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => profileControler()),
        ChangeNotifierProvider(create: (_) => ordercontroller()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: LoginPage1(),
        //home: PersistentNavBar(),
        home: Splash(),
        // home: AdminVerify(),
      ),
    );
  }
}
