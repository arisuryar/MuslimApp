import 'package:get/get.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/doa.dart';
import '../../../domain/usecases/get_doa.dart';

class DoaController extends GetxController {
  final GetAllDoa _getAllDoa;

  DoaController(this._getAllDoa);

  final _source = 'quran'.obs;
  set source(String n) => _source.value = n;
  String get source => _source.value;

  final _message = ''.obs;
  String get message => _message.value;
  set message(String n) => message = n;

  Rx<RequestState> doaState = Rx<RequestState>(RequestState.initial);

  final _doa = <Doa>[].obs;
  List<Doa> get doa => _doa;

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
    final result = await _getAllDoa.execute(_source.value);

    result.fold((failure) {
      doaState.value = RequestState.error;
      message = failure.message;
    }, (data) {
      doaState.value = RequestState.success;
      _doa.value = data;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getDoa();
  }
}
