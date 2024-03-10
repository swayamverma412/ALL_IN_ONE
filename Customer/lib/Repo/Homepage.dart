import 'package:vendor_app/data/AppContent.dart';

import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;

class Homepage_repo {
  final ApiClient apiClient = ApiClient(appBaseUrl: AppContent.BASE_URL);

  Future<Http.Response> fetchCategory() async {
    return await apiClient.getData(AppContent.fetch_categories, false);
  }

  Future<Http.Response> trendingShop(String lat, String lng) async {
    return await apiClient.getData(
        AppContent.trendingShop + "?lat=${lat}&long=${lng}", false);
  }

  Future<Http.Response> getData_Customeurl() async {
    return await apiClient.getData_Customeurl(
        AppContent.BASE_Admin + AppContent.getBanners, false);
  }
}
