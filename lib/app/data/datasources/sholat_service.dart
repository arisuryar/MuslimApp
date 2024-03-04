import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_app/app/data/models/sholat.dart';
import 'package:muslim_app/app/presentation/detail_hadits/detail_hadits.dart';

class SholatService {
  Future<SholatModel?> fetchSurah(String city, String country) async {
    String url = 'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=20';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = (jsonDecode(response.body) as Map<String, dynamic>)['data']['timings'];
        return SholatModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
