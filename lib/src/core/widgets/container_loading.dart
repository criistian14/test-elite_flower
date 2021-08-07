import 'package:testeliteflower/src/core/theme/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerLoading extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape shape;
  final EdgeInsets? margin;

  ContainerLoading({
    Key? key,
    required this.height,
    required this.width,
    this.shape = BoxShape.rectangle,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: Shimmer.fromColors(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            shape: shape,
          ),
        ),
        baseColor: Theme.of(context).colorScheme.baseColorLoading,
        highlightColor: Theme.of(context).colorScheme.highlightColorLoading,
      ),
    );
  }
}
