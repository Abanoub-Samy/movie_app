import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/tv_model.dart';
import 'package:movie_app/screens/tv_shows/tv_movie_card.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';

class TvMoviesGrid extends StatelessWidget {
  final TvModel? model;

  const TvMoviesGrid({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0),
          itemCount: 20,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          primary: false,
          itemBuilder: (context, index) {
            return TvMovieCard(
              model: model!.results![index],
            );
          },
        );
      },
    );
  }
}
