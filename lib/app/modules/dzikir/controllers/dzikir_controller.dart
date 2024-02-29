import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/dzikir.dart';
import 'package:muslim_app/app/data/services/dzikir_sevice.dart';

class DzikirController extends GetxController {
  final dzikirService = Get.put(DzikirService());

  // Status atau Kondisi
  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

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
    status = 'loading';
    final data = await dzikirService.fetchDzikir(_type.value);
    if (data == null) {
      status = 'error';
      return;
    }
    status = 'success';
    _dzikir.value = data;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDzikir();
  }
}
