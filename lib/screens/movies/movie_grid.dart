// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/movies/movie_card.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/end_points.dart';

class MoviesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
                        image: (cubit.movieModel!.results![index].posterPath !=
                                null)
                            ? NetworkImage(kCroppedPosterBaseURL +
                                cubit.movieModel!.results![index].posterPath
                                    .toString()) as ImageProvider
                            : AssetImage('images/placeholder.png'));
                  },
                ));
      },
    );
  }
}
