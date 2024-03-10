// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/base/Perferance.dart';
import 'package:vendor_app/data/AppContent.dart';
import 'package:vendor_app/screen/traclkLocation.dart';

import '../Controller/orderController.dart';
import '../Model/OrderModel/GetOrderSecond.dart';
import '../Repo/orderRepo.dart';
import '../base/NOdata.dart';
import '../base/customerror.dart';

class OrderPayment extends StatefulWidget {
  OrderPayment({Key? key}) : super(key: key);

  @override
  State<OrderPayment> createState() => _OrderPaymentState();
}

class _OrderPaymentState extends State<OrderPayment> {
  String? id;
  double? rete;
  TextEditingController review = TextEditingController();

//current orders
  List<String> currentImage = [
    "assets/vegetable.png",
    "assets/vegetable.png",
    "assets/vegetable.png"
  ];

  List<String> currentType = [
    "Vegetables and Fruits",
    "Vegetables and Fruits",
    "Vegetables and Fruits"
  ];

  List<String> currentDate = ["24 August", "24 August", "24 August"];

  List<String> currentTime = ['11:00 am', '11:00 am', '11:00 am'];

  List<String> currentStoreName = [
    "Tripathi Store",
    "Tripathi Store",
    "Tripathi Store"
  ];

  List<String> currentTo = ["Home", "Home", "Home"];

  List<String> currentStatus = [
    "Pickup Arranged",
    "Pickup Arranged",
    "Pickup Arranged"
  ];

//past orders
  List<String> pastImage = ["assets/vegetable.png"];

  List<String> pastType = ["Vegetables and Fruits"];

  List<String> pastDate = ["24 August"];

  List<String> pastTime = ['11:00 am'];

  List<String> pastStoreName = ["Tripathi Store"];

  List<String> pastTo = ["Home"];

  List<double> stars = [0];

