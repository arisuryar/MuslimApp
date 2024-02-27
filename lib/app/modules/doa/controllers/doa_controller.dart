import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/doa.dart';
import 'package:muslim_app/app/data/services/doa_service.dart';

class DoaController extends GetxController {
  final doaService = Get.put(DoaService());

  final _source = 'quran'.obs;
  set source(String n) => _source.value = n;
  String get source => _source.value;

  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  final _doa = <DoaModel>[].obs;
  List<DoaModel> get doa => _doa;

  List<String> listSource = [
    'quran',
    'hadits',
    'pilihan',
    'harian',
    'ibadah',
    'haji',
    'lainnya',
  ];

  getDoa() async {
    status = 'loading';
    final data = await doaService.fetchDoa(_source.value);
    if (data == null) {
      status = 'error';
      return;
    }
    status = 'success';
    _doa.value = data;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDoa();
  }
}
