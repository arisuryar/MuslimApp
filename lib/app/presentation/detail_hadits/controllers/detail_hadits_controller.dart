import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../domain/entities/detail_hadits.dart';

import '../../../domain/usecases/get_detail_hadits.dart';

class DetailHaditsController extends GetxController {
  final GetDetailHadits _getDetailSurah;

  DetailHaditsController(this._getDetailSurah);

  final arguments = Get.arguments;

  final _isSelected = 0.obs;
  int get isSelected => _isSelected.value;
  set isSelected(int n) => _isSelected.value = n;

  final startIndexHadits = 1.obs;
  final endIndexHadits = 300.obs;

  Rx<RequestState> detailHaditsState = Rx<RequestState>(RequestState.initial);

  final _detailHadits = const DetailHadits().obs;
  DetailHadits get detailHadits => _detailHadits.value;

  final _message = ''.obs;
  String get message => _message.value;
  set message(String n) => message = n;

  getHadits() async {
    detailHaditsState.value = RequestState.loading;
    final result = await _getDetailSurah.execute(arguments.slug, isSelected + 1);

    result.fold(
      (failure) {
        detailHaditsState.value = RequestState.error;
        message = failure.message;
      },
      (data) {
        detailHaditsState.value = RequestState.success;
        _detailHadits.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getHadits();
  }
}
