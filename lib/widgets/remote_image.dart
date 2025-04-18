import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'loader.dart';

class ImageFromUrl extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final Widget? placeholder;

  const ImageFromUrl({
    super.key,
    this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.radius,
    this.borderRadius,
    this.fit,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if ((imageUrl == null) || ((imageUrl ?? '').isEmpty)) {
      return SizedBox(
        width: width,
        height: height,
        child: placeholder ?? defaultPlaceholder(),
      );
    }

    // return ClipRRect(
    //   borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
    //   child: Image.network(
    //     imageUrl!,
    //     width: width,
    //     height: height,
    //     fit: fit,
    //     loadingBuilder: (
    //       BuildContext context,
    //       Widget child,
    //       ImageChunkEvent? loadingProgress,
    //     ) {
    //       if (loadingProgress == null) {
    //         return child; // Display the image when loading is complete
    //       } else {
    //         return SizedBox(
    //           width: width,
    //           height: height,
    //           child: const Loader(),
    //         );
    //       }
    //     },
    //     errorBuilder:
    //         (BuildContext context, Object error, StackTrace? stackTrace) {
    //       return SizedBox(
    //           width: width,
    //           height: height,
    //           child: placeholder ?? defaultPlaceholder());
    //     },
    //   ),
    // );
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, __) => SizedBox(
          width: width,
          height: height,
          child: placeholder ?? const Loader(),
        ),
        errorWidget: (_, __, ___) => SizedBox(
          width: width,
          height: height,
          child: placeholder ?? defaultPlaceholder(),
        ),
      ),
    );
  }

  Widget defaultPlaceholder() {
    return ColorFiltered(
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
  }
}
