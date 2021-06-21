import 'package:flutter/material.dart';
import 'package:movie_app/models/tv_model.dart';
import 'package:movie_app/screens/movies/movie_details/details_screen.dart';
import 'package:movie_app/shared/global/end_points.dart';

class TvMovieCard extends StatelessWidget {
  final TvResults model;

  const TvMovieCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData _likeIcon = Icons.favorite_border;
    Color _likeIconColor = kSecondLightColor;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    type: 'tv-details',
                    data: model,
                  )),
        );
      },
      child: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            _likeIcon = _likeIcon == Icons.favorite_border
                ? Icons.favorite
                : Icons.favorite_border;
            _likeIconColor = _likeIconColor == kSecondLightColor
                ? kAccentColor
                : kSecondLightColor;
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
            image: (model.posterPath != null)
                ? NetworkImage(
                        kCroppedPosterBaseURL + model.posterPath.toString())
                    as ImageProvider
                : AssetImage('images/placeholder.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
