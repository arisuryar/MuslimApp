import 'dart:io';

import '../../common/exception.dart';
import '../../common/failure.dart';
import '../../domain/entities/doa.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/doa_repository.dart';
import '../datasources/remote_data_source/doa_data_source.dart';

class DoaRepositoryImpl implements DoaRepository {
  final DoaDataSource doaDataSource;

  DoaRepositoryImpl({required this.doaDataSource});

  @override
  Future<Either<Failure, List<Doa>>> getAllDoa(String source) async {
    try {
      final result = await doaDataSource.getAllDoa(source);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
