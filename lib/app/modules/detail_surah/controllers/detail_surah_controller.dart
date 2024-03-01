import 'package:get/get.dart';
import 'package:muslim_app/app/common/state_enum.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class DetailSurahController extends GetxController {
  // Find surahService
  final _surahService = Get.find<SurahService>();

  // Arguments dari SurahView
  final arguments = Get.arguments;

  // Deklarasi Variable
  Rx<RequestState> detailSurahState = Rx<RequestState>(RequestState.initial);

  final _detailSurah = DetailSurahModel().obs;
  DetailSurahModel get detailSurah => _detailSurah.value;

  // Get DetailSurah From surahService
  getDetailSurah() async {
    detailSurahState.value = RequestState.loading;
    final data = await _surahService.fetchDetailSurah(arguments['id']);
    if (data == null) {
      detailSurahState.value = RequestState.error;
      return;
    }

    detailSurahState.value = RequestState.success;
    _detailSurah.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getDetailSurah();
  }
}
