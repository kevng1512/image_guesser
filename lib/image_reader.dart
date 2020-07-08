import 'package:flutter/material.dart';

class ImageReader extends StatelessWidget {
  final String imageName;

  const ImageReader({this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.white24,
          width: 3.5,
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: Image.asset(
          'assets/images/$imageName.jpg',
          height: 350,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}