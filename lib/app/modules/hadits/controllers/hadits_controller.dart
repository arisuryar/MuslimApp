import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/hadits.dart';
import 'package:muslim_app/app/data/services/hadits_service.dart';

class HaditsController extends GetxController {
  final haditsService = Get.put(HaditsService());

  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  final _allHadits = <HaditsModel>[].obs;
  List<HaditsModel> get allHadits => _allHadits;

  getHadits() async {
    status = 'loading';
    final list = await haditsService.fetchAllHadits();
    if (list == null) {
      status = 'error';
      return;
    }
    status = 'success';
    _allHadits.value = list;
  }

  @override
  void onInit() {
    super.onInit();
    getHadits();
  }
}
