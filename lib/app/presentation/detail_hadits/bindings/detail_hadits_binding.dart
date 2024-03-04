import 'package:get/get.dart';
import '../../../domain/usecases/get_detail_hadits.dart';

import '../controllers/detail_hadits_controller.dart';

class DetailHaditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetDetailHadits());
    Get.lazyPut<DetailHaditsController>(
      () => DetailHaditsController(Get.find<GetDetailHadits>()),
    );
  }
}
