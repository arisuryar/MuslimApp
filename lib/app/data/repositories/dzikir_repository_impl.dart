import 'dart:io';

import '../../common/exception.dart';
import '../../common/failure.dart';
import '../../domain/entities/dzikir.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/dzikir_repository.dart';

import '../datasources/remote_data_source/dzikir_data_source.dart';

class DzikirRepositoryImpl implements DzikirRepository {
  final DzikirDataSource dzikirDataSource;

  DzikirRepositoryImpl({required this.dzikirDataSource});
  @override
  Future<Either<Failure, List<Dzikir>>> getAllDzikir(String type) async {
    try {
      final result = await dzikirDataSource.getAllDzikir(type);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
