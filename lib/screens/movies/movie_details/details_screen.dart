import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart' as movie;
import 'package:movie_app/models/search_model.dart' as searchMovie;
import 'package:movie_app/models/tv_model.dart' as tv;
import 'package:movie_app/models/search_tv.dart' as searchTv;
import 'package:movie_app/screens/movies/movie_details/details.dart';
import 'package:movie_app/screens/movies/movie_details/movie_poster.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class DetailsScreen extends StatelessWidget {
  final String type;
  final dynamic data;

  const DetailsScreen({required this.type, required this.data});

  @override
  Widget build(BuildContext context) {
    var model;
    bool? isMovie;
    if (type == 'movie-details') {
      model = data as movie.Results;
      isMovie = true;
    } else if (type == 'search-movie') {
      model = data as searchMovie.SearchResults;
    } else if (type == 'tv-details') {
      model = model = data as tv.TvResults;
      isMovie = false;
    } else if (type == 'search-tv') {
      model = model = data as searchTv.Results;
      isMovie = false;
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MoviePoster(
                model: model,
              ),
              SizedBox(
                height: Responsive().height(2, context),
              ),
              Details(
                model: model,
                isMovie: isMovie,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Responsive().height(25, context),
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: Responsive().height(9, context),
                          backgroundImage: AssetImage(
                            'assets/images/placeperson.png',
                          ),
                        ),
                        Text(
                          'abanoub',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: Responsive().height(3, context),
                          ),
                        ),
                        Text(
                          'Spider Man',
                          style: TextStyle(
                            color: kSecondLightColor,
                            fontSize: Responsive().height(2, context),
                          ),
                        )
                      ],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: Responsive().width(2, context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Responsive().height(2, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
