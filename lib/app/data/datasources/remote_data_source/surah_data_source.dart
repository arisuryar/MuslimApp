import 'dart:convert';

import '../../../common/exception.dart';
import 'package:http/http.dart' as http;
import '../../models/detail_surah_model.dart';
import '../../models/surah_model.dart';

abstract class SurahDataSource {
  Future<List<SurahModel>> getAllSurah();
  Future<DetailSurahModel> getDetailSurah(String idSurah);
}

class SurahDataSourceImpl implements SurahDataSource {
  final http.Client client;

  SurahDataSourceImpl({required this.client});

  @override
  Future<List<SurahModel>> getAllSurah() async {
    final response = await client.get(Uri.parse('https://api.quran.gading.dev/surah'));

    if (response.statusCode == 200) {
      List surah = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
      return surah.map((e) => SurahModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailSurahModel> getDetailSurah(String idSurah) async {
    final response = await client.get(Uri.parse('https://api.quran.gading.dev/surah/$idSurah'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
      return DetailSurahModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
