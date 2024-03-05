import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../entities/dzikir.dart';

abstract class DzikirRepository {
  Future<Either<Failure, List<Dzikir>>> getAllDzikir(String type);
}
