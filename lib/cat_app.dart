import 'package:flutter/material.dart';

import 'breeds/presenter/main/cat_breeds_widget.dart';

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatApp',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const CatBreedsScreen(title: 'Cat Breeds'),
    );
  }
}