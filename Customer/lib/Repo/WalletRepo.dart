import '../data/AppContent.dart';
import '../data/apiClient.dart';
import 'package:http/http.dart' as Http;

class WalletRepo {
  final ApiClient apiClient = ApiClient(appBaseUrl: AppContent.BASE_URL);
  Future<Http.Response> fetchwallet(String id) async {
    return await apiClient.getData(AppContent.fetchWallet + "${id}", true);
  }

  Future<Http.Response> payoutRequest(
      String id, String amount, Map<String, String> paramDic) async {
    return await apiClient.postData(
        AppContent.payOutRequest + "${id}?amt=${amount}", paramDic);
  }

  Future<Http.Response> transferRequest(
    String id,
    Map<String, String> paramDic,
  ) async {
    final body = {
      "": "",
    };
    return await apiClient.putData(
        AppContent.transferToWallet +
            "/${id}?from=${paramDic["from"]}&to=${paramDic["to"]}&amt=${paramDic["amt"]}&note=success",
        body);
  }

  Future<Http.Response> fetchearing(String id) async {
    return await apiClient.getData(AppContent.getEarning + "${id}", true);
  }

  Future<Http.Response> getteam(String id, String code, String type) async {
    final para = {
      "collName": type,
      "referralCode": code,
    };
    return await apiClient.getData(
        AppContent.myTeam + "${id}?collName=${type}&referralCode=$code", true);
  }
  Future<Http.Response> Support(String id,Map<String,String> paramDic,)async {
    return await apiClient.postData(AppContent.support+id,paramDic);
  }
}
