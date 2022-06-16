import 'package:flutter/material.dart';

class GifCard extends StatelessWidget {
  final String picture;

  const GifCard({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(picture),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
