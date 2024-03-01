import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_app/app/data/models/detail_hadits.dart';
import 'package:muslim_app/app/data/models/hadits.dart';

class HaditsService {
  String baseUrl = 'https://hadis-api-id.vercel.app/hadith';

  // Get All Surah Hadits
  Future<List<HaditsModel>?> fetchAllHadits() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => HaditsModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<DetailHaditsModel?> getDetailHadits(String slug, int page) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$slug?page=$page&limit=300'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DetailHaditsModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
