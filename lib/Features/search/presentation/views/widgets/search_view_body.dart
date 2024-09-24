import 'package:booklyapp/Features/home/presentation/views/widgets/best_seller_view_item.dart';
import 'package:booklyapp/Features/search/presentation/views/widgets/custom_search_textfeild.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextFeild(),
          SizedBox(
            height: 16,
          ),
          Text(
            "Search Results",
            style: Styles.textstyle16,
          ),
          SizedBox(
            height: 16,
          ),
          SearchListView(),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BestSelllerViewItem());
      },
    ));
  }
}
