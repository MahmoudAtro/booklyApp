import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFuturedBookUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFuturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int params = 0]) {
    return homeRepo.fetchFutureBooks(
      pageNumber: params
    );
  }
}
