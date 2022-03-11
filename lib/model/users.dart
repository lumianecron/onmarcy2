import 'package:flutter/material.dart';
import 'package:onmarcy/util/global.dart';

class Users {
  final String hash;
  final String username;
  final String password;
  final String email;
  final String name;
  final String phone;
  final String cityCode;
  final String cityName;
  final String userType;
  final String refferal;
  final String photoUrl;

  Users.fromJson(Map<String, dynamic> json) :
    hash = json["hash"],
    username = json["username"],
    password = json["password"],
    email = json["email"],
    name = json["name"],
    phone = json["phone"],
    cityCode = json["city"],
    cityName = json["city_name"],
    userType = json["user_type"],
    refferal = json["refferal"],
    photoUrl = json["photo"];

  Map<String, dynamic> toJson() => <String, dynamic>{
    'hash' : hash,
    'username'  : username,
    'password' : password,
    'email'  : email,
    'name'  : name,
    'phone'  : phone,
    'city'  : cityCode,
    'city_name'  : cityName,
    'user_type'  : userType,
    'refferal'  : refferal,
    'photo'  : photoUrl,
  };

  static Future<Map<String, dynamic>> login({required BuildContext context, required String username, required String password, bool showLoading = true}) async {
    Map _parameter = {
      "username": username,
      "password": password
    }; 

    final response = await Global.postTimeout(
      context: context,
      url: "v1/login",
      data: _parameter,
      withLoading: showLoading,
      timeout: const Duration(seconds: 60)
    );

    return response;
  }

  static Future<Map<String, dynamic>> register({required BuildContext context, required String username, required String password, required String email, required String name, required String phone, required String cityCode, required String userType, required String refferal, bool showLoading = true}) async {
    Map _parameter = {
      "username": username,
      "password": password,
      "email": email,
      "name": name,
      "phone": phone,
      "city": cityCode,
      "user_type": userType,
      "refferal": refferal
    }; 

    final response = await Global.postTimeout(
      context: context,
      url: "v1/register",
      data: _parameter,
      withLoading: showLoading,
      timeout: const Duration(seconds: 60)
    );

    return response;
  }
}
