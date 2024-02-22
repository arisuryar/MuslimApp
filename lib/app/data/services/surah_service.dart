import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/models/surah.dart';

class SurahService extends GetxController {
  // Get All Surah From API
  Future<List<SurahModel>> fetchAllSurah() async {
    try {
      final response = await http.get(Uri.parse('https://api.quran.gading.dev/surah'));
      if (response.statusCode == 200) {
        List surah = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
        return surah.map((e) => SurahModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Get Detail Surah From API

  Future<DetailSurahModel> fetchDetailSurah(String idSurah) async {
    try {
      final response = await http.get(Uri.parse('https://api.quran.gading.dev/surah/$idSurah'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
        return DetailSurahModel.fromJson(data);
      } else {
        throw Exception('No Data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
