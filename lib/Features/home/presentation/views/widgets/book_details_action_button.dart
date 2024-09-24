import 'package:booklyapp/core/widgets/buttoms.dart';
import 'package:flutter/material.dart';

class ButtomActions extends StatelessWidget {
  const ButtomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Buttoms(
          text: "19.99 €",
          backgroundColor: Colors.white,
          textcolor: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        )),
        Expanded(
            child: Buttoms(
          text: "Free Preview",
          backgroundColor: Color(0xffef8262),
          textcolor: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        )),
      ],
    );
  }
}
