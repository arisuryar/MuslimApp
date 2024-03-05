import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../../presentation/detail_hadits/detail_hadits.dart';
import '../entities/dzikir.dart';
import '../repositories/dzikir_repository.dart';

class GetAllDzikir {
  final DzikirRepository dzikirRepository = Get.find();

  Future<Either<Failure, List<Dzikir>>> execute(String type) {
    return dzikirRepository.getAllDzikir(type);
  }
}
