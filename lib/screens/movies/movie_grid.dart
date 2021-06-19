// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/movies/movie_card.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';

class MoviesGrid extends StatelessWidget {
  final MovieModel? model;

  const MoviesGrid({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: true,
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
            builder: (context) => GridView.builder(
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
                    return MovieCard(
                      model: model!.results![index],
                    );
                  },
                ));
      },
    );
  }
}
