import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFutureBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchFutureNewBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImp({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<List<BookEntity>> fetchFutureBooks({int pageNumber = 0}) async {
    var data = await _apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = addBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFutureNewBooks() async {
    var data = await _apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = addBooksList(data);
    saveBooksData(books, kNewsBooks);
    return books;
  }

  List<BookEntity> addBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
