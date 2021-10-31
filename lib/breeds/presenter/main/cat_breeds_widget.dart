import 'package:cached_network_image/cached_network_image.dart';
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
          crossAxisCount: 2,
          children: List.generate(_viewModel.catList.length, (index) {
            var cat = _viewModel.catList[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: CachedNetworkImage(
                        imageUrl: cat.image.url,
                      ),
                  ),
                  Text(
                    cat.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
