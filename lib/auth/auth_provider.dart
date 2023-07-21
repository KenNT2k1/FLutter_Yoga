import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import 'package:flutter_yoga_app/auth/auth_model.dart';
import 'package:flutter_yoga_app/const.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({required this.dio});
  final Dio dio;

  AuthModel? authModel;

  Future<void> register(
      {String segment = 'signUp',
      required String userName,
      required String password}) {
    return _auth(userName: userName, password: password);
  }

  Future<void> login(
      {String segment = 'signUp',
      required String userName,
      required String password}) {
    return _auth(
        segment: 'signInWithPassword', userName: userName, password: password);
  }

  Future<void> _auth(
      {String segment = 'signUp',
      required String userName,
      required String password}) async {

    final data = jsonEncode(
        {"email": userName, "password": password, "returnSecureToken": true});

    final response = await dio.post(
      '/accounts:$segment?key=$authKey',
      data: data,
    );
    if (response.statusCode == 200) {
      authModel = AuthModel.fromJson(response.data);
    } else {
      throw HttpException(response.data);
    }
  }
}
