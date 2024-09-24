import 'package:booklyapp/Features/home/presentation/views/widgets/best_seller_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerViewList extends StatelessWidget {
  const BestSellerViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: BestSelllerViewItem());
          },
        );
  }
}
