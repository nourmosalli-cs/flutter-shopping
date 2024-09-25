import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading1 extends StatelessWidget {
  const ShimmerLoading1({
    Key? key,
    //  required this.itemCount,
    this.height = 130.0,
    this.width = 460.0,
    this.margin = const EdgeInsets.all(8.0),
  }) : super(key: key);

  //final int itemCount; // Specify the number of shimmer items to display
  final double height;
  final double width;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
