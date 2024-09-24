import 'package:booklyapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, params> {
  Future<Either<Failure, Type>> call([params params]);
}
