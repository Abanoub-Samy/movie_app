import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/movies/movie_details/details_screen.dart';
import 'package:movie_app/shared/global/end_points.dart';

class MovieCard extends StatefulWidget {
  final Results model;

  MovieCard({Key? key, required this.model}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    type: 'movie-details',
                    data: widget.model,
                  )),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kSecondDarkColor,
          borderRadius: BorderRadius.circular(7.0),
          image: DecorationImage(
            image: (widget.model.posterPath != null)
                ? NetworkImage(kCroppedPosterBaseURL +
                    widget.model.posterPath.toString()) as ImageProvider
                : AssetImage('images/placeholder.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
