import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/datasources/doa_service.dart';
import '../data/datasources/dzikir_sevice.dart';
import '../data/datasources/location_service.dart';
import '../data/datasources/remote_data_source/hadits_data_source.dart';
import '../data/datasources/remote_data_source/surah_data_source.dart';
import '../data/datasources/sholat_service.dart';
import '../data/repositories/hadits_repository_impl.dart';
import '../data/repositories/surah_repository_impl.dart';
import '../domain/repositories/hadits_repository.dart';
import '../domain/repositories/surah_repository.dart';
import '../domain/usecases/get_hadits.dart';
import '../domain/usecases/get_surah.dart';

class DependenciesBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Services
    Get.lazyPut(() => DoaService());
    Get.lazyPut(() => DzikirService());
    Get.lazyPut(() => SholatService());
    Get.lazyPut(() => LocationService());

    // data source
    Get.lazyPut(() => SurahDataSourceImpl(client: Get.find<http.Client>()));
    Get.lazyPut(() => HaditsDataSourceImpl(client: Get.find<http.Client>()));

    // repsitory
    Get.lazyPut<SurahRepository>(() => SurahRepositoryImpl(surahDataSource: Get.find<SurahDataSourceImpl>()));
    Get.lazyPut<HaditsRepository>(() => HaditsRepositoryImpl(haditsDataSource: Get.find<HaditsDataSourceImpl>()));

    // usecase
    Get.lazyPut(() => GetAllSurah());
    Get.lazyPut(() => GetAllHadits());
    // Get.lazyPut(() => GetDetailSurah()); ---> di bindings di DetailSurahBinding

    // external
    Get.lazyPut(() => http.Client());
  }
}
