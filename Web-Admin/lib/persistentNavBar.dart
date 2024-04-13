// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/myAccount.dart';
import 'package:vendor_shopkeeper/screens/myOrders.dart';
import 'package:vendor_shopkeeper/screens/products.dart';

class PersistentNavBar extends StatelessWidget {
  const PersistentNavBar({Key? key}) : super(key: key);

  double random(min, max) {
    return min + Random().nextInt(max - min).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.bag),
          title: ("Orders"),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.cube_box),
          title: ("Products"),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.person),
          title: ("Profile"),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ];
    }

    //ToDo
    //When returning from category page to home page the changes in category remains same.
    return PersistentTabView(
      context,
      backgroundColor: Colors.red,
      controller: _controller,
      screens: [MyOrders(), Products(), MyAccount()],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style9,
      stateManagement: true,
    );
  }
}
