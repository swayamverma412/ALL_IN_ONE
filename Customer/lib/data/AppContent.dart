class AppContent {
  //static const String BASE_URL = 'https://allinonecustomer.onrender.com';
  static const String BASE_URL = 'https://squid-app-42u5n.ondigitalocean.app';
  static const String BASE_Admin = 'https://seashell-app-fho64.ondigitalocean.app';
//  static const String BASE_URL2 = 'allinonecustomer.onrender.com';
  static const String signup = '/c/signup';
  static const String login = '/c/login';
  static const String sendOTP = '/c/sendOTP';
  static const String verifyOTP = '/c/verifyOTP';
  static const String profile = '/c/profile';
  static const String updateprofile = '/c/updateProfile/';
  static const String addToCart = '/c/addToCart/';
  static const String findNearbyStore = '/c/findNearbyStore';
  static const String nearByStoresByProductsAndSubCat =
      '/c/nearByStoresByProductsAndSubCat';
  static const String updateCart = '/c/updateCart/';
  static const String createOrder = '/c/createOrder/';
  static const String updateOrder = '/c/updateOrder/';
  static const String deleteCart = '/c/deleteCart/';
  static const String getCart = '/c/getCart';
  static const String payOutRequest = '/c/payOutRequest/';
  static const String fetch_categories = '/c/fetch_categories';
  static const String getAllProducts = '/c/getAllProducts';
  static const String getProductsBySubCategory = '/c/getProductsBySubCategory';
  static const String getProductDetails = '/c/getProductDetails/';
  static const String addToWallet = '/c/addToWallet';
  static const String transferToWallet = '/c/transferToWallet';
  static const String updateAddress = '/c/updateAddress/';
  static const String getOrders = '/c/getOrders/';
  static const String orderDetails = '/c/orderDetails/';
  static const String fetchWallet = '/c/fetchWallet/';
  static const String trendingShop = '/c/trendingShop';
  static const String updateProfile = '/c/updateProfile/';
  static const String getEarning = '/c/getEarning/';
  static const String rateOrder = '/c/rateOrder/';
  static const String createReview = '/c/createReview/';
  static const String myTeam = '/c/myTeam/';
  static const String deleteAddress = '/c/deleteAddress/';
  static const String getBanners = '/a/getBanners';
  static const String support = '/c/support/';
  static const String searchProductOrStore = '/c/searchProductOrStore/';
  static const String getCoupon = '/a/getCoupon';
  static const String applyCoupon = '/c/applyCoupon/';

  // Shared Key
  static const String TOKEN = 'customer_token';
  static const String CUSTOMERID = 'customer_id';
  static const String USERNAME = 'username';
  static const String LOGSTATUS = 'Loginstatus';
  static const String SELECTADDRESS = 'selectaddress';
  static const String LAT = 'lat';
  static const String LNG = 'lng';

//COMMON>>>>>>>>>>>>>

  static const String Secreate =
      'sk_test_51MKQggSEyrgghEyZ2ETAXN6PflwVx6u1t7doXxQpMag6gfykAQCNpHH5vOjvnEijvzska2O0CdY0xEYDFk4jlPx700cs8pGwI4';

/*  //Common
static const String lat="26.92207";
static const String lng="75.778885";*/
}

class Common {
  String lat = "26.92207";
  String lng = "75.778885";

  String get lati => lat;
  String get lnng => lng;
}
