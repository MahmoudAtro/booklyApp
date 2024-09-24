import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewBookUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchNewBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([void params]) {
    return homeRepo.fetchFutureNewBooks();
  }
}
