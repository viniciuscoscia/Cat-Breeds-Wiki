import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({Key? key, required this.rating}) : super(key: key);
  final int rating;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: generateStars(rating),),
    );
  }

  List<Widget> generateStars(int rating) {
    const double widgetSize = 15.0;
    var widgets = <Widget>[];
    for(int i = 0; i < 5; i++) {
      if (i < rating) {
        widgets.add(const Icon(Icons.star, size: widgetSize,));
      } else {
        widgets.add(const Icon(Icons.star_border, size: widgetSize,));
      }
    }
    return widgets;
  }
}
