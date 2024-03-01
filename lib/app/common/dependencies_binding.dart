import 'package:get/get.dart';
import 'package:muslim_app/app/data/services/doa_service.dart';
import 'package:muslim_app/app/data/services/dzikir_sevice.dart';
import 'package:muslim_app/app/data/services/hadits_service.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class DependenciesBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Services
    Get.lazyPut(() => SurahService());
    Get.lazyPut(() => DoaService());
    Get.lazyPut(() => HaditsService());
    Get.lazyPut(() => DzikirService());
  }
}
