
import 'package:vendor_app/data/AppContent.dart';

import '../base/Perferance.dart';
import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;
class ProductRepo{
  final ApiClient apiClient=ApiClient(appBaseUrl:AppContent.BASE_URL);

  Future<Http.Response> fetchproductby_subcategory(String title) async {
    return await apiClient.getData(AppContent.getProductsBySubCategory+"/$title",false);
  }

  Future<Http.Response> fetchstoreby_subcategory(String title) async {
    String lat=await SharedPreferenceClass.GetSharedData(AppContent.LAT);
    String lng=await SharedPreferenceClass.GetSharedData(AppContent.LNG);
    return await apiClient.getData(AppContent.nearByStoresByProductsAndSubCat+"?lat=${lat}&long=${lng}&sc=${title}",false);
  }
  Future<Http.Response> fetchcart(String id) async {
    return await apiClient.getData(AppContent.getCart+"/$id",true);
  }
  Future<Http.Response> Updatecart(Map<String,dynamic> body,String id) async {
    return await apiClient.putData(AppContent.updateCart+id, body);
  }
  Future<Http.Response> Addcart(Map<String,dynamic> body,String id) async {
    return await apiClient.postData(AppContent.addToCart+id, body);
  }


  Future<Http.Response> getProfile(String id) async {
    return await apiClient.getData(AppContent.profile+"/$id",true);
  }
  Future<Http.Response> updateaddress(Map<String,String> body,String id) async {
    return await apiClient.putData(AppContent.updateAddress+id, body);
  }
  Future<Http.Response> allProduct(String id) async {
   String ID= await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    return await apiClient.getData(AppContent.getAllProducts+"/$ID?vendorId=${id}",true);
  }
  Future<Http.Response> SerachProduct(String id,String seach) async {
    return await apiClient.getData(AppContent.getAllProducts+"/$id"+"?p=${seach}",true);
  }

  Future<Http.Response> Orderplace(String body,id,String pay) async {
    return await apiClient.postData(AppContent.createOrder+id+"?addressType=${body}&paymentStatus=${pay}",{"":""});
  }
  Future<Http.Response> updateprofile(Map<String,String> body,String id,) async {
    return await apiClient.putData(AppContent.updateProfile+id, body);
  }
  Future<Http.Response> SearchAllproduct(String id) async {
    String  idd=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    return await apiClient.getData(AppContent.searchProductOrStore+idd+"?q=${id}",true);
  }

  Future<Http.Response> updateprofile_user( Map<String, String> signUpBody,List<MultipartBody> list,String id) async {
    return await apiClient.putMultipartData(AppContent.updateProfile+id, signUpBody, list);
    //  return await apiClient.postDataSecond(AppContent.signup, signUpBody);
  }

  Future<Http.Response>  getteam(String id) async {
    return await apiClient.getData(AppContent.myTeam+"${id}",true);
  }

  Future<Http.Response> DeleteAddress(Map<String,dynamic> body,String id) async {
    return await apiClient.putData(AppContent.deleteAddress+id,body);
  }

  Future<Http.Response> ApplyCoupen(String name,String id) async {
    final paramDic={
      "coupon":name.toString(),
    };
    return await apiClient.putData(AppContent.applyCoupon+id,paramDic);
  }
  }