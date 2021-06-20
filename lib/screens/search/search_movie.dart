import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/search/results_search.dart';
import 'package:movie_app/screens/search/search_bar.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/responsive.dart';

class SearchMovie extends StatelessWidget {
  const SearchMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchModel = AppCubit.get(context).searchModel ;
        return Padding(
          padding: EdgeInsets.all(Responsive().height(2, context)),
          child: Column(
            children: [
              SearchBar(
                isMovie: true,
              ),
              SizedBox(
                height: Responsive().height(2, context),
              ),
                ConditionalBuilder(
                    condition: searchModel != null,
                    builder: (context)=>ResultsOfSearch(searchModel: searchModel,)),
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
