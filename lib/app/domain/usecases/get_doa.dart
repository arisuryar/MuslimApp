import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../../presentation/detail_hadits/detail_hadits.dart';
import '../entities/doa.dart';
import '../repositories/doa_repository.dart';

class GetAllDoa {
  final DoaRepository doaRepository = Get.find();

  Future<Either<Failure, List<Doa>>> execute(String source) {
    return doaRepository.getAllDoa(source);
  }
}
