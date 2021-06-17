import 'package:flutter/material.dart';
import 'package:movie_app/shared/global/end_points.dart';

class PageHeader extends StatelessWidget {
  PageHeader({required this.selectedCategory});

  final String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Movies / ',
                  style: TextStyle(
                      color: kMainLightColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Teko_Bold',
                      letterSpacing: 1.2),
                ),
                TextSpan(
                  text: selectedCategory,
                  style: TextStyle(
                      color: kMainLightColor.withOpacity(0.7),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Teko_Medium',
                      letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            color: kMainLightColor,
            size: 25.0,
          ),
        ],
      ),
    );
  }
}
