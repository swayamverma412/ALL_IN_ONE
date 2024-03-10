import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/base/Perferance.dart';
import 'package:vendor_delivery/data/AppContent.dart';
import 'package:vendor_delivery/screens/Splash.dart';
import 'package:vendor_delivery/screens/profile.dart';
import 'package:vendor_delivery/screens/qrScan.dart';
import 'package:vendor_delivery/screens/refer_and_earn.dart';
import 'package:vendor_delivery/screens/reviews.dart';
import 'package:vendor_delivery/screens/support.dart';
import 'package:vendor_delivery/screens/wallet.dart';

import '../Controller/Profileand_product.dart';
import '../base/SnakeBAr.dart';
import 'insights.dart';
import 'my_earning.dart';
import 'orderHistory.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    Widget accountSettingsIcon(
        {required String name,
        required IconData icon,
        GestureTapCallback? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: w(1),
            child: Center(
              child: Row(
                children: [
                  Icon(icon, color: Colors.red, size: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget accountSettingsImage(
        {required String name,
        required String icon,
        GestureTapCallback? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: w(1),
            child: Center(
              child: Row(
                children: [
                  ImageIcon(AssetImage(icon), color: Colors.red, size: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          accountSettingsImage(
            icon: "assets/wallet.png",
            name: "Wallet",
            onTap: () {
              pushNewScreen(context, screen: Wallet(), withNavBar: false);
            },
          ),
          accountSettingsIcon(
            icon: Icons.bar_chart_outlined,
            name: "Insights",
            onTap: () {
              pushNewScreen(
                context,
                screen: Insights(),
                withNavBar: false,
              );
            },
          ),
          accountSettingsIcon(
            icon: CupertinoIcons.cube_box,
            name: "Orders",
            onTap: () {
              pushNewScreen(context, screen: OrderPayment(), withNavBar: false);
            },
          ),
          accountSettingsIcon(
            icon: Icons.qr_code_scanner_sharp,
            name: "QR Scan",
            onTap: () {
              pushNewScreen(
                context,
                screen: QrScan(),
                withNavBar: false,
              );
            },
          ),
          accountSettingsIcon(
            icon: Icons.support_agent_rounded,
            name: "Support",
            onTap: () {
              pushNewScreen(
                context,
                screen: Support(),
                withNavBar: false,
              );
            },
          ),
          accountSettingsIcon(
            icon: Icons.people,
            name: "Refer and Earn",
            onTap: () {
              pushNewScreen(
                context,
                screen: ReferAndEarn(),
                withNavBar: false,
              );
            },
          ),
          accountSettingsImage(
            icon: "assets/personal_details.png",
            name: "Personal Details",
            onTap: () {
              pushNewScreen(
                context,
                screen: Profile(),
                withNavBar: false,
              ).then((value){
                Provider.of<Profilecontroller>(context,listen: false).getdata();
              });
            },
          ),
          accountSettingsImage(
            icon: "assets/cod.png",
            name: "My Earnings",
            onTap: () {
              pushNewScreen(
                context,
                screen: MyEarning(),
                withNavBar: false,
              );
            },
          ),
          accountSettingsIcon(
            icon: Icons.logout_outlined,
            name: "Log Out",
            onTap: () async {
              await SharedPreferenceClass.SetSharedData(AppContent.LOGSTATUS,"false");
              Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => Splash()),(route) => false,);
              showCustomSnackBar(message: "Log out success!", context: context,isError: false);
            },
          ),
        ],
      ),
    );
  }
}
