import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/app/data/models/dzikir.dart';

class DzikirService extends GetxController {
  Future<List<DzikirModel>?> fetchDzikir(String type) async {
    String url = 'https://api.dikiotang.com/dzikir/$type';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
        return data.map((e) => DzikirModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
