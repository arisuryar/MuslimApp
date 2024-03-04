import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../data/models/dzikir.dart';
import '../../../data/datasources/dzikir_sevice.dart';

class DzikirController extends GetxController {
  final _dzikirService = Get.find<DzikirService>();

  // Status atau Kondisi
  Rx<RequestState> dzikirState = Rx<RequestState>(RequestState.initial);

  // Type Dzikir ada Pagi, Sore dan Solat
  final _type = 'pagi'.obs;
  String get type => _type.value;
  set type(String n) => _type.value = n;

  // List data Dzikir
  final _dzikir = <DzikirModel>[].obs;
  List<DzikirModel> get dzikir => _dzikir;

  // List type untuk UI
  List<String> listType = [
    'pagi',
    'sore',
    'solat',
  ];

  getDzikir() async {
    dzikirState.value = RequestState.loading;
    final data = await _dzikirService.fetchDzikir(_type.value);
    if (data == null) {
      dzikirState.value = RequestState.error;
      return;
    }
    dzikirState.value = RequestState.success;
    _dzikir.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getDzikir();
  }
}
