import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_Futured_Book_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.fetchFuturedBookUseCase})
      : super(FeaturedBooksInitial());
  final FetchFuturedBookUseCase fetchFuturedBookUseCase;
  Future<void> fetchFutureBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFuturedBookUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(errorMessage: failure.message));
      } else {
        emit(FeaturedBooksPaginationFailure(errorMessage: failure.message));
      }
    }, (List<BookEntity> books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
