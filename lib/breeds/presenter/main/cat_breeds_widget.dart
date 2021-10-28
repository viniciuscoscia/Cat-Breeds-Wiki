import 'package:flutter/material.dart';

class CatBreedsPageWidget extends StatefulWidget {
  const CatBreedsPageWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CatBreedsPageWidget> createState() => _CatBreedsPageWidgetState();
}

class _CatBreedsPageWidgetState extends State<CatBreedsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Thiago viadão :D'),
      ),
    );
  }
}