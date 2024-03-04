import 'package:dartz/dartz.dart';
import '../../common/failure.dart';
import '../entities/hadits.dart';
import '../repositories/hadits_repository.dart';
import '../../presentation/hadits/hadits.dart';

class GetAllHadits {
  final HaditsRepository haditsRepository = Get.find();

  Future<Either<Failure, List<Hadits>>> execute() {
    return haditsRepository.getAllHadits();
  }
}
