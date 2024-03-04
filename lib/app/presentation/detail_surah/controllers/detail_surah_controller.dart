import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../domain/entities/detail_surah.dart';
import '../../../domain/usecases/get_detail_surah.dart';

class DetailSurahController extends GetxController {
  final GetDetailSurah _getDetailSurah;

  DetailSurahController(this._getDetailSurah);

  // Arguments dari SurahView
  final arguments = Get.arguments;

  // Deklarasi Variable
  Rx<RequestState> detailSurahState = Rx<RequestState>(RequestState.initial);

  final _detailSurah = const DetailSurah().obs;
  DetailSurah get detailSurah => _detailSurah.value;

  // Get DetailSurah From surahService
  final _message = ''.obs;
  String get message => _message.value;
  set message(String n) => message = n;

  // call data usecase
  getDetailSurah() async {
    detailSurahState.value = RequestState.loading;
    final result = await _getDetailSurah.execute(arguments['id']);

    result.fold(
      (failure) {
        detailSurahState.value = RequestState.error;
        message = failure.message;
      },
      (data) {
        detailSurahState.value = RequestState.success;
        _detailSurah.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getDetailSurah();
  }
}
