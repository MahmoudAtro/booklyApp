import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/manager/Fetured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureListViewItem extends StatefulWidget {
  const FeatureListViewItem({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeatureListViewItem> createState() => _FeatureListViewItemState();
}

class _FeatureListViewItemState extends State<FeatureListViewItem> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListiner);
    super.initState();
  }

  void _scrollListiner() async {
    var currentPosition = _scrollController.position.pixels;
    var maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFutureBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kBookDetails, extra: widget.books[index]);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomListViewItem(
                    image: widget.books[index].image ?? '',
                  )),
            );
          }),
    );
  }
}
