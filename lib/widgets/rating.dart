
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const new({super.key, required this.rate});

  final double? rate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      ignoreGestures: true,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) {},
    );
  }
}