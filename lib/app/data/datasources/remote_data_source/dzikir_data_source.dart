import 'dart:convert';

import '../../../common/exception.dart';
import '../../models/dzikir_model.dart';
import 'package:http/http.dart' as http;

abstract class DzikirDataSource {
  Future<List<DzikirModel>> getAllDzikir(String type);
}

class DzikirDataSourceImpl implements DzikirDataSource {
  final http.Client client;

  DzikirDataSourceImpl({required this.client});
  @override
  Future<List<DzikirModel>> getAllDzikir(String type) async {
    final response = await client.get(Uri.parse('https://api.dikiotang.com/dzikir/$type'));

    if (response.statusCode == 200) {
      List data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
      return data.map((e) => DzikirModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
