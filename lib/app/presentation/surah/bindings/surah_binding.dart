import 'package:get/get.dart';
import '../../../domain/usecases/get_surah.dart';

import '../controllers/surah_controller.dart';

class SurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurahController>(
      () => SurahController(Get.find<GetAllSurah>()),
    );
  }
}
