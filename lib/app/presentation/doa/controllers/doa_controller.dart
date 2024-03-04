import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../data/models/doa.dart';
import '../../../data/datasources/doa_service.dart';

class DoaController extends GetxController {
  final _doaService = Get.find<DoaService>();

  final _source = 'quran'.obs;
  set source(String n) => _source.value = n;
  String get source => _source.value;

  Rx<RequestState> doaState = Rx<RequestState>(RequestState.initial);

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
    doaState.value = RequestState.loading;
    final data = await _doaService.fetchDoa(_source.value);
    if (data == null) {
      doaState.value = RequestState.error;
      return;
    }
    doaState.value = RequestState.success;
    _doa.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getDoa();
  }
}
