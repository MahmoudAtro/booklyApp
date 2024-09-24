import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/constant.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFutureBooks({int pageNumber = 0});
  List<BookEntity> fetchFutureNewBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFutureBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchFutureNewBooks() {
    var box = Hive.box<BookEntity>(kNewsBooks);

    return box.values.toList();
  }
}
