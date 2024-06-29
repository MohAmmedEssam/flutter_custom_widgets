import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const ImageFromUrl({
    super.key,
    this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    Widget defaultPlaceholder = ColorFiltered(
      colorFilter: const ColorFilter.mode(Color(0xFFD8D8D8), BlendMode.srcIn),
      child: Image.asset(
        "assets/images/logo.png",
        height: height,
        width: width,
      ),
    );

    if ((imageUrl == null) || ((imageUrl ?? '').isEmpty)) {
      return SizedBox(
        width: width,
        height: height,
        child: defaultPlaceholder,
      );
    }

    return Image.network(
      imageUrl!,
      width: width,
      height: height,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // Display the image when loading is complete
        } else {
          return SizedBox(
            width: width,
            height: height,
            child:
                defaultPlaceholder, // Display placeholder while the image is loading
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return SizedBox(
          width: width,
          height: height,
          child: defaultPlaceholder, // Display placeholder while error
        );
      },
    );
  }
}
