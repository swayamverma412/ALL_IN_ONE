// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_shopkeeper/base/NOdata.dart';
import 'package:vendor_shopkeeper/controller/OrderController.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import 'package:vendor_shopkeeper/screens/order_details.dart';
import '../util/customerror.dart';
import 'get_di.dart' as di;
import '../util/Perferance.dart';

class MyOrders extends StatefulWidget {
  MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  int modelBottomSheetSelectedButton = 1;
  ScrollController newScrollController = ScrollController(initialScrollOffset: 10,);
  ScrollController pastScrollController = ScrollController();
  String satus="order placed, accepted by vendor, ready to deliver, accepted by rider, marked as pickup&notStatus=completed";
  String complete="completed";
  String vender_ID="";
  String fliter="";

@override
  void initState() {
    super.initState();
      shareeId();
  }
  Future<void> shareeId() async {
    vender_ID  = await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    print("sdsdsd--"+vender_ID.toString());
   Provider.of<OrderController>(context,listen: false).getOrderApi(vender_ID,satus,false);
   Provider.of<OrderController>(context,listen: false).getOrderApi(vender_ID,complete,true);
  }

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    Widget newOrder(OrderController model) {
      //   print("cczcz---"+DateFormat('MM-dd-yyyy hh:mm a').format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse("${model.get_order?.data?[0].createdAt.toString()}")));
      return model.loading?Center(child: CircularProgressIndicator()):
      model.error?NoDataScreen(text: "No order"):
      model.get_order!.data!.length>0?ListView.builder(
        itemCount: model.get_order?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          final statusvalue =model.get_order?.data?[0].status?[0].toString();
          print("dffddvddvd"+statusvalue![0].toString());

          return Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: InkWell(
                onTap: () {
                  pushNewScreen(context,
                      screen: OrderDetails(data:model.get_order?.data?[index]), withNavBar: false).then((value){
                    Provider.of<OrderController>(context,listen: false).getOrderApi(vender_ID,satus,false);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10.0),
                      child: Container(
                          height: 80,
                          width: 80,
                          child: Image.network('${model.get_order?.data?[index].products?[0].productImage.toString()}',fit: BoxFit.fill,)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.get_order?.data?[index].customer?.name.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('dd MMMM, hh:mm a').format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").
                          parse('${model.get_order?.data?[index].createdAt}')),
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Order number -\n ${model.get_order?.data?[index].id.toString()}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            " ${model.get_order?.data?[index].totalItems.toString()} items",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rs.${model.get_order?.data?[index].totalAmount.toString()}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${model.get_order?.data?[index].paymentMethod.toString()}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "${model.get_order?.data?[index].status!.last.toString()}",
                              style: TextStyle(
                                fontSize: 12,
                                color: model.get_order?.data?[index].paymentStatus.toString() == "not paid"
                                    ? HexColor("#F9BB8D")
                                    : Colors.red,
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
        },
      ):NoDataScreen(text: "No order");
    }
    Widget pastOrder(OrderController model) {
      return RefreshIndicator(
        onRefresh:shareeId,
        child: Scrollbar(
          thickness: 10,
          thumbVisibility: true,
          controller: pastScrollController,
          radius: const Radius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: w(1),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (
                            BuildContext context,
                            ) {
                          return StatefulBuilder(
                              builder: (BuildContext context, StateSetter set) {
                                return SizedBox(
                                  height: h(0.3),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: modelBottomSheetSelectedButton == 1
                                                  ? Icon(Icons.radio_button_checked, color: Colors.red)
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  modelBottomSheetSelectedButton = 1;
                                                });
                                                setState(() {
                                                  fliter="recent";
                                                });

                                                Navigator.of(context).pop("recent");
                                              },
                                            ),
                                            Text("Recent")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: modelBottomSheetSelectedButton ==
                                                  2
                                                  ? Icon(Icons.radio_button_checked,
                                                  color: Colors.red)
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  modelBottomSheetSelectedButton = 2;
                                                });
                                                setState(() {
                                                  fliter="pastWeek";
                                                });
                                                Navigator.of(context).pop("pastWeek");
                                              },
                                            ),
                                            Text("Past Week")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: modelBottomSheetSelectedButton ==
                                                  3
                                                  ? Icon(Icons.radio_button_checked,
                                                  color: Colors.red)
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  modelBottomSheetSelectedButton = 3;
                                                });
                                                setState(() {
                                                  fliter="pastMonth";
                                                });
                                                Navigator.of(context).pop("pastMonth");
                                              },
                                            ),
                                            Text("Past Month")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon:
                                              modelBottomSheetSelectedButton == 4
                                                  ? Icon(
                                                Icons.radio_button_checked,
                                                color: Colors.red,
                                              )
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  modelBottomSheetSelectedButton = 4;
                                                });
                                                setState(() {
                                                  fliter="pastYear";
                                                });
                                                Navigator.of(context).pop("pastYear");
                                              },
                                            ),
                                            Text("Past Year")
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      ).then((value) {
                        Provider.of<OrderController>(context,listen: false).getOrderApi(vender_ID,complete+"&filter=${fliter}",true);
                      });
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        "assets/mi_filter.png",
                      ),
                    ),
                  ),
                ),
              ),
              model.loading2?Center(child: CircularProgressIndicator()):
              model.error2?NoDataScreen(text: "No order"):
              model.get_ordercomplete.isBlank == true ||  model.get_ordercomplete!.data!.length==0?NoDataScreen(text: "No Order"):SizedBox(
                height: h(0.6),
                width: w(1),
                    child: ListView.builder(
                  itemCount: model.get_ordercomplete!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          pushNewScreen(context,
                              screen: OrderDetails(data:model.get_ordercomplete?.data?[index]), withNavBar: false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10.0,right: 10.0),
                              child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network('${model.get_ordercomplete?.data?[index].products?[0].productImage.toString()}',fit: BoxFit.fill,)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${model.get_ordercomplete?.data?[index].customer?.name.toString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  DateFormat('dd MMMM, hh:mm a').format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").
                                  parse('${model.get_ordercomplete?.data?[index].createdAt}')),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Order number - ${model.get_ordercomplete?.data?[index].id.toString()}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    " ${model.get_ordercomplete?.data?[index].totalItems.toString()} items",
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                           /* Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rs.${model.get_ordercomplete?.data?[index].totalAmount.toString()}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${model.get_ordercomplete?.data?[index].paymentMethod.toString()}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "${model.get_ordercomplete?.data?[index].status!.last.toString()}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: model.get_ordercomplete?.data?[index].paymentStatus.toString() == "not paid"
                                            ? HexColor("#F9BB8D")
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )*/
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Consumer<OrderController>(
          builder: (context, orderModel,child) {
            return orderModel.loading==true?Center(
              child: SizedBox(
                height: 20,
                  width: 20,
                  child: CircularProgressIndicator()),
            ):SingleChildScrollView(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      height: h(0.058),
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[4],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "My Orders",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      width: w(1),
                      height: h(0.8),
                      child: ContainedTabBarView(
                        tabBarProperties: TabBarProperties(
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.black,
                            labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorSize: TabBarIndicatorSize.label),
                        tabs: [
                          Text('New Orders'),
                          Text('Past Orders'),
                        ],
                        views: [
                          RefreshIndicator(
                            onRefresh:shareeId,
                            child: Scrollbar(
                              thickness: 10,
                              thumbVisibility: true,
                              controller: newScrollController,
                              radius: const Radius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: newOrder(orderModel),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: pastOrder(orderModel),
                          ),
                        ],
                        // onChange: (index) => print(index),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
