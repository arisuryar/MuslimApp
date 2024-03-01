import 'package:get/get.dart';
import 'package:muslim_app/app/common/state_enum.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class SurahController extends GetxController {
  final surahService = Get.find<SurahService>();

  final _allSurah = <SurahModel>[].obs;
  List<SurahModel> get allSurah => _allSurah;

  final _filteredAllSurah = <SurahModel>[].obs;
  List<SurahModel> get filteredAllSurah => _filteredAllSurah;

  Rx<RequestState> surahState = Rx<RequestState>(RequestState.initial);

  // GET Data From Services
  getSurah() async {
    surahState.value = RequestState.loading;
    final list = await surahService.fetchAllSurah();
    if (list == null) {
      surahState.value = RequestState.error;
      return;
    }
    surahState.value = RequestState.success;
    _allSurah.value = list;
    _filteredAllSurah.value = List.from(_allSurah);
  }

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

  // Getter to SurahView

  @override
  void onInit() {
    super.onInit();
    getSurah();
  }
}
