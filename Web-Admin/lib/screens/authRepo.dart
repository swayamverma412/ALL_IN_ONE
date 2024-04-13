import 'package:http/http.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;
import 'package:http/http.dart' as https;
class authRepo{
  // final ApiClient apiClient;
  // authRepo({@required this.apiClient, policyRepo});

  final ApiClient apiClient=ApiClient(appBaseUrl:AppContent.BASE_URL);

  Future<Http.Response> registration( Map<String, String> signUpBody,List<MultipartBody> list) async {
   return await apiClient.postMultipartData(AppContent.signup, signUpBody, list);
  //  return await apiClient.postDataSecond(AppContent.signup, signUpBody);
  }

  Future<Http.Response> Login( Map<String, String> LoginBody) async {
    return await apiClient.postData(AppContent.login, LoginBody);
  }

  Future<Http.Response> SendOtp( Map<String,String> LoginBody) async {
    return await apiClient.postData(AppContent.sendOTP, LoginBody);
  }
  Future<Http.Response> verifyOtp( Map<String,String> LoginBody) async {
    return await apiClient.postData(AppContent.verifyOTP, LoginBody);
  }

}