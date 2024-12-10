import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  const ImageFromUrl(
      {super.key,
      this.imageUrl,
      this.width = double.infinity,
      this.height = double.infinity,
      this.radius,
      this.borderRadius,
      this.fit});

  @override
  Widget build(BuildContext context) {
    Widget defaultPlaceholder = ColorFiltered(
      colorFilter: const ColorFilter.mode(Color(0xFFD8D8D8), BlendMode.srcIn),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
        child: Image.asset(
          "assets/images/logo.png",
          height: height,
          width: width,
          fit: fit,
        ),
      ),
    );

    if ((imageUrl == null) || ((imageUrl ?? '').isEmpty)) {
      return SizedBox(
        width: width,
        height: height,
        child: defaultPlaceholder,
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
      child: Image.network(
        imageUrl!,
        width: width,
        height: height,
        fit: fit,
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
      ),
    );
  }
}
