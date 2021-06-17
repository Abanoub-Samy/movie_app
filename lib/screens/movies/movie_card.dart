import 'package:flutter/material.dart';
import 'package:movie_app/shared/global/end_points.dart';

class MovieCard extends StatefulWidget {
  final ImageProvider image;

  const MovieCard({
    required this.image,
  });

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  IconData _likeIcon = Icons.favorite_border;
  Color _likeIconColor = kSecondLightColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _likeIcon = _likeIcon == Icons.favorite_border
                ? Icons.favorite
                : Icons.favorite_border;
            _likeIconColor = _likeIconColor == kSecondLightColor
                ? kAccentColor
                : kSecondLightColor;
          });
        },
        child: Icon(
          _likeIcon,
          color: _likeIconColor,
          size: 30,
        ),
      ),
      decoration: BoxDecoration(
        color: kSecondDarkColor,
        borderRadius: BorderRadius.circular(7.0),
        image: DecorationImage(
          image: widget.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
