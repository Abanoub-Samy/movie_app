import 'package:flutter/material.dart';
import 'package:movie_app/shared/global/end_points.dart';

class IndexIndicator extends StatelessWidget {
  final int current;
  final int length;

  const IndexIndicator({Key? key, required this.current, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: current == index ? 9.0 : 6.0,
              height: current == index ? 9.0 : 6.0,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == index ? kGoldInkColor : kSecondLightColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
