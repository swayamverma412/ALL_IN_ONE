

import '../data/AppContent.dart';
import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;
class ProductRepo{
  final ApiClient apiClient=ApiClient(appBaseUrl:AppContent.BASE_URL);


  Future<Http.Response> getProfile(String id) async {
    return await apiClient.getData(AppContent.profile+"/$id",true);
  }

  /*Future<Http.Response> allProduct(String id) async {
    return await apiClient.getData_Customerurl(AppContent.BASE_Customer+AppContent.getAllProducts+"?vendorId=${id}",false);
  }*/

  Future<Http.Response> Addproduct(String id,Map<String, String> Body,List<MultipartBody> list) async {
    return await apiClient.postMultipartData(AppContent.listProduct+id, Body, list);
  }



}