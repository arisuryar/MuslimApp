import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../domain/entities/surah.dart';
import '../../../domain/usecases/get_surah.dart';

class SurahController extends GetxController {
  final GetAllSurah _getAllSurah;

  SurahController(this._getAllSurah);

  final _data = <Surah>[].obs;
  List<Surah> get data => _data;

  final _filteredData = <Surah>[].obs;
  List<Surah> get filteredData => _filteredData;

  Rx<RequestState> surahState = Rx<RequestState>(RequestState.initial);

  final _message = ''.obs;
  String get message => _message.value;
  set message(String n) => message = n;

  // call data usecase
  getSurah() async {
    surahState.value = RequestState.loading;
    final result = await _getAllSurah.execute();

    result.fold(
      (failure) {
        surahState.value = RequestState.error;
        message = failure.message;
      },
      (data) {
        surahState.value = RequestState.success;
        _data.value = data;
        _filteredData.value = List.from(_data);
      },
    );
  }

  // Filtering / Search Surah
  void filteredSurah(String query) {
    _filteredData.clear();
    if (query.isEmpty) {
      for (var element in _data) {
        _filteredData.add(element);
      }
    } else {
      for (var element in _data) {
        if (element.name.transliteration.id.toLowerCase().contains(query.toLowerCase())) {
          filteredData.add(element);
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
