import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String boxname) {
  var box = Hive.box<BookEntity>(boxname);
  box.addAll(books);
}
