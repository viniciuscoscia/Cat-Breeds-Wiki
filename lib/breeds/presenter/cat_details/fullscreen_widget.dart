import 'package:carousel_slider/carousel_slider.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:flutter/material.dart';

class FullScreenWidget extends StatelessWidget {
  final Cat cat;

  const FullScreenWidget(this.cat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: CarouselSlider(
              items: cat.imageUrls
                  .map((image) => _FullScreenCarouselImage(cat: cat, image: image))
                  .toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.85,
                initialPage: cat.currentImageIndex,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  cat.currentImageIndex = index;
                },
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
    );
  }
}

class _FullScreenCarouselImage extends StatelessWidget {
  const _FullScreenCarouselImage({
    Key? key,
    required this.cat,
    required this.image,
  }) : super(key: key);

  final String image;
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
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
                    value: loadingProgress.expectedTotalBytes !=
                            null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.scaleDown,
            ),
          ),
        );
  }
}
