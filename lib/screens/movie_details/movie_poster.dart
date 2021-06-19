import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class MoviePoster extends StatelessWidget {
  final Results model;

  MoviePoster({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: double.infinity,
          height: Responsive().height(50, context),
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
            child: Image(
              image: NetworkImage(
                kCroppedPosterBaseURL + model.posterPath.toString(),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: Responsive().width(20, context)),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Responsive().height(5, context)),
                bottomLeft: Radius.circular(Responsive().height(5, context)),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().width(4, context),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: Responsive().height(3.5, context),
                    ),
                    SizedBox(
                      height: Responsive().height(.5, context),
                    ),
                    Row(
                      children: [
                        Text(
                          '${model.voteAverage}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive().width(3, context),
                          ),
                        ),
                        Text(
                          '/10',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Responsive().width(2.5, context),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.star_border,
                        size: Responsive().height(4, context),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: Responsive().height(.5, context),
                    ),
                    Text(
                      'Rate This',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive().width(3, context),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.portrait_outlined,
                      color: Colors.black,
                      size: Responsive().height(4, context),
                    ),
                    SizedBox(
                      height: Responsive().height(.5, context),
                    ),
                    Text(
                      '${model.popularity}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive().width(3, context),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
