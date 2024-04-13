class AppContent{

 // static const String BASE_URL = 'https://allinonevendor.onrender.com/v/';
  static const String BASE_URL = 'https://monkfish-app-vi6gj.ondigitalocean.app/v/';
  static const String BASE_Customer = 'https://squid-app-42u5n.ondigitalocean.app/c/';
 // static const String BASE_URL = 'https://monkfish-app-vi6gj.ondigitalocean.app/v/';
  static const String signup = 'signup';
  static const String login = 'login';
  static const String sendOTP = 'sendOTP';
  static const String verifyOTP = 'verifyOTP';
  static const String profile = 'profile/';
  static const String updateprofile = 'updateProfile/';
  static const String findNearbyStore = 'findNearbyStore';
  static const String nearByStoresByProductsAndSubCat = 'nearByStoresByProductsAndSubCat';
  static const String updateOrder = 'updateOrder/';
  static const String payOutRequest = 'payOutRequest/';
  static const String fetch_categories = 'fetch_categories';
  static const String getAllProducts = 'getAllProducts';
  static const String getProductsBySubCategory = 'getProductsBySubCategory';
  static const String getProductDetails = 'getProductDetails/';
  static const String addToWallet = 'addToWallet';
  static const String transferToWallet = 'transferToWallet';
  static const String updateAddress = 'updateAddress/';
  static const String getOrder = 'getOrders/';
  static const String fetchWallet = 'fetchWallet/';
  static const String updateProduct = 'updateProduct/';
  static const String getTopSelling = 'getTopSelling/';
  static const String getEarning = 'getEarning/';
  static const String updateStore = 'updateStore/';
  static const String listProduct = 'listProduct/';
  static const String getReviews = 'getReviews?vendorId=';
  static const String myTeam = 'myTeam/';
  static const String support = 'support/';
  static const String getImages = 'getImages/';
  static const String generateQr = 'generateQr/';
  static const String getQr = 'getQr/';
  static const String getPaymentDetails = 'getPaymentDetails/';
  static const String earningInsights = 'earningInsights/';
  static const String orderInsights = 'orderInsights/';



  // Shared Key
  static const String TOKEN = 'vender_token';
  static const String CUSTOMERID = 'vender_id';
  static const String USERNAME = 'username';
  static const String LOGSTATUS = 'Loginstatus';
  static const String LAT = 'lat';
  static const String LNG = 'lng';


/*  //Common
static const String lat="26.92207";
static const String lng="75.778885";*/
}
class Common{
  String lat="26.92207";
  String lng="75.778885";

   String get lati=>lat;
   String get lnng => lng;
}