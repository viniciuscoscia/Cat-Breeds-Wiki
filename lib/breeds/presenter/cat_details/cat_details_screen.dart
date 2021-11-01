import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:flutter/material.dart';

class CatDetailsScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailsScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cat.name),
        ),
        body: ListView(
          children: [
            Container(
                constraints: const BoxConstraints(maxHeight: 250),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: CachedNetworkImage(
                    imageUrl: cat.image.url,
                  ),
                ))
          ],
        ));
  }
}
