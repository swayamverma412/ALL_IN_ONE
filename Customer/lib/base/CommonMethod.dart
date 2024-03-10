import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<List<Placemark>> getLocationDecode(double lat, double lng) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
  return placemarks;
}

Future<String> downloadandsave(String uri) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/shop';
  final http.Response response = await http.get(Uri.parse(uri));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}
