import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/custom_widgets/rating_bar.dart';
import 'package:cats_database/helpers/utils.dart';
import 'package:flutter/material.dart';

import 'fullscreen_widget.dart';

class CatDetailsScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailsScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cat Breed Details'),
        ),
        body: SingleChildScrollView(
          child: _CatDetailsScreenBody(cat: cat),
        ));
  }
}

class _CatDetailsScreenBody extends StatelessWidget {
  final Cat cat;

  const _CatDetailsScreenBody({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageBorderRadius = 5.0;
    var imageHeight = 200.0;
    var headerHeight = 200.0;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.maxFinite,
              height: headerHeight,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 127, 127, 127),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 16, right: 16, bottom: 16),
                  child: Column(
                    children: [
                      _CatDetailH1Widget(
                        text: cat.name,
                      ),
                      _CatDescriptionWidget(cat: cat),
                      _CatTextProperty(
                          title: 'Alternative names: ', value: cat.altNames),
                      _CatTextProperty(title: 'Origin: ', value: cat.origin),
                      _CatTextProperty(
                          title: 'Weight: ', value: '${cat.weight.metric} kg'),
                      _CatTextProperty(
                          title: 'Temperament: ', value: cat.temperament),
                      _CatTextProperty(
                          title: 'Life Spam: ', value: '${cat.lifeSpan} years'),
                      _CatRating(title: 'Affection Level: ', rating: cat.affectionLevel),
                      _CatRating(title: 'Adaptability: ', rating: cat.adaptability),
                      _CatRating(title: 'Child Friendly: ', rating: cat.childFriendly),
                      _CatRating(title: 'Dog Friendly: ', rating: cat.dogFriendly),
                      _CatRating(title: 'Energy Level: ', rating: cat.energyLevel),
                      _CatRating(title: 'Grooming: ', rating: cat.grooming),
                      _CatRating(title: 'Health Issues: ', rating: cat.healthIssues),
                      _CatRating(title: 'Shedding Level: ', rating: cat.sheddingLevel),
                      _CatRating(title: 'Social Needs: ', rating: cat.socialNeeds),
                      _CatRating(title: 'Stranger Friendly: ', rating: cat.strangerFriendly),
                      _CatRating(title: 'Vocalisation: ', rating: cat.vocalisation),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: _CatDetailH1Widget(
                          text: 'More info: ',
                          fontSize: 16,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _LinkButtonWidget(
                              url: cat.wikipediaUrl,
                              text: 'Wikipedia',
                            ),
                            _LinkButtonWidget(
                              url: cat.vetstreetUrl,
                              text: 'Vet Street',
                            ),
                            _LinkButtonWidget(
                              url: cat.vcahospitalsUrl,
                              text: 'VCA Hospitals',
                            ),
                            _LinkButtonWidget(
                              url: cat.cfaUrl,
                              text: 'CFA',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 40, right: 40),
          child: Center(
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(imageBorderRadius),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FullScreenWidget(cat);
                    }));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(imageBorderRadius),
                    child: Hero(
                      tag: '${cat.id}${cat.currentImageIndex}',
                      child: Image.network(
                        cat.imageUrls[cat.currentImageIndex],
                        fit: BoxFit.cover,
                        height: imageHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _CatRating extends StatelessWidget {
  const _CatRating({
    Key? key,
    required this.title,
    required this.rating,
  }) : super(key: key);

  final String title;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold)), RatingBar(rating: rating)
        ],
      ),
    );
  }
}

class _CatTextProperty extends StatelessWidget {
  const _CatTextProperty({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Flexible(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: value),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkButtonWidget extends StatelessWidget {
  const _LinkButtonWidget({
    Key? key,
    required this.url,
    required this.text,
  }) : super(key: key);

  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: url.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: OutlinedButton(
          onPressed: () => launchURL(url),
          child: Text(text),
        ),
      ),
    );
  }
}

class _CatDescriptionWidget extends StatelessWidget {
  const _CatDescriptionWidget({
    Key? key,
    required this.cat,
  }) : super(key: key);

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        cat.description,
      ),
    );
  }
}

class _CatDetailH1Widget extends StatelessWidget {
  const _CatDetailH1Widget({Key? key, required this.text, this.fontSize = 20.0})
      : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: fontSize),
    );
  }
}
