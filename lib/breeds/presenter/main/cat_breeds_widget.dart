import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/presenter/cat_details/cat_details_screen.dart';
import 'package:cats_database/breeds/presenter/main/cat_breeds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CatBreedsScreen extends StatefulWidget {
  const CatBreedsScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CatBreedsScreen> createState() => _CatBreedsScreenState();
}

class _CatBreedsScreenState extends State<CatBreedsScreen> {
  final CatBreedsViewModel _viewModel = GetIt.I();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchCatBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => GridView.count(
          childAspectRatio: 1.2,
          crossAxisCount: 2,
          children: List.generate(_viewModel.catList.length, (index) {
            var cat = _viewModel.catList[index];
            var borderRadius = 5.0;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CatDetailsScreen(cat: cat)),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                elevation: 5.0,
                child: Stack(
                  children: [
                    _CatImageCarousel(cat: cat, borderRadius: borderRadius),
                    _CatNameTextWidget(cat: cat)
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _CatImageCarousel extends StatelessWidget {
  const _CatImageCarousel({
    Key? key,
    required this.cat,
    required this.borderRadius,
  }) : super(key: key);

  final Cat cat;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: cat.imageUrls
            .map((image) => ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Hero(
                    tag: '${cat.id}${cat.imageUrls.indexOf(image)}',
                    child: Image.network(
                      image,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 400,
          aspectRatio: 1 / 1,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            cat.currentImageIndex = index;
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}

class _CatNameTextWidget extends StatelessWidget {
  const _CatNameTextWidget({
    Key? key,
    required this.cat,
  }) : super(key: key);

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(210, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              cat.name,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
