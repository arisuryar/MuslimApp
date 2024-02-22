import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class SurahController extends GetxController {
  final surahService = Get.find<SurahService>();

  final _allSurah = <SurahModel>[].obs;
  final _filteredAllSurah = <SurahModel>[].obs;
  final _isLoading = false.obs;

  // Filtering / Search Surah
  void filteredSurah(String query) {
    _filteredAllSurah.clear();
    if (query.isEmpty) {
      for (var element in _allSurah) {
        _filteredAllSurah.add(element);
      }
    } else {
      for (var element in _allSurah) {
        if (element.name!.transliteration!.id!.toLowerCase().contains(query.toLowerCase())) {
          _filteredAllSurah.add(element);
        }
      }
    }
  }

  // GET Data From Services
  getSurah() async {
    _isLoading.value = true;
    _allSurah.value = await surahService.fetchAllSurah();
    _filteredAllSurah.value = List.from(_allSurah);
    _isLoading.value = false;
  }

  // Getter to SurahView
  bool get isLoading => _isLoading.value;
  List<SurahModel> get allSurah => _allSurah;
  List<SurahModel> get filteredAllSurah => _filteredAllSurah;

  @override
  void onInit() {
    super.onInit();
    getSurah();
  }
}
