import 'package:vendor_shopkeeper/data/apiClient.dart';

import '../data/AppContent.dart';
import 'package:http/http.dart' as Http;
class OrderRepo{
  final ApiClient apiClient=ApiClient(appBaseUrl:AppContent.BASE_URL);

  Future<Http.Response> getOrder(String vender_id,String satus) async {
    return await apiClient.getData(AppContent.getOrder+'$vender_id'+'?status=${satus}',true);
  }
  // Future<Http.Response> getOrder(String vender_id) async {
  //   return await apiClient.getData(AppContent.getOrder+'$vender_id'+'?status=order placed, ready to deliver, accepted by vendor, marked as pickup, canceled, completed',true);
  // }
  Future<Http.Response> UpdtaeOrder(String vender_id,String orderid,Map<String,String> body) async {
    return await apiClient.putData(AppContent.updateOrder+'$vender_id/${orderid}',body);
  }

}