import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/best_seller_view_item.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_details_action_button.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_details_image.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  const CustomBookDetailsAppbar(),
                  CustomBookDetailsImage(image: book.image.toString(),),
                  const SizedBox(
                    height: 43,
                  ),
                  Text(
                    book.title,
                    style: Styles.textstyle30,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Opacity(
                    opacity: .7,
                    child: Text(
                      book.authorName ?? 'No author',
                      style: Styles.textstyle16
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const BookRate(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ButtomActions()),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "you can also like",
                        style: Styles.textstyle14star.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  const BookDetailsListView(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
