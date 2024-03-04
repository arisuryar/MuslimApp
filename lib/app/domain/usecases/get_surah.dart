import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../common/failure.dart';
import '../entities/surah.dart';
import '../repositories/surah_repository.dart';

class GetAllSurah {
  final SurahRepository surahRepository = Get.find();

  Future<Either<Failure, List<Surah>>> execute() {
    return surahRepository.getAllSurah();
  }
}
