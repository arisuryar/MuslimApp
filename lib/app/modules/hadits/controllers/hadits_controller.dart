import 'package:get/get.dart';
import 'package:muslim_app/app/common/state_enum.dart';
import 'package:muslim_app/app/data/models/hadits.dart';
import 'package:muslim_app/app/data/services/hadits_service.dart';

class HaditsController extends GetxController {
  final haditsService = Get.put(HaditsService());

  Rx<RequestState> haditsState = Rx<RequestState>(RequestState.initial);

  final _allHadits = <HaditsModel>[].obs;
  List<HaditsModel> get allHadits => _allHadits;

  getHadits() async {
    haditsState.value = RequestState.loading;
    final list = await haditsService.fetchAllHadits();
    if (list == null) {
      haditsState.value = RequestState.error;
      return;
    }
    haditsState.value = RequestState.success;
    _allHadits.value = list;
  }

  @override
  void onInit() {
    super.onInit();
    getHadits();
  }
}
