import 'package:get/get.dart';
import '../../../domain/usecases/get_detail_surah.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetDetailSurah());
    Get.lazyPut<DetailSurahController>(
      () => DetailSurahController(Get.find<GetDetailSurah>()),
    );
  }
}
