import 'package:dartz/dartz.dart';
import '../../common/failure.dart';
import '../entities/detail_hadits.dart';
import '../entities/hadits.dart';

abstract class HaditsRepository {
  Future<Either<Failure, List<Hadits>>> getAllHadits();
  Future<Either<Failure, DetailHadits>> getDetailHadits(String slug, int page);
}
