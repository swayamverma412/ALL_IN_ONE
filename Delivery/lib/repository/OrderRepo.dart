

import '../data/AppContent.dart';
import 'package:http/http.dart' as Http;

import '../data/apiClient.dart';
class OrderRepo{
  final ApiClient apiClient=ApiClient(appBaseUrl:AppContent.BASE_URL);

  Future<Http.Response> getOrder(String vender_id) async {
    return await apiClient.getData(AppContent.fetchOrdersForDelivery+'$vender_id',true);
  }
  Future<Http.Response> getOrder_Staus(String vender_id,String staus) async {
    return await apiClient.getData(AppContent.fetchOrders+'$vender_id'+staus,true);
  }

  Future<Http.Response> acceptOrder(String id,Map<String,String> body) async {
    return await apiClient.putData(AppContent.acceptOrder+'$id',body);
  }
  Future<Http.Response> UpdateOrder(String vender_id,Map<String,String> body) async {
    return await apiClient.putData(AppContent.updateDeliveryStatus+'$vender_id',body);
  }

}