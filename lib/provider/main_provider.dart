import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:user_test/api/dio_client.dart';
import 'package:user_test/model/user_info_model.dart';

class UserProvider extends ChangeNotifier {
  UserData? userAllData;

  Future<void> fetchUserData(context) async {
    final _dioClient = DioClient();

    try {
      final response = await _dioClient.getUserData();
      if (response != null) {
        userAllData = response;
      }
    } catch (e, stackTrace) {
      log("here: $e", stackTrace: stackTrace);
    }

    notifyListeners();
  }
}
