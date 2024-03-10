// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/categories.dart';
import 'package:vendor_app/screen/homePage.dart';
import 'package:vendor_app/screen/location_fetch.dart';
import 'package:vendor_app/screen/login2.dart';
import 'package:vendor_app/screen/myAccount.dart';
import 'package:vendor_app/screen/orderHistory.dart';

class PersistentNavBar extends StatefulWidget {
  const PersistentNavBar({Key? key}) : super(key: key);

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  double random(min, max) {
    return min + Random().nextInt(max - min).toDouble();
  }
  PersistentTabController _controller=PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          textStyle: TextStyle(fontSize: 18),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.square_grid_2x2),
          title: ("Categories"),
          textStyle: TextStyle(fontSize: 18),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          title: ("Order"),
          textStyle: TextStyle(fontSize: 18),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_outlined),
          title: ("Profile"),
          textStyle: TextStyle(fontSize: 18),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ];
    }
    return PersistentTabView(
      context,
      backgroundColor: Colors.red,
      controller: _controller,
      screens: [
        homepage(),
        Categories(),
        OrderPayment(),
        MyAccount(),
      ],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style9,
      stateManagement: true,
    );
  }
}
