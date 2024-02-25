import 'package:get/get.dart';

import '../controllers/detail_hadits_controller.dart';

class DetailHaditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHaditsController>(
      () => DetailHaditsController(),
    );
  }
}
