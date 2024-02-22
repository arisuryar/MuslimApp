import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class DetailSurahController extends GetxController {
  // Find surahService
  final surahService = Get.find<SurahService>();

  // Arguments dari SurahView
  final arguments = Get.arguments;

  // Deklarasi Variable
  final _isLoading = false.obs;
  final _detailSurah = DetailSurahModel().obs;

  // Get DetailSurah From surahService
  getDetailSurah() async {
    _isLoading.value = true;
    _detailSurah.value = await surahService.fetchDetailSurah(arguments['id']);
    _isLoading.value = false;
  }

  // Getter untuk DetailSurahView
  bool get isLoading => _isLoading.value;
  DetailSurahModel get detailSurah => _detailSurah.value;

  @override
  void onInit() {
    super.onInit();
    getDetailSurah();
  }
}
