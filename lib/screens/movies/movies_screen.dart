// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/movies/category_selector.dart';
import 'package:movie_app/screens/movies/movie_grid.dart';
import 'package:movie_app/screens/movies/page_header.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getMoviesByCategory();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            color: Colors.black54,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    buildHeaderSliverList(context),
                    ConditionalBuilder(
                      condition: state is GetCategorySuccessState,
                      fallback: (context) => Center(
                        child: LinearProgressIndicator(
                          color: Colors.green,
                          minHeight: 5,
                        ),
                      ),
                      builder: (context) => MoviesGrid(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeaderSliverList(context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PageHeader(selectedCategory: AppCubit.get(context).selectedCategory),
          // TrendingMoviesSwiper(
          //     future: AppCubit.get(context).getMoviesByCategory(kTrendingMovies)),
          CategorySelector(
            categoryList: AppCubit.get(context).categoryList,
            onClick: (selectedCategory) {
              AppCubit.get(context).selectedCategory = selectedCategory;
              AppCubit.get(context).getMoviesByCategory();
              // _movieFuture = AppCubit.get(context).movieModel;
            },
          ),
        ],
      ),
    );
  }
}
