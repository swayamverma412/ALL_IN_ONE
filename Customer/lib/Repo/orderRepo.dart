import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/AppContent.dart';
import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;

class OrderRepo extends ChangeNotifier {
  final ApiClient apiClient = ApiClient(appBaseUrl: AppContent.BASE_URL);

  Future<Http.Response> getorder(String body, String id) async {
    return await apiClient.getData(
        AppContent.getOrders + id + "?status=${body.toString()}", true);
  }

  Future<Http.Response> getorderDetils(String body, String id) async {
    return await apiClient.getData(
        AppContent.orderDetails + id + "?orderId=${body.toString()}", true);
  }

  Future<Http.Response> rateorder(
      String rate, String orderid, String id) async {
    final paradic = {
      "": "",
    };
    return await apiClient.putData(
        AppContent.rateOrder + id + "?r=${rate}&orderId=${orderid}", paradic);
  }

  Future<Http.Response> review(Map<String, String> body, String id) async {
    return await apiClient.postData(AppContent.createReview + id, body);
  }
  Future<Http.Response> getCounpen() async {
    return await apiClient.getData_Customeurl(AppContent.BASE_Admin+AppContent.getCoupon,false);
  }
}
