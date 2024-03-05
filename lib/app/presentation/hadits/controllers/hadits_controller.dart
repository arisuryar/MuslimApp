import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../domain/entities/hadits.dart';
import '../../../domain/usecases/get_hadits.dart';

class HaditsController extends GetxController {
  final GetAllHadits _getAllHadits;

  HaditsController(this._getAllHadits);

  Rx<RequestState> haditsState = Rx<RequestState>(RequestState.initial);

  final _allHadits = <Hadits>[].obs;
  List<Hadits> get allHadits => _allHadits;

  final _message = ''.obs;
  String get message => _message.value;
  set message(String n) => message = n;

  getHadits() async {
    haditsState.value = RequestState.loading;
    final result = await _getAllHadits.execute();
    result.fold((failure) {
      haditsState.value = RequestState.error;
      message = failure.message;
    }, (data) {
      haditsState.value = RequestState.success;
      _allHadits.value = data;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getHadits();
  }
}
