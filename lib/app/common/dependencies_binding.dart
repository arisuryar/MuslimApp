import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/datasources/location_service.dart';
import '../data/datasources/remote_data_source/doa_data_source.dart';
import '../data/datasources/remote_data_source/dzikir_data_source.dart';
import '../data/datasources/remote_data_source/hadits_data_source.dart';
import '../data/datasources/remote_data_source/surah_data_source.dart';
import '../data/datasources/sholat_service.dart';
import '../data/repositories/doa_repository_impl.dart';
import '../data/repositories/dzikir_repository_impl.dart';
import '../data/repositories/hadits_repository_impl.dart';
import '../data/repositories/surah_repository_impl.dart';
import '../domain/repositories/doa_repository.dart';
import '../domain/repositories/dzikir_repository.dart';
import '../domain/repositories/hadits_repository.dart';
import '../domain/repositories/surah_repository.dart';
import '../domain/usecases/get_doa.dart';
import '../domain/usecases/get_dzikir.dart';
import '../domain/usecases/get_hadits.dart';
import '../domain/usecases/get_surah.dart';

class DependenciesBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Services
    Get.lazyPut(() => SholatService());
    Get.lazyPut(() => LocationService());

    // data source
    Get.lazyPut(() => SurahDataSourceImpl(client: Get.find<http.Client>()));
    Get.lazyPut(() => HaditsDataSourceImpl(client: Get.find<http.Client>()));
    Get.lazyPut(() => DoaDataSourceImpl(client: Get.find<http.Client>()));
    Get.lazyPut(() => DzikirDataSourceImpl(client: Get.find<http.Client>()));

    // repsitory
    Get.lazyPut<SurahRepository>(() => SurahRepositoryImpl(surahDataSource: Get.find<SurahDataSourceImpl>()));
    Get.lazyPut<HaditsRepository>(() => HaditsRepositoryImpl(haditsDataSource: Get.find<HaditsDataSourceImpl>()));
    Get.lazyPut<DoaRepository>(() => DoaRepositoryImpl(doaDataSource: Get.find<DoaDataSourceImpl>()));
    Get.lazyPut<DzikirRepository>(() => DzikirRepositoryImpl(dzikirDataSource: Get.find<DzikirDataSourceImpl>()));

    // usecase
    Get.lazyPut(() => GetAllSurah());
    Get.lazyPut(() => GetAllHadits());
    Get.lazyPut(() => GetAllDoa());
    Get.lazyPut(() => GetAllDzikir());
    // Get.lazyPut(() => GetDetailSurah()); ---> di bindings di DetailSurahBinding

    // external
    Get.lazyPut(() => http.Client());
  }
}
