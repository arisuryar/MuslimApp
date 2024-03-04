import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../common/exception.dart';
import '../../common/failure.dart';
import '../datasources/remote_data_source/hadits_data_source.dart';
import '../../domain/entities/detail_hadits.dart';
import '../../domain/entities/hadits.dart';
import '../../domain/repositories/hadits_repository.dart';

class HaditsRepositoryImpl implements HaditsRepository {
  final HaditsDataSource haditsDataSource;

  HaditsRepositoryImpl({required this.haditsDataSource});
  @override
  Future<Either<Failure, List<Hadits>>> getAllHadits() async {
    try {
      final result = await haditsDataSource.getAllHadits();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DetailHadits>> getDetailHadits(String slug, int page) async {
    try {
      final result = await haditsDataSource.getDetailHadits(slug, page);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
