import 'package:flutter/material.dart';
import 'package:onmarcy/util/global.dart';

class City {
  final String code;
  final String name;

  City.fromJson(Map<String, dynamic> json) :
    code = json["code"],
    name = json["name"];

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code' : code,
    'name'  : name,
  };

  String cityAsString() {
    return '#${this.code} ${this.name}';
  }

  static Future<Map<String, dynamic>> select({required BuildContext context, bool showLoading = true}) async {
    Map _parameter = {
      
    }; 

    final response = await Global.postTimeout(
      context: context,
      url: "v1/system/city",
      data: _parameter,
      withLoading: showLoading,
      timeout: const Duration(seconds: 60)
    );

    return response;
  }
}
