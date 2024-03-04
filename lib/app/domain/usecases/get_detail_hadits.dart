import 'package:dartz/dartz.dart';
import '../../common/failure.dart';
import '../entities/detail_hadits.dart';
import '../repositories/hadits_repository.dart';
import '../../presentation/hadits/hadits.dart';

class GetDetailHadits {
  final HaditsRepository haditsRepository = Get.find();

  Future<Either<Failure, DetailHadits>> execute(String slug, int page) {
    return haditsRepository.getDetailHadits(slug, page);
  }
}
