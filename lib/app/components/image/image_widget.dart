// import 'package:extended_image/extended_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// checkImageLoadState(ExtendedImageState state) {
//   switch (state.extendedImageLoadState) {
//     case LoadState.completed:
//       // print("Image Load completely");
//       return null;
//     case LoadState.loading:
//       // print("Image Still Loading...");
//       return CupertinoActivityIndicator();

//     case LoadState.failed:
//       // print("Image Load Failed");
//       return SvgPicture.asset(
//         AppAsset.logo,
//         fit: BoxFit.cover,
//         color: appColor,
//         alignment: Alignment.center,
//         // height: 50,
//         // width: 50,
//       );
//   }
// }

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  NetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      color: color,
      imageUrl: imageUrl!,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Lottie.asset(
        'assets/json/loader.json',
        height: 100,
        width: 100,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
    // return ExtendedImage.network(
    //   imageUrl!,
    //   // width: ScreenUtil.instance.setWidth(400),
    //   // height: ScreenUtil.instance.setWidth(400),
    //   fit: fit ?? BoxFit.cover,
    //   height: height,
    //   width: width,
    //   color: color,
    //   cache: true,
    //   clearMemoryCacheIfFailed: true,
    //   enableMemoryCache: true,
    //   handleLoadingProgress: false,
    //   loadStateChanged: (state) => checkImageLoadState(state),
    //   // loadStateChanged: (ExtendedImageState state) {
    //   //   switch (state.extendedImageLoadState) {
    //   //     case LoadState.loading:
    //   //       return CupertinoActivityIndicator();

    //   //     ///if you don't want override completed widget
    //   //     ///please return null or state.completedWidget
    //   //     // return null;
    //   //     // return state.completedWidget;

    //   //     case LoadState.completed:
    //   //       return null;
    //   //     case LoadState.failed:
    //   //       return Image.asset(
    //   //         "assets/images/pvr_logo.png",
    //   //         fit: BoxFit.fill,
    //   //         height: 50,
    //   //         width: 50,
    //   //       );
    //   //   }
    //   // },
    //   // borderRadius: borderRadius ??
    //   //     BorderRadius.only(
    //   //       topLeft: Radius.circular(8),
    //   //       topRight: Radius.circular(8),
    //   //     ),
    //   borderRadius: circular5BorderRadius,
    // );
  }
}

// class CarouselImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double? height;
//   final double? width;
//   final Color? color;
//   CarouselImageWidget({
//     Key? key,
//     this.height,
//     this.width,
//     this.color,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       // width: ScreenUtil.instance.setWidth(400),
//       // height: ScreenUtil.instance.setWidth(400),
//       fit: BoxFit.cover,
//       cache: true,
//       loadStateChanged: (state) => checkImageLoadState(state),
//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       border: Border.all(color: primaryBlack, width: 1.0),
//       shape: BoxShape.circle,
//       handleLoadingProgress: false,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(21),
//         topRight: Radius.circular(21),
//       ),
//     );
//   }
// }

// class CircleNetworkImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final Border? border;

//   CircleNetworkImageWidget({Key? key, required this.imageUrl, this.border})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       fit: BoxFit.cover,
//       cache: true,

//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       border: border, //?? Border.all(color: blackGreyColor, width: 1.0),
//       shape: BoxShape.circle,
//       handleLoadingProgress: false,
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//       loadStateChanged: (state) => checkImageLoadState(state),
//     );
//   }
// }

// class SliderImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double? height;
//   final double? width;
//   SliderImageWidget({
//     Key? key,
//     this.height,
//     this.width,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       // width: ScreenUtil.instance.setWidth(400),
//       // height: ScreenUtil.instance.setWidth(400),
//       fit: BoxFit.cover,
//       cache: false,
//       height: height,
//       width: width,

//       loadStateChanged: (state) => checkImageLoadState(state),
//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       border: Border.all(color: primaryBlack, width: 1.0),
//       shape: BoxShape.circle,
//       handleLoadingProgress: false,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30),
//         topRight: Radius.circular(30),
//       ),
//     );
//   }
// }

// class SquareNetworkImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double? height, width;
//   SquareNetworkImageWidget(
//       {Key? key, required this.imageUrl, this.height, this.width})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       width: width ?? 80,
//       height: height ?? 100,
//       fit: BoxFit.cover,
//       cache: true,
//       loadStateChanged: (state) => checkImageLoadState(state),
//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       handleLoadingProgress: false,
//       borderRadius: circular5BorderRadius,
//     );
//   }
// }

// class SVGAseetsImageWidget extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String? imagePath;
//   final Color? imageColor;
//   const SVGAseetsImageWidget({
//     Key? key,
//     required this.imagePath,
//     this.imageColor,
//     this.height,
//     this.width,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SvgPicture.asset(
//         imagePath.toString(),
//         height: height ?? 30,
//         width: width ?? 50,
//         alignment: Alignment.center,
//         allowDrawingOutsideViewBox: true,
//         color: imageColor,
//       ),
//     );
//   }
// }
