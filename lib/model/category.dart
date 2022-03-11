import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onmarcy/model/users.dart';
import 'package:onmarcy/util/global.dart';

class Category {
  final String code;
  final String name;

  Category.fromJson(Map<String, dynamic> json) :
    code = json["code"],
    name = json["name"];

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code' : code,
    'name'  : name,
  };

  static Future<Map<String, dynamic>> select({required BuildContext context, bool showLoading = true}) async {
    Users user = Users.fromJson(jsonDecode(Global.getShared(key: Prefs.PREFS_USER)));
    Map _parameter = {
      "hash": user.hash
    }; 

    final response = await Global.postTimeout(
      context: context,
      url: "v1/category/select",
      data: _parameter,
      withLoading: showLoading,
      timeout: const Duration(seconds: 60)
    );

    return response;
  }
}
