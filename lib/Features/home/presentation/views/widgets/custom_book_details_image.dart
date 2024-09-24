import 'package:booklyapp/Features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .2),
        child: CustomListViewItem(image: image,));
  }
}
