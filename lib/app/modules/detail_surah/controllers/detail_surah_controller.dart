import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class DetailSurahController extends GetxController {
  // Find surahService
  final surahService = Get.find<SurahService>();

  // Arguments dari SurahView
  final arguments = Get.arguments;

  // Deklarasi Variable
  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  final _detailSurah = DetailSurahModel().obs;
  DetailSurahModel get detailSurah => _detailSurah.value;

  // Get DetailSurah From surahService
  getDetailSurah() async {
    status = 'loading';
    final data = await surahService.fetchDetailSurah(arguments['id']);
    if (data == null) {
      status = 'error';
      return;
    }

    status = 'success';
    _detailSurah.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getDetailSurah();
  }
}
