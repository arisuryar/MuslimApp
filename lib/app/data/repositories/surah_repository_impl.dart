import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../common/exception.dart';
import '../../common/failure.dart';
import '../datasources/remote_data_source/surah_data_source.dart';
import '../../domain/entities/detail_surah.dart';
import '../../domain/entities/surah.dart';
import '../../domain/repositories/surah_repository.dart';

class SurahRepositoryImpl implements SurahRepository {
  final SurahDataSource surahDataSource;

  SurahRepositoryImpl({required this.surahDataSource});
  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    try {
      final result = await surahDataSource.getAllSurah();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DetailSurah>> getDetailSurah(String idSurah) async {
    try {
      final result = await surahDataSource.getDetailSurah(idSurah);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
