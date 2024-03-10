import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/profile/ProfileModel.dart';
import '../Repo/Product_repo.dart';
import '../base/SnakeBAr.dart';

class profileControler extends ChangeNotifier {
  final ProductRepo repo = ProductRepo();
  ProfileModel? profile;
  bool loading = true;
  bool updateaddress = false;

  Future<void> getprofile(String id) async {
    repo.getProfile(id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        try {
          profile = ProfileModel.fromJson(data);
        } catch (e) {
          toastShow(data["message"].toString(), Colors.red);
        }
      } else {
        toastShow(data["message"].toString(), Colors.red);
        print("Error");
      }
      loading = false;
      notifyListeners();
    });
  }

  Future<void> Updateprofile(Map<String, String> body, String id) async {
    repo.updateprofile(body, id).then((value) {
      print("value" + value.body.toString());
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
      } else {
        toastShow(data["message"].toString(), Colors.red);
        print("Error");
      }
      updateaddress = true;
      notifyListeners();
    });
  }
}
