import 'dart:convert';

import '../../../common/exception.dart';
import '../../models/detail_hadits_model.dart';
import '../../models/hadits_model.dart';
import 'package:http/http.dart' as http;

abstract class HaditsDataSource {
  Future<List<HaditsModel>> getAllHadits();
  Future<DetailHaditsModel> getDetailHadits(String slug, int page);
}

class HaditsDataSourceImpl implements HaditsDataSource {
  final http.Client client;

  HaditsDataSourceImpl({required this.client});
  @override
  Future<List<HaditsModel>> getAllHadits() async {
    final response = await client.get(Uri.parse('https://hadis-api-id.vercel.app/hadith'));

    if (response.statusCode == 200) {
      List hadits = jsonDecode(response.body);
      return hadits.map((e) => HaditsModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailHaditsModel> getDetailHadits(String slug, int page) async {
    final response = await client.get(Uri.parse('https://hadis-api-id.vercel.app/hadith/$slug?page=$page&limit=300'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return DetailHaditsModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
