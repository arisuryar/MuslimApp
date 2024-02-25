import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_hadits.dart';
import 'package:muslim_app/app/data/models/hadits.dart';
import 'package:muslim_app/app/data/services/hadits_service.dart';

class DetailHaditsController extends GetxController {
  HaditsModel arguments = Get.arguments;
  final haditsService = Get.put(HaditsService());

  final _isSelected = 0.obs;
  int get isSelected => _isSelected.value;
  set isSelected(int n) => _isSelected.value = n;

  final startIndexHadits = 1.obs;

  final endIndexHadits = 300.obs;

  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  final _allHadits = DetailHaditsModel().obs;
  DetailHaditsModel get allHadits => _allHadits.value;

  getHadits() async {
    status = 'loading';
    final data = await haditsService.getDetailHadits(arguments.slug!, isSelected + 1);
    if (data == null) {
      status = 'error';
      return;
    }
    status = 'success';
    _allHadits.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getHadits();
  }
}
