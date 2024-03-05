import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../entities/doa.dart';

abstract class DoaRepository {
  Future<Either<Failure, List<Doa>>> getAllDoa(String source);
}
