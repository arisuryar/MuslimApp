import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../common/failure.dart';
import '../entities/detail_surah.dart';
import '../repositories/surah_repository.dart';

class GetDetailSurah {
  final SurahRepository surahRepository = Get.find();

  Future<Either<Failure, DetailSurah>> execute(String idSurah) {
    return surahRepository.getDetailSurah(idSurah);
  }
}
