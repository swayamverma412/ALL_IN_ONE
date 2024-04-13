

import '../data/AppContent.dart';
import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;
class ProductRepo{
  final ApiClient apiClient=ApiClient(appBaseUrl:AppContent.BASE_URL);

  Future<Http.Response> fetchproductby_subcategory(String title) async {
    return await apiClient.getData(AppContent.getProductsBySubCategory+"/$title",false);
  }

  Future<Http.Response> fetchstoreby_subcategory(String title) async {
    return await apiClient.getData(AppContent.nearByStoresByProductsAndSubCat+"?lat=${Common().lati}&long=${Common().lnng}&sc=${title}",false);
  }

  Future<Http.Response> UpdateProduct(Map<String,dynamic> body,String id) async {
    return await apiClient.putData(AppContent.updateProduct+id, body);
  }


  Future<Http.Response> getProfile(String id) async {
    return await apiClient.getData(AppContent.profile+"/$id",true);
  }

  Future<Http.Response> allProduct(String id) async {
    return await apiClient.getData(AppContent.getAllProducts+"/$id"+"?vendorId=${id}",true);
  }
  Future<Http.Response> SerachProduct(String id,String seach) async {
    return await apiClient.getData(AppContent.getAllProducts+"/$id"+"?p=${seach}",true);
  }
  Future<Http.Response> topSelling(String id) async {
    return await apiClient.getData(AppContent.getTopSelling+"${id}",true);
  }
  Future<Http.Response> getImage(String id) async {
    return await apiClient.getData(AppContent.getImages+"${id}",true);
  } Future<Http.Response> getearing(String id,String param) async {
    return await apiClient.getData(AppContent.earningInsights+"${id}?type=earning&timeFrame="+param,true);
  } Future<Http.Response> getearingorder(String id,String param) async {
    return await apiClient.getData(AppContent.orderInsights+"${id}?status=completed, canceled, order placed&timeFrame="+param,true);
  }
  Future<Http.Response> fecthcategory() async {
    return await apiClient.getData_Customerurl(AppContent.BASE_Customer+AppContent.fetch_categories,false);
  }
  Future<Http.Response> Addproduct(String id,Map<String, String> Body,List<MultipartBody> list) async {
    return await apiClient.postMultipartData(AppContent.listProduct+id, Body, list);
  }



}