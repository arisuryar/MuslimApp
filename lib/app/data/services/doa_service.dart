import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/app/data/models/doa.dart';

class DoaService extends GetxController {
  String url = 'https://api.dikiotang.com/doa';
  Future<List<DoaModel>?> fetchDoa(String source) async {
    try {
      final response = await http.get(Uri.parse('$url/$source'));

      if (response.statusCode == 200) {
        List data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
        return data.map((e) => DoaModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
