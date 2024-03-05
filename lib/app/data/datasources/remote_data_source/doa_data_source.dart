import 'dart:convert';

import '../../../common/exception.dart';
import '../../models/doa_model.dart';
import 'package:http/http.dart' as http;

abstract class DoaDataSource {
  Future<List<DoaModel>> getAllDoa(String source);
}

class DoaDataSourceImpl implements DoaDataSource {
  final http.Client client;

  DoaDataSourceImpl({required this.client});
  @override
  Future<List<DoaModel>> getAllDoa(String source) async {
    final response = await client.get(Uri.parse('https://api.dikiotang.com/doa/$source'));

    if (response.statusCode == 200) {
      List data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
      return data.map((e) => DoaModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
