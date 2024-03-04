import 'package:dartz/dartz.dart';
import '../../common/failure.dart';
import '../entities/detail_surah.dart';
import '../entities/surah.dart';

abstract class SurahRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
  Future<Either<Failure, DetailSurah>> getDetailSurah(String idSurah);
}
