// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/search/search_bar.dart';
import 'package:movie_app/screens/search/tv_search/result_tv.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/responsive.dart';

class SearchTvShows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchTvModel = AppCubit.get(context).searchTvModel;
        return Padding(
          padding: EdgeInsets.all(Responsive().height(2, context)),
          child: Column(
            children: [
              SearchBar(
                isMovie: false,
              ),
              SizedBox(
                height: Responsive().height(2, context),
              ),
              ConditionalBuilder(
                condition: searchTvModel != null,
                builder: (context) => ResultsOfSearchTv(
                  searchTvModel: searchTvModel,
                ),
              ),
              SizedBox(
                height: Responsive().height(3, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
