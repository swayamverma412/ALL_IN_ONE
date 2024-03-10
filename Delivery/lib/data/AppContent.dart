class AppContent{
  static const String BASE_URL = 'https://seal-app-ztj8m.ondigitalocean.app/d/';
  static const String BASE_Customer = 'https://squid-app-42u5n.ondigitalocean.app/c/';
  static const String signup = 'signup';
  static const String login = 'login';
  static const String sendOTP = 'sendOTP';
  static const String verifyOTP = 'verifyOTP';
  static const String profile = 'profile/';
  static const String updateprofile = 'updateProfile/';
  static const String updateOrder = 'updateOrder/';
  static const String acceptOrder = 'acceptOrder/';
  static const String updateDeliveryStatus = 'updateDeliveryStatus/';
  static const String payOutRequest = 'payOutRequest/';
  static const String addToWallet = 'addToWallet';
  static const String transferToWallet = 'transferToWallet';
  static const String updateAddress = 'updateAddress/';
  static const String fetchOrdersForDelivery = 'fetchOrdersForDelivery/';
  static const String fetchOrders = 'fetchOrders/';
  static const String fetchWallet = 'fetchWallet/';
  static const String getEarning = 'getEarning/';
  static const String listProduct = 'listProduct/';
  static const String getReviews = 'getReviews?vendorId=';
  static const String myTeam = 'myTeam/';
  static const String support = 'support/';



  // Shared Key
  static const String TOKEN = 'vender_token';
  static const String CUSTOMERID = 'vender_id';
  static const String USERNAME = 'username';
  static const String LOGSTATUS = 'Loginstatus';
  static const String LAT = 'lat';
  static const String LNG = 'lng';

}
class Common{
  String lat="26.92207";
  String lng="75.778885";

   String get lati=>lat;
   String get lnng => lng;
}