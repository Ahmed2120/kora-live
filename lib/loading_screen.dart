import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return const Rectangular();
        },
      );
  }
}

class Rectangular extends StatelessWidget {
  const Rectangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      // height: 20,
      color: Colors.grey[350],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[200]!,
              child: buildContainer(size.width * 0.1, size.height * 0.06)),
          Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[200]!,
              child: buildContainer(size.width * 0.2, size.height * 0.02)),
          Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[200]!,
              child: buildContainer(size.width * 0.1, size.height * 0.06)),
          Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[200]!,
              child: buildContainer(size.width * 0.2, size.height * 0.02)),
          Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[200]!,
              child: buildContainer(size.width * 0.1, size.height * 0.06)),
        ],
      ),
    );
  }

  Container buildContainer(double width, double height ) {
    return Container(
              width: width,
              height: height,
              color: Colors.grey,
            );
  }
}
