import 'package:get/get.dart';
import 'package:muslim_app/app/common/state_enum.dart';
import 'package:muslim_app/app/data/models/detail_hadits.dart';
import 'package:muslim_app/app/data/models/hadits.dart';
import 'package:muslim_app/app/data/services/hadits_service.dart';

class DetailHaditsController extends GetxController {
  HaditsModel arguments = Get.arguments;
  final _haditsService = Get.find<HaditsService>();

  final _isSelected = 0.obs;
  int get isSelected => _isSelected.value;
  set isSelected(int n) => _isSelected.value = n;

  final startIndexHadits = 1.obs;

  final endIndexHadits = 300.obs;

  Rx<RequestState> detailHaditsState = Rx<RequestState>(RequestState.initial);

  final _allHadits = DetailHaditsModel().obs;
  DetailHaditsModel get allHadits => _allHadits.value;

  getHadits() async {
    detailHaditsState.value = RequestState.loading;
    final data = await _haditsService.getDetailHadits(arguments.slug!, isSelected + 1);
    if (data == null) {
      detailHaditsState.value = RequestState.error;
      return;
    }
    detailHaditsState.value = RequestState.success;
    _allHadits.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getHadits();
  }
}