  Widget currentOrders(
    BuildContext context, {
    GestureTapCallback? onTap,
    String image = "",
    String type = "",
    String date = "",
    String time = "",
    String storeName = "",
    String to = "",
    String status = "",
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: HexColor("D9D9D9").withOpacity(0.47),
                      border: Border.all(
                        color: HexColor("D9D9D9"),
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 20,
                    child: Image.network(
                      image,

                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          type,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0),
                          child:
                              Text(status, style: TextStyle(color: Colors.red)),
                        )
                      ],
                    ),
                    Text(
                      "$date, $time",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Colors.red,
                          //   size: ,
                          // ),
                          Image.asset("assets/down_arrow.png"),
                          Text(storeName, style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.red),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          Text(
                            to,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget pastOrders(
    BuildContext context, {
    String image = "",
    String type = "",
    String date = "",
    String time = "",
    String storeName = "",
    String to = "",
    int index = 0,
    Data? data,
  }) {
    return Container(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: HexColor("D9D9D9").withOpacity(0.47),
                    border: Border.all(
                      color: HexColor("D9D9D9"),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  height: 20,
                  child: Image.network(
                    image,

                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        type,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Delivered",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "$date, $time",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/down_arrow.png"),
                        Text(storeName, style: TextStyle(fontSize: 14))
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        Row(
                          children: [
                            Text(
                              to,
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                print("Hello");
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height: 400,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 25.0),
                                              child: Center(
                                                child: Text(
                                                  "Rate Us!",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20.0, left: 20),
                                              child: Text(
                                                "Rating",
                                                style: TextStyle(fontSize: 22),
                                              ),
                                            ),
                                            RatingBar.builder(
                                              // tapOnlyMode: true,
                                              initialRating: double.parse(
                                                  data!.rating.toString()),
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.red,
                                              ),
                                              onRatingUpdate: (rating) {
                                                setState(() {
                                                  rete = rating;
                                                });
                                                print(rating.toString());
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 25.0, left: 20),
                                              child: Text(
                                                "YOUR REVIEWS",
                                                style: TextStyle(fontSize: 22),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: SizedBox(
                                                height: 100,
                                                child: Card(
                                                  elevation: 10,
                                                  child: TextFormField(
                                                    maxLines: 10,
                                                    minLines: 5,
                                                    controller: review,
                                                    decoration: InputDecoration(
                                                      fillColor:
                                                          HexColor("D9D9D9"),
                                                      // .withOpacity(0.3),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  rateandreview(
                                                      orderid: data.id!,
                                                      productid: data
                                                          .items![0].productId!,
                                                      rate: rete.toString(),
                                                      review: review.text,
                                                      vender: data.vendorId
                                                          .toString());
                                                  print(rete);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.redAccent),
                                                  child: Center(
                                                    child: Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) {
                                  Provider.of<ordercontroller>(context,
                                          listen: false)
                                      .getOrder(id!, "completed", true);
                                });
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: data!.rating! >= 1
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: data.rating! >= 2
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: data.rating! >= 3
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: data.rating! >= 4
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: data.rating! >= 5
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  void initState() {
    getshared();
    super.initState();
  }

  getshared() async {
    id = await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    Provider.of<ordercontroller>(context, listen: false).getOrder(
        id!,
        "order placed,ready to deliver,accepted by vendor,marked as pickup",
        false);
    Provider.of<ordercontroller>(context, listen: false)
        .getOrder(id!, "completed", true);
  }

  Future<void> refersh() async {
    Provider.of<ordercontroller>(context, listen: false).getOrder(
        id!,
        "order placed,ready to deliver,accepted by vendor,marked as pickup",
        false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ordercontroller>(builder: (context, model, rpo) {
      return SafeArea(
        child: RefreshIndicator(
          onRefresh: refersh,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //
                    height: MediaQuery.of(context).size.height * (0.058),
                    decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[4],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Orders",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       icon: Icon(Icons.qr_code, color: Colors.red),
                        //       onPressed: () {
                        //         pushNewScreen(
                        //           context,
                        //           screen: QrScan(),
                        //           withNavBar: false,
                        //         );
                        //       },
                        //     ),
                        //     IconButton(
                        //       icon: Icon(Icons.shopping_cart_outlined,
                        //           color: Colors.red),
                        //       onPressed: () {
                        //         pushNewScreen(
                        //           context,
                        //           screen: OrderPayment(),
                        //           withNavBar: false,
                        //         );
                        //       },
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ORDER(S) IN PROCESS",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 30),
                          child: model.loading
                              ? Center(child: CircularProgressIndicator())
                              : model.error
                                  ? CustomeError()
                                  : model.ordere_list!.data!.length == 0
                                      ? NoDataScreen(text: "NO order")
                                      : ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              model.ordere_list!.data!.length,
                                          itemBuilder: ((context, index) {
                                            print("length" +
                                                model.ordere_list!.data!.length
                                                    .toString());
                                            return currentOrders(
                                              context,
                                              onTap: () => {
                                                pushNewScreen(
                                                  context,
                                                  screen: TrackLocation(model
                                                      .ordere_list!
                                                      .data![index]),
                                                  withNavBar: false,
                                                ),
                                              },
                                              image: model
                                                  .ordere_list!
                                                  .data![index]
                                                  .products![0]
                                                  .productImage!,
                                              date: "15",
                                              status: model
                                                  .ordere_list!
                                                  .data![index]
                                                  .status![model
                                                          .ordere_list!
                                                          .data![index]
                                                          .status!
                                                          .length -
                                                      1]
                                                  .toString(),
                                              storeName: model
                                                  .ordere_list!
                                                  .data![index]
                                                  .vendor!
                                                  .businessName
                                                  .toString(),
                                              time: "12:00",
                                              to: model
                                                  .ordere_list!
                                                  .data![index]
                                                  .deliveryLocation!
                                                  .addressType
                                                  .toString(),
                                              type: model
                                                  .ordere_list!
                                                  .data![index]
                                                  .products![0]
                                                  .title
                                                  .toString(),
                                            );
                                          }),
                                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(
                            "PAST ADDRESS",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        model.loading2
                            ? Center(child: CircularProgressIndicator())
                            : model.error
                                ? CustomeError()
                                : model.ordere_complete!.data!.length == 0
                                    ? SizedBox()
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            model.ordere_complete!.data!.length,
                                        itemBuilder: ((context, index) {
                                          return pastOrders(
                                            context,
                                            image: model
                                                .ordere_complete!
                                                .data![index]
                                                .products![0]
                                                .productImage!,
                                            date: currentDate[index],
                                            storeName: model
                                                .ordere_complete!
                                                .data![index]
                                                .vendor!
                                                .businessName
                                                .toString(),
                                            time: currentTime[index],
                                            to: model
                                                .ordere_complete!
                                                .data![index]
                                                .deliveryLocation!
                                                .addressType
                                                .toString(),
                                            type: model.ordere_complete!
                                                .data![index].products![0].title
                                                .toString(),
                                            data: model
                                                .ordere_complete!.data![index],
                                          );
                                        }),
                                      ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Future<void> rateandreview(
      {required String rate,
      required String review,
      required String orderid,
      required String productid,
      required String vender}) async {
    OrderRepo().rateorder(rate, orderid, id!).then((value) {
      print("rate" + value.body.toString());
    });
    final param = {
      "productId": productid,
      "vendorId": vender,
      "review": review,
    };
    OrderRepo().review(param, id!).then((value) {
      print("reiew" + value.body.toString());
      Navigator.of(context).pop();
    });
  }
}
