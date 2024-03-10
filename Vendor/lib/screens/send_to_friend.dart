// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/screens/wallet_transfer.dart';

class SendFriends extends StatefulWidget {
  SendFriends({Key? key}) : super(key: key);

  @override
  State<SendFriends> createState() => _SendFriendsState();
}

class _SendFriendsState extends State<SendFriends> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    List<String> freindsImage = [
      "assets/friend_profile.png",
    ];
    List<String> name = ["Swati Verma"];
    List<String> number = ["+91 82104444484"];

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: h(0.058),
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "Send to Friends",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.06), vertical: 20),

              // height: 40,
              // borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  // controller: searchController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    border: InputBorder.none,
                    hintText: "Search number ",
                    fillColor: HexColor("D9D9D9"),
                    filled: true,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(freindsImage[index]),
                      title: Text(
                        name[index],
                      ),
                      subtitle: Text(number[index]),
                      onTap: () {
                        pushNewScreen(context,
                            screen: WalletTransfer(
                              image: freindsImage[index],
                              name: name[index],
                              number: number[index],
                            ));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
