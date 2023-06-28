import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  DetailScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InteractiveViewer(

        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(

              imageUrl,
              fit: BoxFit.cover,
              width:400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}