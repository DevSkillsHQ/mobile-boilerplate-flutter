import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer(
      {Key? key, this.imagePath, required this.width, required this.height})
      : super(key: key);

  String? imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: imagePath != ''
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagePath!),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          : Shimmer.fromColors(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
              baseColor: Colors.grey,
              highlightColor: Colors.white,
            ),
    );
  }
}
