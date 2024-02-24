import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

class SurahController extends GetxController {
  final surahService = Get.find<SurahService>();

  final _allSurah = <SurahModel>[].obs;
  List<SurahModel> get allSurah => _allSurah;

  final _filteredAllSurah = <SurahModel>[].obs;
  List<SurahModel> get filteredAllSurah => _filteredAllSurah;

  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  // GET Data From Services
  getSurah() async {
    status = 'loading';
    final list = await surahService.fetchAllSurah();
    if (list == null) {
      status = 'error';
      return;
    }
    status = 'success';
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
