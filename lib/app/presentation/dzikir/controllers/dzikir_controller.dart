import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../domain/entities/dzikir.dart';
import '../../../domain/usecases/get_dzikir.dart';

class DzikirController extends GetxController {
  final GetAllDzikir _getAllDzikir;

  DzikirController(this._getAllDzikir);
  // Status atau Kondisi
  Rx<RequestState> dzikirState = Rx<RequestState>(RequestState.initial);

  // Type Dzikir ada Pagi, Sore dan Solat
  final _type = 'pagi'.obs;
  String get type => _type.value;
  set type(String n) => _type.value = n;

  final _message = ''.obs;
  String get message => _message.value;
  set message(String n) => message = n;

  // List data Dzikir
  final _dzikir = <Dzikir>[].obs;
  List<Dzikir> get dzikir => _dzikir;

  // List type untuk UI
  List<String> listType = [
    'pagi',
    'sore',
    'solat',
  ];

  getDzikir() async {
    dzikirState.value = RequestState.loading;
    final result = await _getAllDzikir.execute(type);

    result.fold((failure) {
      dzikirState.value = RequestState.error;
      message = failure.message;
    }, (data) {
      dzikirState.value = RequestState.success;
      _dzikir.value = data;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getDzikir();
  }
}
