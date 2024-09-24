import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_New_Book_use_case.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit({required this.fetchNewBookUseCase}) : super(NewsetBooksInitial());

  final FetchNewBookUseCase fetchNewBookUseCase;

  Future<void> fetchFutureBooks() async {
    emit(NewsetBooksLoading());
    var result = await fetchNewBookUseCase.call();
    result.fold((failure) {
      emit(NewsetBooksFailure(errorMessage: failure.message));
    }, (List<BookEntity> books) {
      emit(NewsetBooksSuccess(books: books));
    });
  }
}
