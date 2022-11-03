import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:user_test/api/dio_client.dart';
import 'package:user_test/model/user_info_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserData>? userAllData;

  Future fetchUserData(context) async {
    final _dioClient = DioClient();

    try {
      final response = await _dioClient.getUserData();
      if (response != null) {
        userAllData = response
          ..sort((a, b) {
            return a.name!.compareTo(b.name!);
          });
      }
    } catch (e, stackTrace) {
      log("here: $e", stackTrace: stackTrace);
    }

    notifyListeners();
  }
}
